#define INIT_ORDER_UNIFIED 70

SUBSYSTEM_DEF(unified)
	name = "Unified"
	init_order = INIT_ORDER_UNIFIED
	runlevels = RUNLEVEL_GAME
	flags = SS_BACKGROUND | SS_KEEP_TIMING
	wait = 2 SECONDS

	/// Next process for our storyteller. The wait time is STORYTELLER_WAIT_TIME
	var/next_process = 0

	/// Our total event point budget for the shift. Initialized in pre_setup()
	var/points = 0
	/// Our starting event point budget for the shift. Initialized in pre_setup()
	var/starting_points = 0

	/// The times after which we can schedule another event
	var/list/cooldown_dates = list(0, 0)

	/// Whether we allow pop scaling. This is configured by config, or the storyteller UI
	var/allow_pop_scaling = TRUE

	/// Events that we have scheduled to run in the nearby future
	var/list/scheduled_events = list()

	/// For admins to force events (though they can still invoke them freely outside of the track system)
	var/datum/round_event_control/forced_next_event

	var/list/control = list() //list of all datum/round_event_control. Used for selecting events based on weight and occurrences.
	var/list/running = list() //list of all existing /datum/round_event
	var/list/currentrun = list()

	/// List of all uncategorized events, because they were wizard or holiday events
	var/list/uncategorized = list()

	var/list/holidays //List of all holidays occuring today or null if no holidays

	/// Event frequency multiplier, it exists because wizard, eugh.
	var/event_frequency_multiplier = 1

	/// Current preview page for the statistics UI.
	var/statistics_track_page = EVENT_TRACK_MUNDANE
	/// Page of the UI panel.
	var/panel_page = UNIFIED_PANEL_MAIN
	/// Whether we are viewing the roundstart events or not
	var/roundstart_event_view = TRUE

	/// Whether the gamemode has been halted
	var/halted = FALSE

	/// Ready players for roundstart events.
	var/ready_players = 0
	var/active_players = 0
	var/head_crew = 0
	var/eng_crew = 0
	var/sec_crew = 0
	var/med_crew = 0
	var/sci_crew = 0

	var/wizardmode = FALSE

	var/storyteller_voted = FALSE

	/// Whether we account for currently filled jobs when scheduling events TODO add to config
	var/allow_job_weighting = TRUE

	// TODO add to config
	var/antag_divisor = 8

	/// % chance of having an antag created at roundstart
	var/roundstart_event_chance = 40

	/// List of all datum/round_event_control with roundstart=true.
	var/list/roundstart_control = list()

/datum/controller/subsystem/unified/Initialize(time, zlevel)
	for(var/type in typesof(/datum/round_event_control))
		var/datum/round_event_control/event = new type()
		if(!event.typepath || !event.name || !event.valid_for_map())
			continue //don't want this one! leave it for the garbage collector
		if(event.roundstart)
			roundstart_control += event
		else
			control += event //add it to the list of all events (controls)
	getHoliday()

	load_config_vars()
	load_event_config_vars()

/datum/controller/subsystem/unified/fire(resumed = FALSE)
	if(!resumed)
		src.currentrun = running.Copy()

	///Handle scheduled events
	for(var/datum/scheduled_event/sch_event in scheduled_events)
		if(world.time >= sch_event.start_time)
			sch_event.try_fire()
		else if(!sch_event.alerted_admins && world.time >= sch_event.start_time - 1 MINUTES)
			///Alert admins 1 minute before running and allow them to cancel or refund the event, once again.
			sch_event.alerted_admins = TRUE
			message_admins("Scheduled Event: [sch_event.event] will run in [(sch_event.start_time - world.time) / 10] seconds. (<a href='?src=[REF(sch_event)];action=cancel'>CANCEL</a>) (<a href='?src=[REF(sch_event)];action=refund'>REFUND</a>)")

	var/crew_info_updated = FALSE
	if(!halted)
		for(var/cooldown_date in cooldowns)
			if(cooldown_date <= world.time)
				if(!crew_info_updated)
					update_crew_infos()
					crew_info_updated = TRUE
				add_event()

	//cache for sanic speed (lists are references anyways)
	var/list/currentrun = src.currentrun

	while(currentrun.len)
		var/datum/thing = currentrun[currentrun.len]
		currentrun.len--
		if(thing)
			thing.process(wait * 0.1)
		else
			running.Remove(thing)
		if (MC_TICK_CHECK)
			return

