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
	weight = WEIGHT_NORMAL
	max_occurrences = 0 // space dust is a nothing event

/datum/round_event_control/space_dust/New()
	tags |= list(TAG_ENGINEERING)

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
	weight = WEIGHT_NORMAL

/datum/round_event_control/mice_migration/New()
	tags |= list(TAG_ENGINEERING)

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
	weight = WEIGHT_NORMAL

/datum/round_event_control/grey_tide/New()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/gravity_generator_blackout
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/gravity_generator_blackout/New()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/shuttle_insurance
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/tram_malfunction
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/tram_malfunction/New()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/grid_check
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/bureaucratic_error
	cost = COST_MINOR
	weight = 5 // It's annoying

/datum/round_event_control/vent_clog
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

// /datum/round_event_control/anomaly

/datum/round_event_control/anomaly/New()
	tags |= list(TAG_SCIENCE)

/datum/round_event_control/anomaly/anomaly_hallucination
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_grav
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_bioscrambler
	cost = COST_MINOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_bioscrambler/New()
	tags |= list(TAG_MEDICAL)

/datum/round_event_control/anomaly/anomaly_bluespace
	cost = COST_MINOR
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
	weight = WEIGHT_NORMAL

/datum/round_event_control/brand_intelligence/New()
	tags |= list(TAG_ENGINEERING, TAG_MEDICAL)

/datum/round_event_control/carp_migration
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/carp_migration/New()
	tags |= list(TAG_SECURITY, TAG_MEDICAL)

/datum/round_event_control/communications_blackout
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/ion_storm
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/processor_overload
	cost = COST_MODERATE
	weight = 5 // More severe version of comms blackout

/datum/round_event_control/processor_overload/New()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/radiation_leak
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/radiation_leak/New()
	tags |= list(TAG_ENGINEERING, TAG_MEDICAL)

/datum/round_event_control/sandstorm
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/sandstorm/New()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/shuttle_catastrophe
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/spacevine
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/portal_storm_syndicate
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/portal_storm_syndicate/New()
	tags |= list(TAG_SECURITY, TAG_MEDICAL)

// BUG EDIT START
/datum/round_event_control/radiation_storm
	cost = COST_MODERATE
	max_occurrences = 2
	weight = WEIGHT_NORMAL

/datum/round_event_control/radiation_storm/New()
	tags |= list(TAG_MEDICAL)

/datum/round_event_control/wormholes
	cost = COST_MODERATE
	max_occurrences = 2 // BUG: more than two wormholes would be pretty annoying, like the radstorm
	weight = WEIGHT_NORMAL

/datum/round_event_control/wormholes/New()
	tags |= list(TAG_MEDICAL)

/datum/round_event_control/heart_attack
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/heart_attack/New()
	tags |= list(TAG_MEDICAL)

/datum/round_event_control/appendicitis
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/appendicitis/New()
	tags |= list(TAG_MEDICAL)

/datum/round_event_control/disease_outbreak
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/disease_outbreak/New()
	tags |= list(TAG_MEDICAL)

/datum/round_event_control/anomaly/anomaly_dimensional
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_dimensional/New()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/anomaly/anomaly_ectoplasm
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_flux
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_flux/New()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/anomaly/anomaly_grav/high
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_grav/high/New()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/vent_clog/major
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/vent_clog/major/New()
	tags |= list(TAG_SECURITY)

/datum/round_event_control/vent_clog/critical
	cost = COST_MODERATE

/datum/round_event_control/vent_clog/critical/New()
	tags |= list(TAG_SECURITY)

/datum/round_event_control/mold
	cost = COST_MODERATE
	weight = WEIGHT_NORMAL

/datum/round_event_control/mold/New()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

// MAJOR EVENTS

/datum/round_event_control/earthquake
	cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/earthquake/New()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/blob
	cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/blob/New()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING)

/datum/round_event_control/meteor_wave
	cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/meteor_wave/New()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING)

/datum/round_event_control/meteor_wave/meaty
	cost = COST_MAJOR
	weight = 5 // meat meteors?? how queer

/datum/round_event_control/meteor_wave/ices
	max_occurrences = 0

/datum/round_event_control/immovable_rod
	cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/immovable_rod/New()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING)

/datum/round_event_control/stray_meteor
	cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/stray_meteor/New()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/anomaly/anomaly_vortex
	cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_vortex/New()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/anomaly/anomaly_pyro
	cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/anomaly/anomaly_pyro/New()
	tags |= list(TAG_ENGINEERING)

/datum/round_event_control/spider_infestation
	cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/spider_infestation/New()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/revenant
	min_players = 20
	cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/abductor
	cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/abductor/New()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/fugitives
	cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/fugitives/New()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/voidwalker
	cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/voidwalker/New()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/cme
	cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/cme/New()
	tags |= list(TAG_ENGINEERING, TAG_SCIENCE)


/datum/round_event_control/stray_cargo/changeling_zombie
	cost = COST_MAJOR
	weight = WEIGHT_NORMAL

/datum/round_event_control/stray_cargo/changeling_zombie/New()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

// ANTAGS

/datum/round_event_control/antagonist
	cost = COST_MAJOR
	cooldown_override = 5

/datum/round_event_control/antagonist/solo/bloodsucker
	weight = 8
	min_players = 20

	base_antags = 2
	maximum_antags = 3
	maximum_antags_global = 3

/datum/round_event_control/antagonist/solo/bloodsucker/New()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/antagonist/solo/changeling
	weight = 8
	min_players = 20
	maximum_antags_global = 4

/datum/round_event_control/antagonist/solo/changeling/New()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/antagonist/solo/heretic
	weight = 8
	min_players = 30

	base_antags = 1
	maximum_antags = 2
	maximum_antags_global = 2

/datum/round_event_control/antagonist/solo/heretic/New()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

/datum/round_event_control/antagonist/solo/malf
	base_antags = 1
	maximum_antags = 1
	maximum_antags_global = 1

	min_players = 20
	weight = WEIGHT_NORMAL

/datum/round_event_control/antagonist/solo/malf/New()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

/datum/round_event_control/antagonist/team/nuke_ops
	cost = COST_SUPERMAJOR
	weight = WEIGHT_UNLIKELY

	base_antags = 2
	maximum_antags = 5
	maximum_antags_global = 5

/datum/round_event_control/antagonist/team/nuke_ops/New()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

/datum/round_event_control/operative
	// weight = 0 // shouldn't be overridden

/datum/round_event_control/operative/New()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

/datum/round_event_control/antagonist/obsessed
	cost = COST_SEMIMAJOR
	weight = 8
	maximum_antags_global = 1

/datum/round_event_control/antagonist/obsessed/New()
	tags |= list(TAG_MEDICAL, TAG_SECURITY)

/datum/round_event_control/antagonist/obsessed/midround
	name = "Obsessed (Midround)"
	roundstart = FALSE

/datum/round_event_control/antagonist/solo/spy
	weight = 8
	maximum_antags_global = 4

/datum/round_event_control/antagonist/solo/spy/New()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

/datum/round_event_control/antagonist/solo/traitor
	weight = 8
	maximum_antags_global = 6

/datum/round_event_control/antagonist/solo/traitor/New()
	tags |= list(TAG_MEDICAL, TAG_ENGINEERING, TAG_SECURITY)

// WIZARD EVENTS

// /datum/round_event_control/wizard

/datum/round_event_control/wizard/New()
	tags = list(TAG_WIZARD)
