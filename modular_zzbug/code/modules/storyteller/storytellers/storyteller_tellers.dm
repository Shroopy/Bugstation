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