/datum/controller/subsystem/unified/proc/buy_event(list/events, run_now = FALSE)
	. = FALSE

	var/datum/round_event_control/picked_event
	var/candidate_events = events
	var/player_pop = SSunified.get_correct_popcount()
	calculate_weights(candidate_events)
	calculate_costs(candidate_events)
	var/list/valid_events = list()
	// Determine which events are valid to pick

	for(var/datum/round_event_control/event as anything in candidate_events)
		if(isnull(event))
			continue
		if(event.unified_cost == 0) // free events are handled in handle_free_events
			continue
		if(event.can_spawn_event(player_pop))
			valid_events[event] = event.calculated_weight
	if(!length(valid_events))
		if(SSticker.HasRoundStarted())
			message_admins("Unified failed to pick an event.")
			log_admin("Unified failed to pick an event.")
		return
	picked_event = pick_weight(valid_events)
	if(!picked_event)
		message_admins("WARNING: Unified picked a null from event pool. Aborting event roll.")
		log_admin("WARNING: Unified picked a null from event pool. Aborting event roll.")
		stack_trace("WARNING: Unified picked a null from event pool.")
		return

	points -= picked_event.calculated_cost // we already know that valid events cost less than our current points
	message_admins("Unified purchased and triggered [picked_event] event for [picked_event.calculated_cost] cost.")
	log_admin("Unified purchased and triggered [picked_event] event for [picked_event.calculated_cost] cost.")
	if(picked_event.roundstart || run_now)
		TriggerEvent(picked_event)
	else
		schedule_event(picked_event, 3 MINUTES, picked_event.calculated_cost) // We already randomize cooldown, we don't need to randomize this

	. = TRUE

/datum/controller/subsystem/unified/proc/calculate_costs(list/events)
	for(var/datum/round_event_control/event in events)
		var/total_cost = event.unified_cost
		if(allow_job_weighting)
			var/job_cost = 1
			if((TAG_ENGINEERING in event.tags) && eng_crew == 0)
				job_cost *= 2
			if((TAG_MEDICAL in event.tags) && med_crew == 0)
				job_cost *= 2
			if((TAG_SECURITY in event.tags) && sec_crew == 0)
				job_cost *= 2
			if((TAG_SCIENCE in event.tags) && sci_crew == 0)
				job_cost *= 2
			total_cost *= job_cost
		if(istype(event, /datum/round_event_control/antagonist))
			total_cost /= get_antag_cap()
		event.calculated_cost = total_cost

/datum/controller/subsystem/unified/proc/calculate_weights(list/events)
	for(var/datum/round_event_control/event in events)
		var/weight_total = event.weight
		if(allow_job_weighting)
			var/job_weighting = 1
			if((TAG_ENGINEERING in event.tags) && eng_crew == 0)
				job_weighting *= 0.5
			if((TAG_MEDICAL in event.tags) && med_crew == 0)
				job_weighting *= 0.5
			if((TAG_SECURITY in event.tags) && sec_crew == 0)
				job_weighting *= 0.5
			if((TAG_SCIENCE in event.tags) && sci_crew == 0)
				job_weighting *= 0.5
			if(job_weighting != 1 && head_crew == 0)
				job_weighting = 0
			weight_total *= job_weighting
		/// Apply occurence multipliers if able
		var/occurences = event.get_occurences()
		if(occurences)
			///If the event has occured already, apply a penalty multiplier based on amount of occurences
			weight_total *= event.reoccurence_penalty_multiplier ** occurences
		/// Write it
		event.calculated_weight = weight_total

/// Gets the number of antagonists the antagonist injection events will stop rolling after.
/datum/controller/subsystem/unified/proc/get_antag_cap()
	return round(max(min(get_correct_popcount() / antag_divisor + sec_crew,sec_crew*1.5),ANTAG_CAP_FLAT))

/// Whether events can inject more antagonists into the round
/datum/controller/subsystem/unified/proc/can_inject_antags()
	return (get_antag_cap() > length(GLOB.antagonists))

/// Gets candidates for antagonist roles.

/// Todo: Split into get_candidates and post_get_candidates
/datum/controller/subsystem/unified/proc/get_candidates(
	special_role_flag,
	pick_observers,
	pick_roundstart_players,
	required_time,
	inherit_required_time = TRUE,
	no_antags = TRUE,
	list/restricted_roles,
	)


	var/list/candidates = list()
	var/list/candidate_candidates = list() //lol
	if(pick_roundstart_players)
		for(var/mob/dead/new_player/player in GLOB.new_player_list)
			if(player.ready == PLAYER_READY_TO_PLAY && player.mind && player.check_preferences())
				candidate_candidates += player
	else if(pick_observers)
		for(var/mob/player as anything in GLOB.dead_mob_list)
			candidate_candidates += player
	else
		for(var/datum/record/locked/manifest_log as anything in GLOB.manifest.locked)
			var/datum/mind/player_mind = manifest_log.mind_ref.resolve()
			var/mob/living/player = player_mind.current
			if(isnull(player))
				continue
			candidate_candidates += player


	for(var/mob/candidate as anything in candidate_candidates)
		if(QDELETED(candidate) || !candidate.key || !candidate.client || !candidate.mind)
			continue
		if(no_antags && candidate.mind.special_role)
			continue
		if(restricted_roles && (candidate.mind.assigned_role.title in restricted_roles))
			continue
		if(special_role_flag)
			if(!(candidate.client.prefs) || !(special_role_flag in candidate.client.prefs.be_special))
				continue

			var/time_to_check
			if(required_time)
				time_to_check = required_time
			else if (inherit_required_time)
				time_to_check = GLOB.special_roles[special_role_flag]

			if(time_to_check && candidate.client.get_remaining_days(time_to_check) > 0)
				continue

		if(special_role_flag && is_banned_from(candidate.ckey, list(special_role_flag, ROLE_SYNDICATE)))
			continue
		if(is_banned_from(candidate.client.ckey, BAN_ANTAGONIST))
			continue
		if(!candidate.client?.prefs?.read_preference(/datum/preference/toggle/be_antag))
			continue
		candidates += candidate
	return candidates

