/datum/round_event_control/appendicitis
	name = "Random appendicitis"
	typepath = /datum/round_event/appendicitis
	weight = 20
	category = EVENT_CATEGORY_HEALTH
	tags = list(TAG_VERY_TARGETED)
	description = "A random crewmember's appendix gives out."
	min_wizard_trigger_potency = 6
	max_wizard_trigger_potency = 7
	admin_setup = list(/datum/event_admin_setup/minimum_candidate_requirement/appendicitis, /datum/event_admin_setup/input_number/appendicitis)
	///Candidates for receiving a healthy dose of appendix disease
	var/list/appendicitis_candidates = list()

/datum/round_event_control/appendicitis/can_spawn_event(players_amt, allow_magic = FALSE)
	. = ..()
	if(!.)
		return .
	generate_candidates()
	if(length(appendicitis_candidates))
		return TRUE

/**
 * Performs initial analysis of which living players are eligible to be selected for appendicitis.
 *
 * Traverses player_list and checks entries against a series of reviews to see if they should even be considered for appendicitis,
 * and at what weight should they be eligible to receive it. The check for whether or not appendicitis should be "blocked" by something is done
 * later, at the round_event level, so this proc mostly just checks users for whether or not appendicitis should be possible.
 */
/datum/round_event_control/appendicitis/proc/generate_candidates()
	appendicitis_candidates.Cut()
	for(var/mob/living/carbon/human/candidate in shuffle(GLOB.player_list))
		if(candidate.stat == DEAD || HAS_TRAIT(candidate, TRAIT_CRITICAL_CONDITION) || !candidate.get_organ_slot(ORGAN_SLOT_APPENDIX) || candidate.get_organ_slot(ORGAN_SLOT_APPENDIX).inflamation_stage)
			continue
		if(!(candidate.mind.assigned_role.job_flags & JOB_CREW_MEMBER))//only crewmembers can get one, a bit unfair for some ghost roles and it wastes the event
			continue
		if(engaged_role_play_check(candidate, station = TRUE, dorms = TRUE))
			continue

/datum/round_event/appendicitis
	///A list of prime candidates for appendicitising
	var/list/victims = list()
	///Number of appendicitiss to distribute
	var/quantity = 1

/datum/round_event/appendicitis/start()
	var/datum/round_event_control/appendicitis/appendix_control = control
	victims += appendix_control.appendicitis_candidates
	appendix_control.appendicitis_candidates.Cut()

	while(quantity > 0 && length(victims))
		if(attack_appendix())
			quantity--

/**
 * Picks a victim from a list and attempts to give them a appendicitis
 *
 * Performs a pick_weight on a list of potential victims. Once selected, the "winner"
 * will receive appendicitis. Returns TRUE if appendicitis is successfully given, and
 * FALSE if something blocks it.
 */
/datum/round_event/appendicitis/proc/attack_appendix()
	winner.get_organ_slot(ORGAN_SLOT_APPENDIX).become_inflamed()
	announce_to_ghosts(winner)
	victims -= winner
	return TRUE

/datum/event_admin_setup/minimum_candidate_requirement/appendicitis
	output_text = "There are no candidates eligible to receive appendicitis!"

/datum/event_admin_setup/minimum_candidate_requirement/appendicitis/count_candidates()
	var/datum/round_event_control/appendicitis/appendix_control = event_control
	appendix_control.generate_candidates() //can_spawn_event() is bypassed by admin_setup, so this makes sure that the candidates are still generated
	return length(appendix_control.appendicitis_candidates)

/datum/event_admin_setup/input_number/appendicitis
	input_text = "Please select how many people's days you wish to ruin."
	default_value = 0
	max_value = 90 //Will be overridden
	min_value = 0

/datum/event_admin_setup/input_number/appendicitis/prompt_admins()
	var/datum/round_event_control/appendicitis/appendix_control = event_control
	max_value = length(apendix_control.appendicitis_candidates)
	return ..()

/datum/event_admin_setup/input_number/appendicitis/apply_to_event(datum/round_event/appendicitis/event)
	event.quantity = chosen_value
