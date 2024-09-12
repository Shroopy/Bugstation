/datum/round_event_control/antagonist/team/nuke_ops/clown_ops
	name = "Clown Operatives"
	roundstart = TRUE

	antag_flag = ROLE_CLOWN_OPERATIVE
	antag_datum = /datum/antagonist/nukeop/clownop
	antag_leader_datum = /datum/antagonist/nukeop/leader/clownop

	typepath = /datum/round_event/antagonist/team/nukie

	ruleset_lazy_templates = list(LAZY_TEMPLATE_KEY_NUKIEBASE)

/datum/round_event/antagonist/team/nukie/clown
	job_type = /datum/job/clown_operative
	required_role = ROLE_CLOWN_OPERATIVE

/datum/round_event_control/antagonist/wizard
	name = "Wizard"
	roundstart = TRUE

	antag_flat = ROLE_WIZARD
	antag_datum = /datum/antagonist/wizard
	weight = 0
	min_players = 20
	maximum_antags_global = 1

/datum/round_event_control/antagonist/team/bloodcult
	name = "Blood Cult"
	roundstart = TRUE

	antag_flag = ROLE_CULTIST
	antag_datum = /datum/antagonist/cult

	weight = 0
	tags = list(TAG_COMBAT, TAG_SPOOKY, TAG_CREW_ANTAG)

	base_antags = 2
	maximum_antags = 2

/datum/round_event_control/antagonist/team/revs
	name = "Revolution"
	roundstart = TRUE

	antag_flag = ROLE_REV_HEAD
	antag_datum = /datum/antagonist/rev/head

	weight = 0
	tags = list(TAG_COMBAT, TAG_CREW_ANTAG)

	base_antags = 3
	maximum_antags = 3

/datum/round_event_control/antagonist/team/traitorbro
	name = "Blood Brothers"
	roundstart = TRUE

	antag_flag = ROLE_BROTHER
	antag_datum = /datum/antagonist/brother

	weight = 0
	tags = list(TAG_CREW_ANTAG)

	base_antags = 2
	maximum_antags = 2