/// Gets the correct popcount, returning READY people if roundstart, and active people if not.
/datum/controller/subsystem/unified/proc/get_correct_popcount()
	if(SSticker.HasRoundStarted())
		update_crew_infos()
		return active_players
	else
		update_ready_crew_infos()
		return ready_players

/// Refunds and removes a scheduled event, then buys another.
/datum/controller/subsystem/unified/proc/refund_scheduled_event(datum/scheduled_event/refunded)
	points += refunded.cost
	remove_scheduled_event(refunded)
	buy_event(TRUE)

/// Refunds a failed event, then buys another.
/datum/controller/subsystem/unified/proc/refund_failed_event(datum/round_event_control/failed)
	points += failed.calculated_cost
	// TODO change cooldown

/// Schedules an event.
/datum/controller/subsystem/unified/proc/force_event(datum/round_event_control/event)
	forced_next_event = event

/// Removes a scheduled event.
/datum/controller/subsystem/unified/proc/remove_scheduled_event(datum/scheduled_event/removed)
	scheduled_events -= removed
	qdel(removed)

/// Because roundstart events need 2 steps of firing for purposes of antags, here is the first step handled, happening before occupation division.
/datum/controller/subsystem/unified/proc/add_round_events()
	if(halted)
		message_admins("WARNING: Didn't roll any events (including antagonists) due to Unified being halted.")
		return
	var/crew_info_updated = FALSE
	for(var/i in 1 to get_antag_cap())
		if(prob(roundstart_event_chance))
			if(!crew_info_updated)
				update_crew_info()
				crew_info_updated = TRUE
			buy_event(roundstart_control)

/// Second step of handlind roundstart events, happening after people spawn.
/datum/controller/subsystem/unified/proc/handle_post_setup_roundstart_events()
	/// Start all roundstart events on post_setup immediately
	for(var/datum/round_event/event as anything in running)
		if(!event.control.roundstart)
			continue
		ASYNC
			event.try_start()

/// Schedules an event to run later.
/datum/controller/subsystem/unified/proc/schedule_event(datum/round_event_control/passed_event, passed_time, passed_cost, passed_ignore, passed_announce)
	var/datum/scheduled_event/scheduled = new (passed_event, world.time + passed_time, passed_cost, passed_ignore, passed_announce)
	message_admins("Event: [passed_event] has been scheduled to run in [passed_time / 10] seconds. (<a href='?src=[REF(scheduled)];action=cancel'>CANCEL</a>) (<a href='?src=[REF(scheduled)];action=refund'>REFUND</a>)")
	scheduled_events += scheduled

/datum/controller/subsystem/unified/proc/update_crew_infos()
	// Very similar logic to `get_active_player_count()`
	active_players = 0
	head_crew = 0
	eng_crew = 0
	med_crew = 0
	sec_crew = 0
	sci_crew = 0
	for(var/mob/player_mob as anything in GLOB.player_list)
		if(!player_mob.client)
			continue
		if(player_mob.stat) //If they're alive
			continue
		if(player_mob.client.is_afk()) //If afk
			continue
		if(!ishuman(player_mob))
			continue
		active_players++
		if(player_mob.mind?.assigned_role)
			var/datum/job/player_role = player_mob.mind.assigned_role
			if(player_role.departments_bitflags & DEPARTMENT_BITFLAG_COMMAND)
				head_crew++
			if(player_role.departments_bitflags & DEPARTMENT_BITFLAG_ENGINEERING)
				eng_crew++
			if(player_role.departments_bitflags & DEPARTMENT_BITFLAG_MEDICAL)
				med_crew++
			if(player_role.departments_bitflags & DEPARTMENT_BITFLAG_SECURITY)
				sec_crew++
			if(player_role.departments_bitflags & DEPARTMENT_BITFLAG_SCIENCE)
				sci_crew++
	// update_pop_scaling() TODO FIX

