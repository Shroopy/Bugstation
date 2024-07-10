/datum/round_event_control/aurora_caelus
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_COMMUNAL, TAG_POSITIVE, TAG_SPACE)
	// weight = 1 // doesn't need overriding just letting you know :3

/* BUG EDIT START
/datum/round_event_control/brain_trauma
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_TARGETED, TAG_VERY_TARGETED)
BUG EDIT END */

/datum/round_event_control/camera_failure
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_COMMUNAL, TAG_SPOOKY)
	weight = 10

/* BUG EDIT START
/datum/round_event_control/disease_outbreak
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_TARGETED)
BUG EDIT END */

/datum/round_event_control/space_dust
	track = EVENT_TRACK_MUNDANE
	tags = list(TAG_DESTRUCTIVE, TAG_SPACE)
	weight = 10

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
	var/list/run_situations = list()
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

// BUG EDIT START
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
// BUG EDIT END
