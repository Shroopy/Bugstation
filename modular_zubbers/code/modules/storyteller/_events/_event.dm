/datum/round_event_control
	var/roundstart = FALSE
	var/cost = 1
	var/reoccurence_penalty_multiplier = 0.75
	var/shared_occurence_type
	var/track = EVENT_TRACK_MODERATE
	/// Last calculated weight that the storyteller assigned this event
	var/calculated_weight = 0
	var/tags = list() 	/// Tags of the event
	/// List of the shared occurence types.
	var/static/list/shared_occurences = list()
	/// Whether a roundstart event can happen post roundstart. Very important for events which override job assignments.
	var/can_run_post_roundstart = TRUE

/datum/round_event
	/// Whether the event called its start() yet or not.
	var/has_started = FALSE

/// This section of event processing is in a proc because roundstart events may get their start invoked.
/datum/round_event/proc/try_start()
	if(has_started)
		return
	has_started = TRUE
	processing = FALSE
	start()
	processing = TRUE

/datum/round_event_control/roundstart
	roundstart = TRUE
	earliest_start = 0

///Adds an occurence. Has to use the setter to properly handle shared occurences
/datum/round_event_control/proc/add_occurence()
	if(shared_occurence_type)
		if(!shared_occurences[shared_occurence_type])
			shared_occurences[shared_occurence_type] = 0
		shared_occurences[shared_occurence_type]++
	occurrences++

///Subtracts an occurence. Has to use the setter to properly handle shared occurences
/datum/round_event_control/proc/subtract_occurence()
	if(shared_occurence_type)
		if(!shared_occurences[shared_occurence_type])
			shared_occurences[shared_occurence_type] = 0
		shared_occurences[shared_occurence_type]--
	occurrences--

///Gets occurences. Has to use the getter to properly handle shared occurences
/datum/round_event_control/proc/get_occurences()
	if(shared_occurence_type)
		if(!shared_occurences[shared_occurence_type])
			shared_occurences[shared_occurence_type] = 0
		return shared_occurences[shared_occurence_type]
	return occurrences

/// Prints the action buttons for this event.
/datum/round_event_control/proc/get_href_actions()
	if(SSticker.HasRoundStarted())
		if(roundstart)
			if(!can_run_post_roundstart)
				return "<a class='linkOff'>Fire</a>" // BUG EDIT
			return "<a href='?src=[REF(src)];action=fire'>Fire</a> <a href='?src=[REF(src)];action=schedule'>Schedule</a>"
		else
			return "<a href='?src=[REF(src)];action=fire'>Fire</a> <a href='?src=[REF(src)];action=schedule'>Schedule</a>" // BUG EDIT
	else
		if(roundstart)
			return "<a href='?src=[REF(src)];action=fire'>Fire</a>" // BUG EDIT
		else
			return "<a href='?src=[REF(src)];action=schedule'>Schedule</a>" // BUG EDIT

/datum/round_event_control/Topic(href, href_list)
	. = ..()
	switch(href_list["action"])
		// BUG EDIT START
		/*
		if("force_next")
			message_admins("[key_name_admin(usr)] has forced scheduled event [src.name].")
			log_admin_private("[key_name(usr)] has forced scheduled event [src.name].")
			SSgamemode.force_event(src)
		*/
		if("fire")
			message_admins("[key_name_admin(usr)] has fired event [src.name].")
			log_admin_private("[key_name(usr)] has fired event [src.name].")
			run_event(admin_forced = TRUE)
		if("schedule")
			var/delay = input(usr, "Enter the time in seconds to run the event in.", "Schedule Event") as null|num
			message_admins("[key_name_admin(usr)] has scheduled event [src.name] to run in [delay] seconds.")
			log_admin_private("[key_name(usr)] has scheduled event [src.name] to run in [delay] seconds.")
			SSunified.schedule_event(src, delay SECONDS, calculated_cost, TRUE, FALSE)
		// BUG EDIT END