/datum/controller/subsystem/unified/proc/update_ready_crew_infos()
	// Very similar logic to `get_active_player_count()`
	ready_players = 0
	head_crew = 0
	eng_crew = 0
	med_crew = 0
	sec_crew = 0
	sci_crew = 0
	var/list/players = list()

	//This fills the readied players list that the job estimation panel uses.
	for(var/mob/dead/new_player/player as anything in GLOB.new_player_list)
		if(player.ready == PLAYER_READY_TO_PLAY)
			players[player.key] = player
			ready_players++
			ready_players++
		sortTim(players, GLOBAL_PROC_REF(cmp_text_asc))

	for(var/ckey in players)
		var/mob/dead/new_player/player = players[ckey]
		var/datum/preferences/prefs = player.client?.prefs
		var/datum/job/J = prefs?.get_highest_priority_job()
		if(J.departments_bitflags & DEPARTMENT_BITFLAG_COMMAND)
			head_crew++
		if(J.departments_bitflags & DEPARTMENT_BITFLAG_ENGINEERING)
			eng_crew++
		if(J.departments_bitflags & DEPARTMENT_BITFLAG_MEDICAL)
			med_crew++
		if(J.departments_bitflags & DEPARTMENT_BITFLAG_SECURITY)
			sec_crew++
		if(J.departments_bitflags & DEPARTMENT_BITFLAG_SCIENCE)
			sci_crew++

/* TODO FIX
/datum/controller/subsystem/unified/proc/update_pop_scaling()
	for(var/track in event_tracks)
		var/low_pop_bound = min_pop_thresholds[track]
		var/high_pop_bound = pop_scale_thresholds[track]
		var/scale_penalty = pop_scale_penalties[track]

		var/perceived_pop = min(max(low_pop_bound, active_players), high_pop_bound)

		var/divisor = high_pop_bound - low_pop_bound
		/// If the bounds are equal, we'd be dividing by zero or worse, if upper is smaller than lower, we'd be increasing the factor, just make it 1 and continue.
		/// this is only a problem for bad configs
		if(divisor <= 0)
			current_pop_scale_multipliers[track] = 1
			continue
		var/scalar = (perceived_pop - low_pop_bound) / divisor
		var/penalty = scale_penalty - (scale_penalty * scalar)
		var/calculated_multiplier = 1 - (penalty / 100)

		current_pop_scale_multipliers[track] = calculated_multiplier
*/

/datum/controller/subsystem/unified/proc/TriggerEvent(datum/round_event_control/event)
	. = event.preRunEvent()
	if(. == EVENT_CANT_RUN)//we couldn't run this event for some reason, set its max_occurrences to 0
		event.max_occurrences = 0
	else if(. == EVENT_READY)
		event.run_event(random = TRUE) // fallback to dynamic

///Resets frequency multiplier.
/datum/controller/subsystem/unified/proc/resetFrequency()
	event_frequency_multiplier = 1


//////////////
// HOLIDAYS //
//////////////
//Uncommenting ALLOW_HOLIDAYS in config.txt will enable holidays

//It's easy to add stuff. Just add a holiday datum in code/modules/holiday/holidays.dm
//You can then check if it's a special day in any code in the game by doing if(SSunified.holidays["Groundhog Day"])

//You can also make holiday random events easily thanks to Pete/Gia's system.
//simply make a random event normally, then assign it a holidayID string which matches the holiday's name.
//Anything with a holidayID, which isn't in the holidays list, will never occur.

//Please, Don't spam stuff up with stupid stuff (key example being april-fools Pooh/ERP/etc),
//And don't forget: CHECK YOUR CODE!!!! We don't want any zero-day bugs which happen only on holidays and never get found/fixed!

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//ALSO, MOST IMPORTANTLY: Don't add stupid stuff! Discuss bonus content with Project-Heads first please!//
//////////////////////////////////////////////////////////////////////////////////////////////////////////


//sets up the holidays and holidays list
/datum/controller/subsystem/unified/proc/getHoliday()
	if(!CONFIG_GET(flag/allow_holidays))
		return // Holiday stuff was not enabled in the config!
	for(var/H in subtypesof(/datum/holiday))
		var/datum/holiday/holiday = new H()
		var/delete_holiday = TRUE
		for(var/timezone in holiday.timezones)
			var/time_in_timezone = world.realtime + timezone HOURS

			var/YYYY = text2num(time2text(time_in_timezone, "YYYY")) // get the current year
			var/MM = text2num(time2text(time_in_timezone, "MM")) // get the current month
			var/DD = text2num(time2text(time_in_timezone, "DD")) // get the current day
			var/DDD = time2text(time_in_timezone, "DDD") // get the current weekday

			if(holiday.shouldCelebrate(DD, MM, YYYY, DDD))
				holiday.celebrate()
				LAZYSET(holidays, holiday.name, holiday)
				delete_holiday = FALSE
				break
		if(delete_holiday)
			qdel(holiday)

	if(holidays)
		holidays = shuffle(holidays)
		// regenerate station name because holiday prefixes.
		set_station_name(new_station_name())
		world.update_status()

/datum/controller/subsystem/unified/proc/toggleWizardmode()
	wizardmode = !wizardmode //TODO: decide what to do with wiz events
	message_admins("Summon Events has been [wizardmode ? "enabled, events will occur [SSunified.event_frequency_multiplier] times as fast" : "disabled"]!")
	log_game("Summon Events was [wizardmode ? "enabled" : "disabled"]!")

