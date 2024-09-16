/datum/techweb_node/magazineresearch_exotic
	id = "storedmunition_tech_exotic"
	display_name = "Exotic Military Grade Munition Research"
	description = "Exotic ammo types in cutting-edge magazines."
	prereq_ids = list("storedmunition_tech", "exotic_ammo")
	design_ids = list(
		"s12g_hornet",
		"s12g_antitide",
		"s12g_incinslug",
		"s12g_flechette",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
