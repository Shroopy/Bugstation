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

/datum/round_event_control/aurora_caelus
	cost = 0
	weight = WEIGHT_NORMAL

/datum/round_event_control/camera_failure
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/space_dust
	cost = COST_MINOR
	tags |= list(TAG_ENGINEERING)
	weight = WEIGHT_NORMAL
	max_occurrences = 0 // space dust is a nothing event

/datum/round_event_control/electrical_storm
	cost = COST_MINOR
	weight = 5 // it's annoying

/datum/round_event_control/fake_virus
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/falsealarm
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/market_crash
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/mice_migration
	cost = COST_MINOR
	tags |= list(TAG_ENGINEERING)
	weight = WEIGHT_NORMAL

/datum/round_event_control/wisdomcow
	cost = 0
	weight = WEIGHT_NORMAL

/datum/round_event_control/shuttle_loan
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/mass_hallucination
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/stray_cargo
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/grey_tide
	cost = COST_MINOR
	tags |= list(TAG_ENGINEERING)
	weight = WEIGHT_NORMAL

/datum/round_event_control/gravity_generator_blackout
	cost = COST_MINOR
	tags |= list(TAG_ENGINEERING)
	weight = WEIGHT_NORMAL

/datum/round_event_control/shuttle_insurance
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/tram_malfunction
	cost = COST_MINOR
	tags |= list(TAG_ENGINEERING)
	weight = WEIGHT_NORMAL

/datum/round_event_control/grid_check
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/bureaucratic_error
	cost = COST_MINOR
	weight = 5 // It's annoying

/datum/round_event_control/vent_clog
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_hallucination
	cost = COST_MINOR
	tags |= list(TAG_SCIENCE)
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_grav
	cost = COST_MINOR
	tags |= list(TAG_SCIENCE)
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_bioscrambler
	cost = COST_MINOR
	tags |= list(TAG_MEDICAL, TAG_SCIENCE)
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_bluespace
	cost = COST_MINOR
	tags |= list(TAG_SCIENCE)
	weight = 7.5 // Our stuff being teleported away is kinda annoying but not too bad

/datum/round_event_control/vent_clog/strange
	cost = COST_MINOR
	max_occurrences = 0 // none of this for now, not sure about the animals in it

/datum/round_event_control/scrubber_overflow
	cost = COST_MINOR
	tags = list(TAG_COMMUNAL)
	weight = WEIGHT_NORMAL

// MODERATE EVENTS

/datum/round_event_control/brand_intelligence
	cost = COST_MODERATE
	tags |= list(TAG_ENGINEERING, TAG_MEDICAL)
	weight = WEIGHT_NORMAL

/datum/round_event_control/carp_migration
	cost = COST_MODERATE
	tags |= list(TAG_SECURITY, TAG_MEDICAL)
	weight = WEIGHT_NORMAL

/datum/round_event_control/communications_blackout
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/ion_storm
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/processor_overload
	cost = COST_MODERATE
	tags |= list(TAG_ENGINEERING)
	weight = 5 // More severe version of comms blackout

/datum/round_event_control/radiation_leak
	cost = COST_MODERATE
	tags |= list(TAG_ENGINEERING, TAG_MEDICAL)
	weight = WEIGHT_NORMAL

/datum/round_event_control/sandstorm
	cost = COST_MODERATE
	tags |= list(TAG_ENGINEERING)
	weight = WEIGHT_NORMAL

/datum/round_event_control/shuttle_catastrophe
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/spacevine
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/portal_storm_syndicate
	cost = COST_MODERATE
	tags |= list(TAG_SECURITY, TAG_MEDICAL)
	weight = WEIGHT_NORMAL

// BUG EDIT START
/datum/round_event_control/radiation_storm
	cost = COST_MODERATE
	tags |= list(TAG_MEDICAL)
	max_occurrences = 2
	weight = WEIGHT_NORMAL

/datum/round_event_control/wormholes
	cost = COST_MODERATE
	max_occurrences = 2 // BUG: more than two wormholes would be pretty annoying, like the radstorm
	tags |= list(TAG_MEDICAL)
	weight = WEIGHT_NORMAL

/datum/round_event_control/heart_attack
	cost = COST_MODERATE
	tags |= list(TAG_MEDICAL)
	weight = WEIGHT_NORMAL

/datum/round_event_control/appendicitis
	cost = COST_MODERATE
	tags |= list(TAG_MEDICAL)
	weight = WEIGHT_NORMAL

/datum/round_event_control/disease_outbreak
	cost = COST_MODERATE
	tags |= list(TAG_MEDICAL)
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_dimensional
	cost = COST_MODERATE
	tags |= list(TAG_SCIENCE)
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_ectoplasm
	cost = COST_MODERATE
	tags |= list(TAG_SCIENCE)
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_flux
	cost = COST_MODERATE
	tags |= list(TAG_ENGINEERING, TAG_SCIENCE)
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_grav/high
	cost = COST_MODERATE
	tags |= list(TAG_SCIENCE)
	weight = WEIGHT_NORMAL