///Attempts to select players for special roles the mode might have.
/datum/controller/subsystem/unified/proc/pre_setup()
	// We need to do this to prevent some niche fuckery... and make dep. orders work. Lol
	SSjob.ResetOccupations()
	handle_pre_setup_roundstart_events()
	starting_points = rand(BASE_POINTS*0.5, BASE_POINTS*1.5)
	points = starting_points
	cooldown_dates[1] = world.time + STARTING_DELAY
	for(var/i in 2 to cooldown_dates.len)
		cooldown_dates[i] = cooldown_dates[i-1] + rand(0, STARTING_DELAY)
	log_game("Unified: Point budget is [starting_points], starting cooldown is [round(cooldown, 0.01)] minutes.")
	message_admins("Unified: Point budget is [starting_points], starting cooldown is [round(cooldown, 0.01)] minutes.")
	return TRUE

///Everyone should now be on the station and have their normal gear.  This is the place to give the special roles extra things
/datum/controller/subsystem/unified/proc/post_setup(report) //Gamemodes can override the intercept report. Passing TRUE as the argument will force a report.
	if(!report)
		report = !CONFIG_GET(flag/no_intercept_report)
	addtimer(CALLBACK(src, PROC_REF(display_roundstart_logout_report)), ROUNDSTART_LOGOUT_REPORT_TIME)

	if(SSdbcore.Connect())
		var/list/to_set = list()
		var/arguments = list()
		to_set += "game_mode = :game_mode"
		arguments["game_mode"] = "Unified"
		if(GLOB.revdata.originmastercommit)
			to_set += "commit_hash = :commit_hash"
			arguments["commit_hash"] = GLOB.revdata.originmastercommit
		if(to_set.len)
			arguments["round_id"] = GLOB.round_id
			var/datum/db_query/query_round_game_mode = SSdbcore.NewQuery(
				"UPDATE [format_table_name("round")] SET [to_set.Join(", ")] WHERE id = :round_id",
				arguments
			)
			query_round_game_mode.Execute()
			qdel(query_round_game_mode)
	addtimer(CALLBACK(src, PROC_REF(send_trait_report)), rand(1 MINUTES, 5 MINUTES))
	handle_post_setup_roundstart_events()
	roundstart_event_view = FALSE
	return TRUE


///Handles late-join antag assignments
/datum/controller/subsystem/unified/proc/make_antag_chance(mob/living/carbon/human/character)
	return

/datum/controller/subsystem/unified/proc/check_finished(force_ending) //to be called by SSticker
	if(!SSticker.setup_done)
		return FALSE
	if(SSshuttle.emergency && (SSshuttle.emergency.mode == SHUTTLE_ENDGAME))
		return TRUE
	if(GLOB.station_was_nuked)
		return TRUE
	if(force_ending)
		return TRUE

//////////////////////////
//Reports player logouts//
//////////////////////////
/datum/controller/subsystem/unified/proc/display_roundstart_logout_report()
	var/list/msg = list("[span_boldnotice("Roundstart logout report")]\n\n")
	for(var/i in GLOB.mob_living_list)
		var/mob/living/L = i
		var/mob/living/carbon/C = L
		var/mob/living/carbon/human/H = C
		if (istype(C) && !C.last_mind)
			continue  // never had a client

		if(L.ckey && !GLOB.directory[L.ckey])
			msg += "<b>[L.name]</b> ([L.key]), the [L.job] (<font color='#ffcc00'><b>Disconnected</b></font>)\n"


		if(L.ckey && L.client)
			var/failed = FALSE
			if(L.client.inactivity >= (ROUNDSTART_LOGOUT_REPORT_TIME / 2)) //Connected, but inactive (alt+tabbed or something)
				msg += "<b>[L.name]</b> ([L.key]), the [L.job] (<font color='#ffcc00'><b>Connected, Inactive</b></font>)\n"
				failed = TRUE //AFK client
			if(!failed && L.stat)
				if(H.get_dnr()) //Suicider
					msg += "<b>[L.name]</b> ([L.key]), the [L.job] ([span_boldannounce("Suicide")])\n"
					failed = TRUE //Disconnected client
				if(!failed && (L.stat == UNCONSCIOUS || L.stat == HARD_CRIT))
					msg += "<b>[L.name]</b> ([L.key]), the [L.job] (Dying)\n"
					failed = TRUE //Unconscious
				if(!failed && L.stat == DEAD)
					msg += "<b>[L.name]</b> ([L.key]), the [L.job] (Dead)\n"
					failed = TRUE //Dead

			continue //Happy connected client
		for(var/mob/dead/observer/D in GLOB.dead_mob_list)
			if(D.mind && D.mind.current == L)
				if(L.stat == DEAD)
					if(H.get_dnr()) //Suicider
						msg += "<b>[L.name]</b> ([ckey(D.mind.key)]), the [L.job] ([span_boldannounce("Suicide")])\n"
						continue //Disconnected client
					else
						msg += "<b>[L.name]</b> ([ckey(D.mind.key)]), the [L.job] (Dead)\n"
						continue //Dead mob, ghost abandoned
				else
					if(D.can_reenter_corpse)
						continue //Adminghost, or cult/wizard ghost
					else
						msg += "<b>[L.name]</b> ([ckey(D.mind.key)]), the [L.job] ([span_boldannounce("Ghosted")])\n"
						continue //Ghosted while alive


	for (var/C in GLOB.admins)
		to_chat(C, msg.Join())

