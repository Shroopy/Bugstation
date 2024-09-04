/datum/round_event_control/scrubber_overflow/threatening
	weight = 0
	max_occurrences = 0

/datum/round_event_control/scrubber_overflow/catastrophic
	weight = 0
	max_occurrences = 0

/datum/round_event_control/scrubber_overflow/every_vent
	weight = 0
	max_occurrences = 0

/datum/round_event_control/scrubber_overflow/ices
	weight = 0
	max_occurrences = 0

/datum/round_event_control/aurora_caelus
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_COMMUNAL, TAG_POSITIVE, TAG_SPACE)
	weight = 10

/datum/round_event_control/camera_failure
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_COMMUNAL, TAG_SPOOKY)
	weight = 10

/datum/round_event_control/space_dust
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_DESTRUCTIVE, TAG_SPACE)
	weight = 10
	max_occurrences = 0 // space dust is a nothing event

/datum/round_event_control/electrical_storm
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_SPOOKY)
	weight = 5 // it's annoying

/datum/round_event_control/fake_virus
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_TARGETED)
	weight = 10

/datum/round_event_control/falsealarm
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_COMMUNAL)
	weight = 10

/datum/round_event_control/market_crash
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_COMMUNAL)
	weight = 10

/datum/round_event_control/mice_migration
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_DESTRUCTIVE)
	weight = 10

/datum/round_event_control/wisdomcow
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_COMMUNAL, TAG_POSITIVE)
	weight = 10

/datum/round_event_control/shuttle_loan
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_COMMUNAL)
	weight = 10

/datum/round_event_control/mass_hallucination
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_COMMUNAL)
	weight = 10

/datum/round_event_control/stray_cargo
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_COMMUNAL)
	weight = 10

/datum/round_event_control/grey_tide
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_DESTRUCTIVE, TAG_SPOOKY)
	weight = 10

/datum/round_event_control/gravity_generator_blackout
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_COMMUNAL, TAG_SPACE)
	weight = 10

/datum/round_event_control/shuttle_insurance
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_COMMUNAL)
	weight = 10

/datum/round_event_control/tram_malfunction
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_DESTRUCTIVE)
	weight = 10

/datum/round_event_control/grid_check
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_COMMUNAL, TAG_SPOOKY)
	weight = 10

/datum/round_event_control/bureaucratic_error
	track = EVENT_TRACK_MUNDANE
	weight = 5 // It's annoying

/datum/round_event_control/vent_clog
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_COMMUNAL)
	weight = 10

/datum/round_event_control/anomaly/anomaly_hallucination
	track = EVENT_TRACK_MUNDANE
	weight = 10

/datum/round_event_control/anomaly/anomaly_grav
	track = EVENT_TRACK_MUNDANE
	weight = 10

/datum/round_event_control/anomaly/anomaly_bioscrambler
	track = EVENT_TRACK_MUNDANE
	weight = 10

/datum/round_event_control/anomaly/anomaly_bluespace
	track = EVENT_TRACK_MUNDANE
	weight = 7.5 // Our stuff being teleported away is kinda annoying but not too bad

/datum/round_event_control/vent_clog/strange
	track = EVENT_TRACK_MUNDANE
	max_occurrences = 0 // none of this for now, not sure about the animals in it

/datum/round_event_control/brand_intelligence
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_DESTRUCTIVE, TAG_COMMUNAL, TAG_CHAOTIC)
	weight = 10

/datum/round_event_control/carp_migration
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNAL, TAG_COMBAT)
	weight = 10

/datum/round_event_control/communications_blackout
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNAL, TAG_SPOOKY)
	weight = 10

/datum/round_event_control/ion_storm
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_TARGETED)
	weight = 10

/datum/round_event_control/processor_overload
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNAL, TAG_DESTRUCTIVE)
	weight = 5 // More severe version of comms blackout

/datum/round_event_control/radiation_leak
	track = EVENT_TRACK_MODERATE
	weight = 10

/datum/round_event_control/sandstorm
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_DESTRUCTIVE)
	weight = 10

/datum/round_event_control/shuttle_catastrophe
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNAL)
	weight = 10

