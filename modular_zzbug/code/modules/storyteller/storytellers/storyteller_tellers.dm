/datum/storyteller/lowpop_guide
	name = "Lowpop Guide"
	desc = "The Guide is the default Storyteller, and the comparison point for every other Storyteller. Best for an average, varied experience. Lowpop accounts for the fact that targeted and destructive events are more dangerous with few crew."
	antag_divisor = 8
	population_max = 16
	tag_cost_multipliers = list(
		TAG_DESTRUCTIVE = 2 // It's not so easy to deal with destructive stuff on lowpop, who knows if we have engineers
	)
	tag_weight_multipliers = list(
		TAG_DESTRUCTIVE = 0.5 // See above
	)

/datum/storyteller/chill
	name = "Chill"
	desc = "Chill makes events happen half as often, and gives more time at the start of the round before starting events."
	antag_divisor = 8
	population_min = 8
	point_gains_multipliers = list(
		EVENT_TRACK_MUNDANE = 0.5,
		EVENT_TRACK_MODERATE = 0.5,
		EVENT_TRACK_MAJOR = 0.5,
		EVENT_TRACK_ROLESET = 0.5,
		)
	tag_cost_multipliers = list(
		TAG_TARGETED = 0.5, // targeted events cause little chaos
		TAG_VERY_TARGETED = 0.5, // very targeted events cause even less chaos, multiplier compounded with targeted
	)

/datum/storyteller/lowpop_chill
	name = "Lowpop Chill"
	desc = "Chill makes events happen half as often, and gives more time at the start of the round before starting events. Lowpop accounts for the fact that targeted and destructive events are more dangerous with few crew."
	antag_divisor = 8
	population_max = 16
	starting_point_multipliers = list(
		EVENT_TRACK_MUNDANE = 2,
		EVENT_TRACK_MODERATE = 2,
		EVENT_TRACK_MAJOR = 2,
		EVENT_TRACK_ROLESET = 2,
		)
	point_gains_multipliers = list(
		EVENT_TRACK_MUNDANE = 0.5,
		EVENT_TRACK_MODERATE = 0.5,
		EVENT_TRACK_MAJOR = 0.5,
		EVENT_TRACK_ROLESET = 0.5,
		)
	tag_cost_multipliers = list(
		TAG_DESTRUCTIVE = 2 // It's not so easy to deal with destructive stuff on lowpop, who knows if we have engineers
	)
	tag_weight_multipliers = list(
		TAG_DESTRUCTIVE = 0.5 // See above
	)