//Set result and news report here
/datum/controller/subsystem/unified/proc/set_round_result()
	SSticker.mode_result = "undefined"
	if(GLOB.station_was_nuked)
		SSticker.news_report = STATION_DESTROYED_NUKE
	if(EMERGENCY_ESCAPED_OR_ENDGAMED)
		SSticker.news_report = STATION_EVACUATED
		if(SSshuttle.emergency.is_hijacked())
			SSticker.news_report = SHUTTLE_HIJACK

/// Loads json event config values from events.txt
/datum/controller/subsystem/unified/proc/load_event_config_vars()
	var/json_file = file("[global.config.directory]/events.json")
	if(!fexists(json_file))
		return
	var/list/decoded = json_decode(file2text(json_file))
	for(var/event_text_path in decoded)
		var/event_path = text2path(event_text_path)
		var/datum/round_event_control/event
		for(var/datum/round_event_control/iterated_event as anything in control)
			if(iterated_event.type == event_path)
				event = iterated_event
				break
		if(!event)
			continue
		var/list/var_list = decoded[event_text_path]
		for(var/variable in var_list)
			var/value = var_list[variable]
			switch(variable)
				if("weight")
					event.weight = value
				if("min_players")
					event.min_players = value
				if("max_occurrences")
					event.max_occurrences = value
				if("earliest_start")
					event.earliest_start = value * (1 MINUTES)
				if("cost")
					event.cost = value
				if("reoccurence_penalty_multiplier")
					event.reoccurence_penalty_multiplier = value
				if("shared_occurence_type")
					if(!isnull(value))
						value = text2path(value)
					event.shared_occurence_type = value

/// Loads config values from game_options.txt
/datum/controller/subsystem/unified/proc/load_config_vars()
	allow_pop_scaling = CONFIG_GET(flag/allow_storyteller_pop_scaling)