/datum/round_event_control/vent_clog/major
	cost = COST_MODERATE
	tags |= list(TAG_SECURITY)
	weight = WEIGHT_NORMAL

/datum/round_event_control/vent_clog/critical
	cost = COST_MODERATE
	tags |= list(TAG_SECURITY)

/datum/round_event_control/mold
	cost = COST_MODERATE
	tags |= list(TAG_MEDICAL, TAG_SECURITY)
	weight = WEIGHT_NORMAL

// MAJOR EVENTS

/datum/round_event_control/earthquake
	cost = COST_MAJOR
	tags |= list(TAG_ENGINEERING)
	weight = WEIGHT_NORMAL

/datum/round_event_control/blob
	cost = COST_MAJOR
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING)
	weight = WEIGHT_NORMAL

/datum/round_event_control/meteor_wave
	cost = COST_MAJOR
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING)
	weight = WEIGHT_NORMAL

/datum/round_event_control/meteor_wave/meaty
	cost = COST_MAJOR
	tags |= list(TAG_ENGINEERING)
	weight = 5 // meat meteors?? how queer

/datum/round_event_control/meteor_wave/ices
	max_occurrences = 0

/datum/round_event_control/immovable_rod
	cost = COST_MAJOR
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING)
	weight = WEIGHT_NORMAL

/datum/round_event_control/stray_meteor
	cost = COST_MAJOR
	tags |= list(TAG_ENGINEERING)
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_vortex
	cost = COST_MAJOR
	tags |= list(TAG_ENGINEERING)
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_pyro
	cost = COST_MAJOR
	tags |= list(TAG_ENGINEERING)
	weight = WEIGHT_NORMAL

/datum/round_event_control/spider_infestation
	cost = COST_MAJOR
	tags |= list(TAG_MEDICAL, TAG_SECURITY)
	weight = WEIGHT_NORMAL

/datum/round_event_control/revenant
	min_players = 20
	cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/abductor
	cost = COST_MAJOR
	tags |= list(TAG_MEDICAL, TAG_SECURITY)
	weight = WEIGHT_NORMAL

/datum/round_event_control/fugitives
	cost = COST_MAJOR
	tags |= list(TAG_MEDICAL, TAG_SECURITY)
	weight = WEIGHT_NORMAL

/datum/round_event_control/voidwalker
	cost = COST_MAJOR
	tags |= list(TAG_MEDICAL, TAG_SECURITY)
	weight = WEIGHT_NORMAL

/datum/round_event_control/cme
	cost = COST_MAJOR
	tags |= list(TAG_ENGINEERING, TAG_SCIENCE)
	weight = WEIGHT_NORMAL

/datum/round_event_control/stray_cargo/changeling_zombie
	cost = COST_MAJOR
	tags |= list(TAG_MEDICAL, TAG_SECURITY)
	weight = WEIGHT_NORMAL

// ANTAGS - TODO add costs

/datum/round_event_control/antagonist/solo/bloodsucker
	weight = 8
	min_players = 20

	base_antags = 2
	maximum_antags = 3
	maximum_antags_global = 3

	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/antagonist/solo/changeling
	weight = 8
	min_players = 20
	maximum_antags_global = 4

	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/antagonist/solo/heretic
	weight = 8
	min_players = 30

	base_antags = 1
	maximum_antags = 2
	maximum_antags_global = 2

	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

/datum/round_event_control/antagonist/solo/malf
	base_antags = 1
	maximum_antags = 1
	maximum_antags_global = 1

	min_players = 20
	weight = WEIGHT_NORMAL
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

/datum/round_event_control/antagonist/team/nuke_ops
	weight = WEIGHT_UNLIKELY
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

	base_antags = 2
	maximum_antags = 5
	maximum_antags_global = 5

/datum/round_event_control/operative
	// weight = 0 // shouldn't be overridden

/datum/round_event_control/antagonist/obsessed
	name = "Obsessed"
	roundstart = TRUE

	antag_flag = ROLE_OBSESSED
	antag_datum = /datum/antagonist/obsessed
	weight = 8
	maximum_antags_global = 1

	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/antagonist/obsessed/midround
	name = "Obsessed (Midround)"
	roundstart = FALSE

/datum/round_event_control/antagonist/solo/spy
	weight = 8
	maximum_antags_global = 4

	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

/datum/round_event_control/antagonist/solo/traitor
	weight = 8
	maximum_antags_global = 6

	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

// WIZARD EVENTS

/datum/round_event_control/wizard
	tags = list(TAG_WIZARD)
