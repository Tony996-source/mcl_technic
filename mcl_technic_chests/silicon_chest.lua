
	minetest.register_craft({
		output = 'mcl_technic:silicon_chest 1',
		recipe = {
		{'mcl_technic:doped_silicon_wafer','mcl_technic:doped_silicon_wafer','mcl_technic:doped_silicon_wafer'},
		{'mcl_technic:doped_silicon_wafer','mcl_chests:chest','mcl_technic:doped_silicon_wafer'},
		{'mcl_technic:doped_silicon_wafer','mcl_technic:doped_silicon_wafer','mcl_technic:doped_silicon_wafer'},
		}
	})

minetest.register_craft({
	output = 'mcl_technic:silicon_locked_chest 1',
	recipe = {
		{'mcl_core:iron_ingot'},
		{'mcl_technic:silicon_chest'},
	}
})

mcl_technic.chests:register("Silicon", {
	width = 15,
	height = 6,
	sort = true,
	autosort = true,
	infotext = true,
	color = true,
	locked = false,
})

mcl_technic.chests:register("Silicon", {
	width = 15,
	height = 6,
	sort = true,
	autosort = true,
	infotext = true,
	color = true,
	locked = true,
})