/// Panel containing information, variables and controls about the gamemode and scheduled event
/datum/controller/subsystem/unified/proc/admin_panel(mob/user)
	update_crew_infos()
	var/list/dat = list()
	var/active_pop = get_correct_popcount()
	dat += " <a href='?src=[REF(src)];panel=main;action=halt_storyteller' [halted ? "class='linkOn'" : ""]>HALT Unified</a> <a href='?src=[REF(src)];panel=main;action=open_stats'>Event Panel</a> <a href='?src=[REF(src)];panel=main'>Refresh</a>"
	dat += "<BR>Active Players: [active_pop]   (Head: [head_crew], Sec: [sec_crew], Eng: [eng_crew], Med: [med_crew]) - Antag Cap: [get_antag_cap()]"
	dat += "<HR>"
	dat += "<a href='?src=[REF(src)];panel=main;action=tab;tab=[UNIFIED_PANEL_MAIN]' [panel_page == UNIFIED_PANEL_MAIN ? "class='linkOn'" : ""]>Main</a>"
	dat += " <a href='?src=[REF(src)];panel=main;action=tab;tab=[UNIFIED_PANEL_VARIABLES]' [panel_page == UNIFIED_PANEL_VARIABLES ? "class='linkOn'" : ""]>Variables</a>"
	dat += "<HR>"
	switch(panel_page)
		if(UNIFIED_PANEL_VARIABLES)
			/*
			dat += "<a href='?src=[REF(src)];panel=main;action=reload_config_vars'>Reload Config Vars</a> <font color='#888888'><i>Configs located in game_options.txt.</i></font>"
			dat += "<BR><b>Point Gains Multipliers (only over time):</b>"
			dat += "<BR><font color='#888888'><i>This affects points gained over time towards scheduling new events of the tracks.</i></font>"
			for(var/track in event_tracks)
				dat += "<BR>[track]: <a href='?src=[REF(src)];panel=main;action=vars;var=pts_multiplier;track=[track]'>[point_gain_multipliers[track]]</a>"
			dat += "<HR>"

			dat += "<b>Roundstart Points Multipliers:</b>"
			dat += "<BR><font color='#888888'><i>This affects points generated for roundstart events and antagonists.</i></font>"
			for(var/track in event_tracks)
				dat += "<BR>[track]: <a href='?src=[REF(src)];panel=main;action=vars;var=roundstart_pts;track=[track]'>[roundstart_point_multipliers[track]]</a>"
			dat += "<HR>"
			*/
			/* TODO FIX
			dat += "<b>Minimum Population for Tracks:</b>"
			dat += "<BR><font color='#888888'><i>This are the minimum population caps for events to be able to run.</i></font>"
			for(var/track in event_tracks)
				dat += "<BR>[track]: <a href='?src=[REF(src)];panel=main;action=vars;var=min_pop;track=[track]'>[min_pop_thresholds[track]]</a>"
			dat += "<HR>"

			dat += "<b>Point Thresholds:</b>"
			dat += "<BR><font color='#888888'><i>Those are thresholds the tracks require to reach with points to make an event.</i></font>"
			for(var/track in event_tracks)
				dat += "<BR>[track]: <a href='?src=[REF(src)];panel=main;action=vars;var=pts_threshold;track=[track]'>[point_thresholds[track]]</a>"
			*/
		if(UNIFIED_PANEL_MAIN)
			var/background_cl = "#23273C"
			dat += "<h2>Point Budget:</h2>"
			dat += "<span style='background-color:[background_cl]'>[points]/[starting_points]</span>"

			dat += "<h2>Scheduled Events:</h2>"
			dat += "<table align='center'; width='100%'; height='100%'; style='background-color:#13171C'>"
			dat += "<tr style='vertical-align:top'>"
			dat += "<td width=30%><b>Name</b></td>"
			dat += "<td width=17%><b>Cost</b></td>"
			dat += "<td width=12%><b>Time</b></td>"
			dat += "<td width=41%><b>Actions</b></td>"
			dat += "</tr>"
			var/sorted_scheduled = list()
			for(var/datum/scheduled_event/scheduled as anything in scheduled_events)
				sorted_scheduled[scheduled] = scheduled.start_time
			sortTim(sorted_scheduled, cmp=/proc/cmp_numeric_asc, associative = TRUE)
			var/even = TRUE
			for(var/datum/scheduled_event/scheduled as anything in sorted_scheduled)
				even = !even
				background_cl = even ? "#17191C" : "#23273C"
				dat += "<tr style='vertical-align:top; background-color: [background_cl];'>"
				dat += "<td>[scheduled.event.name]</td>" //Name
				dat += "<td>[scheduled.event.calculated_cost]</td>" //Cost
				var/time = "[round((scheduled.start_time - world.time) / (1 MINUTES), 0.01)] min."
				dat += "<td>[time]</td>" //Time
				dat += "<td>[scheduled.get_href_actions()]</td>" //Actions
				dat += "</tr>"
			dat += "</table>"

			dat += "<h2>Running Events:</h2>"
			dat += "<table align='center'; width='100%'; height='100%'; style='background-color:#13171C'>"
			dat += "<tr style='vertical-align:top'>"
			dat += "<td width=30%><b>Name</b></td>"
			dat += "<td width=70%><b>Actions</b></td>"
			dat += "</tr>"
			even = TRUE
			for(var/datum/round_event/event as anything in running)
				even = !even
				background_cl = even ? "#17191C" : "#23273C"
				dat += "<tr style='vertical-align:top; background-color: [background_cl];'>"
				dat += "<td>[event.control.name]</td>" //Name
				dat += "<td>-TBA-</td>" //Actions
				dat += "</tr>"
			dat += "</table>"

	var/datum/browser/popup = new(user, "unified_admin_panel", "Unified Panel", 670, 650)
	popup.set_content(dat.Join())
	popup.open()

 /// Panel containing information and actions regarding events
