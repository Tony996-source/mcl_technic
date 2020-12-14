
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
	width = 9,
	height = 5,
	sort = true,
	autosort = true,
	infotext = true,
	color = true,
	locked = false,
})

technic.chests:register("Iron", {
	width = 9,
	height = 5,
	sort = true,
	autosort = true,
	infotext = true,
	color = true,
	locked = true,
})

