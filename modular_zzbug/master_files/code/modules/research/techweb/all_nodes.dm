/datum/techweb_node/magazineresearch/New()
	. = ..()
	design_ids += "s12g_rubber"
	design_ids += "s12g_bslug"

/datum/techweb_node/exotic_ammo/New()
	. = ..()
	design_ids += "sec_dart"
	design_ids += "sec_Islug"
	design_ids += "sec_hornet"
	design_ids += "sec_antitide"
	design_ids += "sec_flechette"

/datum/techweb_node/riot_supression/New()
	. = ..()
	design_ids -= "s12g_hornet"
	design_ids -= "s12g_antitide"
	design_ids -= "s12g_rubber"
	design_ids -= "s12g_bslug"
	design_ids -= "s12g_incinslug"
	design_ids -= "s12g_flechette"

/datum/techweb_node/basic_arms/New()
	. = ..()
	design_ids -= "sec_dart"
	design_ids -= "sec_Islug"
	design_ids += "sec_shotgun_slug"
	design_ids += "sec_buckshot_shell"
