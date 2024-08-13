/mob/living/carbon/human/proc/heal(seconds_per_tick, times_fired)
	var/healAmt = maxHealth / 900 / 3 // 900 seconds = 15 minutes to fully heal from crit, split across 3 damage types
	var/need_mob_update = FALSE
	var/leftover = 0
	var/amtHealed
	amtHealed = adjustBruteLoss(-(healAmt * seconds_per_tick), updating_health = FALSE, required_bodytype = BODYTYPE_ORGANIC)
	need_mob_update |= amtHealed
	leftover = healAmt - amtHealed
	amtHealed = adjustFireLoss(-(healAmt * seconds_per_tick + leftover), updating_health = FALSE, required_bodytype = BODYTYPE_ORGANIC)
	need_mob_update |= amtHealed
	leftover = healAmt - amtHealed
	amtHealed = adjustToxLoss(-(healAmt * seconds_per_tick + leftover), updating_health = FALSE)
	need_mob_update |= amtHealed
	// leftover = healAmt - amtHealed // Unnecessary
	// TODO deal liver damage for tox heal

	if(need_mob_update)
		updatehealth()
