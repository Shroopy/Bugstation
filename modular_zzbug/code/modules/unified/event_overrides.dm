// SCRUBBERS EVENTS

/datum/round_event_control/scrubber_overflow/threatening
	max_occurrences = 0

/datum/round_event_control/scrubber_overflow/catastrophic
	max_occurrences = 0

/datum/round_event_control/scrubber_overflow/every_vent
	max_occurrences = 0

/datum/round_event_control/scrubber_overflow/ices
	max_occurrences = 0

// MUNDANE EVENTS

/datum/round_event_control/bitrunning_glitch
	unified_cost = COST_VERY_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/sentience
	unified_cost = COST_VERY_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/aurora_caelus
	unified_cost = 0
	weight = WEIGHT_NORMAL

/datum/round_event_control/camera_failure
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/space_dust
	unified_cost = COST_MINOR
	max_occurrences = 0 // space dust is a nothing event
	weight = WEIGHT_NORMAL

/datum/round_event_control/space_dust/New()
	. = ..()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/electrical_storm
	unified_cost = COST_MINOR
	weight = WEIGHT_UNLIKELY // it's annoying
	weight = WEIGHT_NORMAL

/datum/round_event_control/fake_virus
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/falsealarm
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/market_crash
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/mice_migration
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/mice_migration/New()
	. = ..()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/wisdomcow
	unified_cost = 0
	weight = WEIGHT_NORMAL

/datum/round_event_control/shuttle_loan
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/mass_hallucination
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/stray_cargo
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/grey_tide
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/grey_tide/New()
	. = ..()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/gravity_generator_blackout
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/gravity_generator_blackout/New()
	. = ..()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/shuttle_insurance
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/tram_malfunction
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/tram_malfunction/New()
	. = ..()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/grid_check
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/bureaucratic_error
	unified_cost = COST_MINOR
	weight = WEIGHT_UNLIKELY // It's annoying
	weight = WEIGHT_NORMAL

/datum/round_event_control/vent_clog
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

// /datum/round_event_control/anomaly

/datum/round_event_control/anomaly/New()
	. = ..()
	tags |= list(TAG_SCIENCE)

/datum/round_event_control/anomaly/anomaly_hallucination
	unified_cost = COST_VERY_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_grav
	unified_cost = COST_VERY_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_grav/high
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_grav/high/New()
	. = ..()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/anomaly/anomaly_bioscrambler
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_bioscrambler/New()
	. = ..()
	tags |= list(TAG_MEDICAL)

/datum/round_event_control/anomaly/anomaly_bluespace
	unified_cost = COST_MINOR
	weight = WEIGHT_LESS_LIKELY // Our stuff being teleported away is kinda annoying but not too bad

/datum/round_event_control/vent_clog/strange
	unified_cost = COST_MINOR
	max_occurrences = 0 // none of this for now, not sure about the animals in it
	weight = WEIGHT_NORMAL

/datum/round_event_control/scrubber_overflow
	unified_cost = COST_MINOR
	weight = WEIGHT_NORMAL

// MODERATE EVENTS

/datum/round_event_control/meteor_wave/dust_storm
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/brain_trauma
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/brain_trauma/New()
	. = ..()
	tags |= list(TAG_MEDICAL)

/datum/round_event_control/supermatter_surge
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/supermatter_surge/New()
	. = ..()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/brand_intelligence
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/brand_intelligence/New()
	. = ..()
	tags |= list(TAG_ENGINEERING, TAG_MEDICAL)

/datum/round_event_control/carp_migration
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/carp_migration/New()
	. = ..()
	tags |= list(TAG_SECURITY, TAG_MEDICAL)

/datum/round_event_control/communications_blackout
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/ion_storm
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/processor_overload
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/processor_overload/New()
	. = ..()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/radiation_leak
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/radiation_leak/New()
	. = ..()
	tags |= list(TAG_ENGINEERING, TAG_MEDICAL)