/datum/controller/subsystem/unified/proc/event_panel(mob/user)
	var/list/dat = list()
	dat += "<BR><a href='?src=[REF(src)];panel=stats;action=set_roundstart'[roundstart_event_view ? "class='linkOn'" : ""]>Roundstart Events</a>"
	dat += "<BR>Avg. event intervals: "
	dat += "<HR>"
	/// Create event info and stats table
	dat += "<table align='center'; width='100%'; height='100%'; style='background-color:#13171C'>"
	dat += "<tr style='vertical-align:top'>"
	dat += "<td width=17%><b>Name</b></td>"
	dat += "<td width=16%><b>Tags</b></td>"
	dat += "<td width=8%><b>Base Cost</b></td>"
	dat += "<td width=5%><b>M.Pop</b></td>"
	dat += "<td width=5%><b>M.Time</b></td>"
	dat += "<td width=7%><b>Can Occur</b></td>"
	dat += "<td width=16%><b>Weight</b></td>"
	dat += "<td width=26%><b>Actions</b></td>"
	dat += "</tr>"
	var/even = TRUE
	var/total_weight = 0
	var/list/assoc_spawn_weight = list()
	var/active_pop = get_correct_popcount()
	for(var/datum/round_event_control/event as anything in (control + roundstart_control))
		if(event.roundstart != roundstart_event_view)
			continue
		if(event.can_spawn_event(active_pop))
			total_weight += event.calculated_weight
			assoc_spawn_weight[event] = event.calculated_weight
		else
			assoc_spawn_weight[event] = 0
	sortTim(assoc_spawn_weight, cmp=/proc/cmp_numeric_dsc, associative = TRUE)
	for(var/datum/round_event_control/event as anything in assoc_spawn_weight)
		even = !even
		var/background_cl = even ? "#17191C" : "#23273C"
		dat += "<tr style='vertical-align:top; background-color: [background_cl];'>"
		dat += "<td>[event.name]</td>" //Name
		dat += "<td>" //Tags
		for(var/tag in event.tags)
			dat += "[tag] "
		dat += "</td>"
		dat += "<td>[event.unified_cost]</td>" //Cost
		dat += "<td>[event.min_players]</td>" //Minimum pop
		dat += "<td>[event.earliest_start / (1 MINUTES)] m.</td>" //Minimum time
		dat += "<td>[assoc_spawn_weight[event] ? "Yes" : "No"]</td>" //Can happen?
		var/weight_string = "([event.calculated_weight] /raw.[event.weight])"
		if(assoc_spawn_weight[event])
			var/percent = round((event.calculated_weight / total_weight) * 100)
			weight_string = "[percent]% - [weight_string]"
		dat += "<td>[weight_string]</td>" //Weight
		dat += "<td>[event.get_href_actions()]</td>" //Actions
		dat += "</tr>"
	dat += "</table>"
	var/datum/browser/popup = new(user, "unified_event_panel", "Event Panel", 1000, 600)
	popup.set_content(dat.Join())
	popup.open()

/datum/controller/subsystem/unified/Topic(href, href_list)
	. = ..()
	var/mob/user = usr
	if(!check_rights(R_ADMIN))
		return
	switch(href_list["panel"])
		if("main")
			switch(href_list["action"])
				if("reset_cooldown")
					cooldown_over = world.time
				if("halt_storyteller")
					halted = !halted
					message_admins("[key_name_admin(usr)] has [halted ? "HALTED" : "un-halted"] Unified.")
				/* TODO FIX
				if("vars")
					var/track = href_list["track"]
					switch(href_list["var"])
						/*if("pts_multiplier")
							var/new_value = input(usr, "New value:", "Set new value") as num|null
							if(isnull(new_value) || new_value < 0)
								return
							message_admins("[key_name_admin(usr)] set point gain multiplier for [track] track to [new_value].")
							point_gain_multipliers[track] = new_value
						if("roundstart_pts")
							var/new_value = input(usr, "New value:", "Set new value") as num|null
							if(isnull(new_value) || new_value < 0)
								return
							message_admins("[key_name_admin(usr)] set roundstart pts multiplier for [track] track to [new_value].")
							roundstart_point_multipliers[track] = new_value
						*/
						if("min_pop")
							var/new_value = input(usr, "New value:", "Set new value") as num|null
							if(isnull(new_value) || new_value < 0)
								return
							message_admins("[key_name_admin(usr)] set minimum population for [track] track to [new_value].")
							min_pop_thresholds[track] = new_value
						if("pts_threshold")
							var/new_value = input(usr, "New value:", "Set new value") as num|null
							if(isnull(new_value) || new_value < 0)
								return
							message_admins("[key_name_admin(usr)] set point threshold of [track] track to [new_value].")
							point_thresholds[track] = new_value
				*/
				if("reload_config_vars")
					message_admins("[key_name_admin(usr)] reloaded unified config vars.")
					load_config_vars()
				if("tab")
					var/tab = href_list["tab"]
					panel_page = tab
				if("open_stats")
					event_panel(user)
					return
				/* TODO FIX
				if("track_action")
					var/track = href_list["track"]
					if(!(track in event_tracks))
						return
					switch(href_list["track_action"])
						if("remove_forced")
							if(forced_next_events[track])
								var/datum/round_event_control/event = forced_next_events[track]
								message_admins("[key_name_admin(usr)] removed forced event [event.name] from track [track].")
								forced_next_events -= track
						if("set_pts")
							var/set_pts = input(usr, "New point amount ([point_thresholds[track]]+ invokes event):", "Set points for [track]") as num|null
							if(isnull(set_pts))
								return
							event_track_points[track] = set_pts
							message_admins("[key_name_admin(usr)] set points of [track] track to [set_pts].")
							log_admin_private("[key_name(usr)] set points of [track] track to [set_pts].")
						if("next_event")
							message_admins("[key_name_admin(usr)] invoked next event for [track] track.")
							log_admin_private("[key_name(usr)] invoked next event for [track] track.")
							event_track_points[track] = point_thresholds[track]
							if(storyteller)
								storyteller.handle_tracks()
				*/
			admin_panel(user)
		if("stats")
			switch(href_list["action"])
				if("set_roundstart")
					roundstart_event_view = !roundstart_event_view
				if("set_cat")
					var/new_category = href_list["cat"]
					if(new_category in EVENT_PANEL_TRACKS)
						statistics_track_page = new_category
			event_panel(user)
