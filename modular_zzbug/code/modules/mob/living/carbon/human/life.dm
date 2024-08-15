/mob/living/carbon/human/proc/heal(seconds_per_tick, times_fired)
	var/heal_amt = maxHealth / 900 // 900 seconds = 15 minutes to fully heal from crit, it turns out more like 11 minutes because of rounding shenanigans but it's close enough
	var/need_mob_update = FALSE
	var/leftover = 0
	var/amt_healed
	var/list/damage_types = list(BRUTE, BURN, TOX)
	do
		var/damage_type = pick_n_take(damage_types)
		switch(damage_type)
			if(BRUTE)
				amt_healed = adjustBruteLoss(-(heal_amt * seconds_per_tick + leftover), updating_health = FALSE, required_bodytype = BODYTYPE_ORGANIC)
			if(BURN)
				amt_healed = adjustFireLoss(-(heal_amt * seconds_per_tick + leftover), updating_health = FALSE, required_bodytype = BODYTYPE_ORGANIC)
			if(TOX)
				amt_healed = adjustToxLoss(-(heal_amt * seconds_per_tick + leftover), updating_health = FALSE)
				// TODO deal liver damage for tox heal
		need_mob_update |= amt_healed > 0
		leftover = max(0, heal_amt - amt_healed)
	while(damage_types.len > 0 && leftover > 0)
	if(need_mob_update)
		updatehealth()