/datum/round_event_control/spacevine
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNAL, TAG_COMBAT, TAG_CHAOTIC)
	weight = 10

/datum/round_event_control/portal_storm_syndicate
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNAL, TAG_COMBAT)
	weight = 10

// BUG EDIT START
/datum/round_event_control/radiation_storm
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNAL)
	max_occurrences = 2
	weight = 10

/datum/round_event_control/wormholes
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNAL)
	max_occurrences = 2 // BUG: more than two wormholes would be pretty annoying, like the radstorm
	weight = 10

/datum/round_event_control/heart_attack
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_TARGETED, TAG_VERY_TARGETED)
	weight = 10

/datum/round_event_control/appendicitis
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_TARGETED, TAG_VERY_TARGETED)
	weight = 10

/datum/round_event_control/disease_outbreak
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_TARGETED)
	weight = 10

/datum/round_event_control/anomaly/anomaly_dimensional
	track = EVENT_TRACK_MODERATE
	weight = 10

/datum/round_event_control/anomaly/anomaly_ectoplasm
	track = EVENT_TRACK_MODERATE
	weight = 10

/datum/round_event_control/anomaly/anomaly_flux
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_DESTRUCTIVE)
	weight = 10

/datum/round_event_control/anomaly/anomaly_grav/high
	track = EVENT_TRACK_MODERATE
	weight = 10

/datum/round_event_control/vent_clog/major
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMBAT)
	weight = 10

/datum/round_event_control/vent_clog/critical
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMBAT, TAG_CHAOTIC)

/datum/round_event_control/mold
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNAL, TAG_COMBAT, TAG_CHAOTIC)
	weight = 10

/datum/round_event_control/earthquake
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_DESTRUCTIVE)
	weight = 10

/datum/round_event_control/blob
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_DESTRUCTIVE, TAG_COMBAT, TAG_CHAOTIC)
	weight = 10

/datum/round_event_control/meteor_wave
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_COMMUNAL, TAG_SPACE, TAG_DESTRUCTIVE, TAG_CHAOTIC)
	weight = 10

/datum/round_event_control/meteor_wave/meaty
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_COMMUNAL, TAG_SPACE, TAG_DESTRUCTIVE)
	weight = 20 // meat meteors?? how queer

/datum/round_event_control/meteor_wave/ices
	weight = 0

/datum/round_event_control/immovable_rod
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_DESTRUCTIVE)
	weight = 10

/datum/round_event_control/stray_meteor
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_DESTRUCTIVE, TAG_SPACE)
	weight = 10

/datum/round_event_control/anomaly/anomaly_vortex
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_DESTRUCTIVE)
	weight = 10

/datum/round_event_control/anomaly/anomaly_pyro
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_DESTRUCTIVE)
	weight = 10

/datum/round_event_control/spider_infestation
	track = EVENT_TRACK_MAJOR
	weight = 10

/datum/round_event_control/revenant
	min_players = 20
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_DESTRUCTIVE, TAG_SPOOKY)
	weight = 10

/datum/round_event_control/abductor
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_COMBAT, TAG_SPOOKY, TAG_CHAOTIC)
	weight = 10

/datum/round_event_control/fugitives
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_COMBAT)
	weight = 10

/datum/round_event_control/voidwalker
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_COMBAT, TAG_SPOOKY, TAG_SPACE)
	weight = 10

/datum/round_event_control/cme
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_DESTRUCTIVE, TAG_COMMUNAL, TAG_CHAOTIC)
	weight = 10

/datum/round_event_control/stray_cargo/changeling_zombie
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_COMMUNAL, TAG_COMBAT, TAG_CHAOTIC, TAG_SPOOKY)
	weight = 10

/datum/round_event_control/cme
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_DESTRUCTIVE, TAG_COMMUNAL, TAG_CHAOTIC)
	weight = 10

/datum/round_event_control/stray_cargo/changeling_zombie
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_COMMUNAL, TAG_COMBAT, TAG_CHAOTIC, TAG_SPOOKY)
	weight = 10

/datum/round_event_control/scrubber_overflow
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_COMMUNAL)
	weight = 10

// ANTAGS

