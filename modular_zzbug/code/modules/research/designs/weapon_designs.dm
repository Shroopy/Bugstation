/datum/design/hornet_shell/sec
	name = "Hornet Shell (Less Lethal)"
	id = "sec_hornet"
	desc = "Hornet's nest shells. These are less-lethal shells that will bounce off walls and direct themselves toward nearby targets."
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT)
	build_type = PROTOLATHE | AWAY_LATHE
	build_path = /obj/item/ammo_casing/shotgun/beehive
	category = list(
		RND_CATEGORY_HACKED,
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/antitide_shell/sec
	name = "Stardust Shell (Less Lethal)"
	id = "sec_antitide"
	desc = "Express pelletshot shells. These are less-lethal and will embed in targets, causing pain on movement."
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT)
	build_type = PROTOLATHE | AWAY_LATHE
	build_path = /obj/item/ammo_casing/shotgun/antitide
	category = list(
		RND_CATEGORY_HACKED,
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY
	autolathe_exportable = FALSE

/datum/design/flechette_shell/sec
	name = "Flechette Shell (Lethal)"
	id = "sec_flechette"
	desc = "Flechette shells. Each shell contains a small group of tumbling blades that excel at causing terrible wounds."
	materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT)
	build_type = PROTOLATHE | AWAY_LATHE
	build_path = /obj/item/ammo_casing/shotgun/flechette
	category = list(
		RND_CATEGORY_HACKED,
		RND_CATEGORY_WEAPONS + RND_SUBCATEGORY_WEAPONS_AMMO
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY
	autolathe_exportable = FALSE