/datum/round_event_control/sandstorm
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/sandstorm/New()
	. = ..()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/shuttle_catastrophe
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/spacevine
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/portal_storm_syndicate
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/portal_storm_syndicate/New()
	. = ..()
	tags |= list(TAG_SECURITY, TAG_MEDICAL)

// BUG EDIT START
/datum/round_event_control/radiation_storm
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL
	max_occurrences = 2

/datum/round_event_control/radiation_storm/New()
	. = ..()
	tags |= list(TAG_MEDICAL)

/datum/round_event_control/wormholes
	unified_cost = COST_MODERATE
	max_occurrences = 2 // BUG: more than two wormholes would be pretty annoying, like the radstorm
	weight = WEIGHT_NORMAL

/datum/round_event_control/wormholes/New()
	. = ..()
	tags |= list(TAG_MEDICAL)

/datum/round_event_control/heart_attack
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/heart_attack/New()
	. = ..()
	tags |= list(TAG_MEDICAL)

/datum/round_event_control/appendicitis
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/appendicitis/New()
	. = ..()
	tags |= list(TAG_MEDICAL)

/datum/round_event_control/disease_outbreak
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/disease_outbreak/New()
	. = ..()
	tags |= list(TAG_MEDICAL)

/datum/round_event_control/disease_outbreak/advanced
	unified_cost = COST_MODERATE
	weight = WEIGHT_UNLIKELY

/datum/round_event_control/anomaly/anomaly_dimensional
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_dimensional/New()
	. = ..()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/anomaly/anomaly_ectoplasm
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_flux
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_flux/New()
	. = ..()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/vent_clog/major
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/vent_clog/major/New()
	. = ..()
	tags |= list(TAG_SECURITY)

/datum/round_event_control/vent_clog/critical
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/vent_clog/critical/New()
	. = ..()
	tags |= list(TAG_SECURITY)

/datum/round_event_control/mold
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/mold/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

// MAJOR EVENTS

/datum/round_event_control/pirates
	unified_cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/pirates/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

/datum/round_event_control/alien_infestation
	unified_cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/alien_infestation/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/space_dragon
	unified_cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/space_dragon/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

/datum/round_event_control/cortical_borer
	unified_cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/cortical_borer/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/earthquake
	unified_cost = COST_SEMIMAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/earthquake/New()
	. = ..()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/blob
	unified_cost = COST_SUPERMAJOR
	weight = WEIGHT_UNLIKELY

/datum/round_event_control/blob/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING)

/datum/round_event_control/meteor_wave
	unified_cost = COST_SEMIMAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/meteor_wave/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING)

/datum/round_event_control/meteor_wave/meaty
	unified_cost = COST_SEMIMAJOR
	weight = WEIGHT_UNLIKELY // meat meteors?? how queer

/datum/round_event_control/meteor_wave/ices
	max_occurrences = 0

/datum/round_event_control/immovable_rod
	unified_cost = COST_SEMIMAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/immovable_rod/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING)

/datum/round_event_control/stray_meteor
	unified_cost = COST_SEMIMAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/stray_meteor/New()
	. = ..()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/anomaly/anomaly_vortex
	unified_cost = COST_SEMIMAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_vortex/New()
	. = ..()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/anomaly/anomaly_pyro
	unified_cost = COST_SEMIMAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_pyro/New()
	. = ..()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/spider_infestation
	unified_cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/spider_infestation/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/revenant
	min_players = 20
	unified_cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/abductor
	unified_cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/abductor/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/fugitives
	unified_cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/fugitives/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/voidwalker
	unified_cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/voidwalker/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/cme
	unified_cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/cme/New()
	. = ..()
	tags |= list(TAG_ENGINEERING, TAG_SCIENCE)

/datum/round_event_control/stray_cargo/changeling_zombie
	unified_cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/stray_cargo/changeling_zombie/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