/datum/round_event_control/antagonist/solo/bloodsucker
	name = "Bloodsuckers"
	roundstart = TRUE

	antag_flag = ROLE_BLOODSUCKER
	antag_datum = /datum/antagonist/bloodsucker
	weight = 8
	min_players = 20

	base_antags = 2
	maximum_antags = 3
	maximum_antags_global = 3

	tags = list(TAG_COMBAT, TAG_SPOOKY, TAG_CREW_ANTAG)

/datum/round_event_control/antagonist/solo/bloodsucker/midround
	name = "Vampiric Accident"
	roundstart = FALSE

/datum/round_event_control/antagonist/solo/changeling
	name = "Changelings"
	roundstart = TRUE

	antag_flag = ROLE_CHANGELING
	antag_datum = /datum/antagonist/changeling
	weight = 8
	min_players = 20
	maximum_antags_global = 4

	tags = list(TAG_COMBAT, TAG_SPOOKY, TAG_CREW_ANTAG)

/datum/round_event_control/antagonist/solo/changeling/midround
	name = "Genome Awakening (Changelings)"
	roundstart = FALSE

/datum/round_event_control/antagonist/solo/heretic
	name = "Heretics"
	roundstart = TRUE

	antag_flag = ROLE_HERETIC
	antag_datum = /datum/antagonist/heretic
	weight = 8
	min_players = 30

	base_antags = 1
	maximum_antags = 2
	maximum_antags_global = 2

	tags = list(TAG_COMBAT, TAG_SPOOKY, TAG_CREW_ANTAG)

/datum/round_event_control/antagonist/solo/heretic/midround
	name = "Midround Heretics"
	roundstart = FALSE

/datum/round_event_control/antagonist/solo/malf
	name = "Malfunctioning AI"

	base_antags = 1
	maximum_antags = 1
	maximum_antags_global = 1

	min_players = 20

	antag_datum = /datum/antagonist/malf_ai
	antag_flag = ROLE_MALF
	weight = 0
	tags = list(TAG_CREW_ANTAG, TAG_COMBAT, TAG_DESTRUCTIVE, TAG_CHAOTIC)
	restricted_roles = list()

/datum/round_event_control/antagonist/solo/malf/roundstart
	roundstart = TRUE
	typepath = /datum/round_event/antagonist/solo/malf_ai/roundstart
	weight = 10

/datum/round_event_control/antagonist/team/nuke_ops
	name = "Nuclear Operatives"
	roundstart = TRUE

	antag_flag = ROLE_OPERATIVE
	antag_datum = /datum/antagonist/nukeop
	antag_leader_datum = /datum/antagonist/nukeop/leader

	weight = 0
	tags = list(TAG_COMBAT, TAG_CHAOTIC)

	base_antags = 2
	maximum_antags = 5
	maximum_antags_global = 5

	typepath = /datum/round_event/antagonist/team/nukie

	ruleset_lazy_templates = list(LAZY_TEMPLATE_KEY_NUKIEBASE)

/datum/round_event_control/antagonist/obsessed
	name = "Obsessed"
	roundstart = TRUE

	antag_flag = ROLE_OBSESSED
	antag_datum = /datum/antagonist/obsessed
	weight = 8
	maximum_antags_global = 1

	tags = list(TAG_CREW_ANTAG)

/datum/round_event_control/antagonist/solo/spy
	name = "Spies"
	roundstart = TRUE

	antag_flag = ROLE_SPY
	antag_datum = /datum/antagonist/spy
	weight = 8
	maximum_antags_global = 4

	tags = list(TAG_CREW_ANTAG)

/datum/round_event_control/antagonist/solo/spy/midround
	name = "Spies (Midround)"
	roundstart = FALSE

/datum/round_event_control/antagonist/solo/traitor
	name = "Traitors"
	roundstart = TRUE

	antag_flag = ROLE_TRAITOR
	antag_datum = /datum/antagonist/traitor
	weight = 8
	maximum_antags_global = 6

	tags = list(TAG_CREW_ANTAG)

/datum/round_event_control/antagonist/solo/traitor/midround
	name = "Sleeper Agents (Traitors)"
	roundstart = FALSE
