
	minetest.register_craft({
		output = 'technic:silicon_chest 1',
		recipe = {
		{'technic:doped_silicon_wafer','technic:doped_silicon_wafer','technic:doped_silicon_wafer'},
		{'technic:doped_silicon_wafer','mcl_chests:chest','technic:doped_silicon_wafer'},
		{'technic:doped_silicon_wafer','technic:doped_silicon_wafer','technic:doped_silicon_wafer'},
		}
	})

minetest.register_craft({
	output = 'technic:silicon_locked_chest 1',
	recipe = {
		{'mcl_core:iron_ingot'},
		{'technic:silicon_chest'},
	}
})

technic.chests:register("Silicon", {
	width = 15,
	height = 6,
	sort = true,
	autosort = true,
	infotext = true,
	color = true,
	locked = false,
})

technic.chests:register("Silicon", {
	width = 15,
	height = 6,
	sort = true,
	autosort = true,
	infotext = true,
	color = true,
	locked = true,
})

