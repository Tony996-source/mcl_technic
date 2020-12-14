
minetest.register_craft({
	output = 'technic:iron_chest 1',
	recipe = {
		{"mcl_core:iron_ingot", "mcl_core:iron_ingot", "mcl_core:iron_ingot"},
		{"mcl_core:iron_ingot", 'mcl_chests:chest', "mcl_core:iron_ingot"},
		{"mcl_core:iron_ingot", "mcl_core:iron_ingot", "mcl_core:iron_ingot"},
	}
})

minetest.register_craft({
	output = 'technic:iron_locked_chest 1',
	recipe = {
		{'mcl_core:iron_ingot'},
		{'technic:iron_chest'},
	}
})

technic.chests:register("Iron", {
	width = 11,
	height = 4,
	sort = false,
	autosort = false,
	infotext = true,
	color = false,
	locked = false,
})

technic.chests:register("Iron", {
	width = 11,
	height = 4,
	sort = false,
	autosort = false,
	infotext = true,
	color = false,
	locked = true,
})

