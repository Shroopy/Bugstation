/datum/round_event_control/brand_intelligence
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_DESTRUCTIVE, TAG_COMMUNAL)
	weight = 10

/datum/round_event_control/carp_migration
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNAL, TAG_COMBAT)
	weight = 10

/datum/round_event_control/communications_blackout
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNAL, TAG_SPOOKY)
	weight = 10

/* BUG EDIT START
/datum/round_event_control/grid_check
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNAL, TAG_SPOOKY)
BUG EDIT END */

/datum/round_event_control/ion_storm
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_TARGETED)
	weight = 10

/datum/round_event_control/processor_overload
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNAL, TAG_DESTRUCTIVE)
	weight = 5 // More severe version of comms blackout

/* BUG EDIT START
/datum/round_event_control/radiation_storm
	max_occurrences = 2
BUG EDIT END */

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

/* BUG EDIT START
/datum/round_event_control/vent_clog
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNAL)
	weight = 10
BUG EDIT END */

/* BUG EDIT START: this shouldn't do anything but better safe than sorry
/datum/round_event_control/anomaly
	weight = 10 // Lower from original 15 because it KEEPS SPAWNING THEM
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNAL, TAG_DESTRUCTIVE)
BUG EDIT END */

/datum/round_event_control/spacevine
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNAL, TAG_COMBAT)
	weight = 10

/datum/round_event_control/portal_storm_syndicate
	track = EVENT_TRACK_MODERATE
	tags = list(TAG_COMMUNUAL, TAG_COMBAT)
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

// BUG EDIT END
