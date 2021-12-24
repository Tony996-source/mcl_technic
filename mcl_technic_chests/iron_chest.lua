
minetest.register_craft({
	output = 'mcl_technic:iron_chest 1',
	recipe = {
		{"mcl_core:iron_ingot", "mcl_core:iron_ingot", "mcl_core:iron_ingot"},
		{"mcl_core:iron_ingot", 'mcl_chests:chest', "mcl_core:iron_ingot"},
		{"mcl_core:iron_ingot", "mcl_core:iron_ingot", "mcl_core:iron_ingot"},
	}
})

minetest.register_craft({
	output = 'mcl_technic:iron_locked_chest 1',
	recipe = {
		{'mcl_core:iron_ingot'},
		{'mcl_technic:iron_chest'},
	}
})

mcl_technic.chests:register("Iron", {
	width = 11,
	height = 4,
	sort = false,
	autosort = false,
	infotext = true,
	color = false,
	locked = false,
})

mcl_technic.chests:register("Iron", {
	width = 11,
	height = 4,
	sort = false,
	autosort = false,
	infotext = true,
	color = false,
	locked = true,
})

