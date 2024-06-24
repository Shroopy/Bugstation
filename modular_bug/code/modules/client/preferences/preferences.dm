/datum/preference/text/flavor_text_nsfw/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	if(CONFIG_GET(flag/disable_erp_preferences))
		return FALSE

	return TRUE

/datum/preference/choiced/show_nsfw_flavor_text/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	if(CONFIG_GET(flag/disable_erp_preferences))
		return FALSE

	return TRUE

/datum/preference/text/headshot/nsfw/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	if(CONFIG_GET(flag/disable_erp_preferences))
		return FALSE

	return TRUE

/datum/preference/text/headshot/silicon/nsfw/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	if(CONFIG_GET(flag/disable_erp_preferences))
		return FALSE

	return TRUE