// ANTAGS

/datum/round_event_control/antagonist
	unified_cost = COST_SEMIMAJOR
	cooldown_override = 10

/datum/round_event_control/antagonist/solo/bloodsucker
	min_players = 0
	base_antags = 1
	maximum_antags = INFINITY
	maximum_antags_global = 0
	weight = WEIGHT_NORMAL

/datum/round_event_control/antagonist/solo/bloodsucker/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/antagonist/solo/changeling
	min_players = 0
	base_antags = 1
	maximum_antags = INFINITY
	maximum_antags_global = 0
	weight = WEIGHT_NORMAL

/datum/round_event_control/antagonist/solo/changeling/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/antagonist/solo/heretic
	min_players = 0
	base_antags = 1
	maximum_antags = INFINITY
	maximum_antags_global = 0
	weight = WEIGHT_NORMAL

/datum/round_event_control/antagonist/solo/heretic/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

/datum/round_event_control/antagonist/solo/malf
	min_players = 0
	base_antags = 1
	maximum_antags = INFINITY
	maximum_antags_global = 0
	weight = WEIGHT_NORMAL

	min_players = 20

/datum/round_event_control/antagonist/solo/malf/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

/datum/round_event_control/antagonist/team/nuke_ops
	unified_cost = COST_SUPERMAJOR
	weight = WEIGHT_UNLIKELY
	min_players = 0
	base_antags = 2
	maximum_antags = INFINITY
	maximum_antags_global = 5
	weight = WEIGHT_NORMAL

/datum/round_event_control/antagonist/team/nuke_ops/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

/datum/round_event_control/antagonist/obsessed
	unified_cost = COST_MODERATE
	min_players = 0
	base_antags = 1
	maximum_antags = INFINITY
	maximum_antags_global = 0
	weight = WEIGHT_NORMAL

/datum/round_event_control/antagonist/obsessed/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/antagonist/obsessed/midround
	name = "Obsessed (Midround)"
	roundstart = FALSE

/datum/round_event_control/antagonist/solo/spy
	min_players = 0
	base_antags = 1
	maximum_antags = INFINITY
	maximum_antags_global = 0
	weight = WEIGHT_NORMAL

/datum/round_event_control/antagonist/solo/spy/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

/datum/round_event_control/antagonist/solo/traitor
	min_players = 0
	base_antags = 1
	maximum_antags = INFINITY
	maximum_antags_global = 0
	weight = WEIGHT_NORMAL

/datum/round_event_control/antagonist/solo/traitor/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

// WIZARD EVENTS

// /datum/round_event_control/wizard

/datum/round_event_control/wizard/New()
	. = ..()
	tags = list(TAG_WIZARD)

// MISC

/datum/round_event_control/operative
	// Don't override weight for operative!
	unified_cost = COST_MAJOR

/datum/round_event_control/operative/New()
	. = ..()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

/datum/round_event_control/changeling
	max_occurrences = 0 // TODO add an antag version of this
	//unified_cost = COST_MAJOR
	//cooldown_override = 5
/*
/datum/round_event_control/changeling/New()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)
*/
/datum/round_event_control/nightmare
	max_occurrences = 0 // TODO add an antag version of this
	//unified_cost = COST_MAJOR
/*
/datum/round_event_control/nightmare/New()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)
*/
/datum/round_event_control/wizard_dice
	unified_cost = COST_MODERATE
	weight = WEIGHT_NORMAL

// /datum/round_event_control/wizard_dice/New()

/datum/round_event_control/space_ninja
	max_occurrences = 0  // TODO add an antag version of this
	unified_cost = COST_MAJOR
/*
/datum/round_event_control/space_ninja/New()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)
*/
/datum/round_event_control/obsessed
	max_occurrences = 0 // We already have an antag version of this event

/datum/round_event_control/morph
	max_occurrences = 0 // TODO add an antag version of this
