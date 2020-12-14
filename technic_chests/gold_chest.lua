
	minetest.register_craft({
		output = 'technic:gold_chest',
		recipe = {
			{'mcl_core:gold_ingot','mcl_core:gold_ingot','mcl_core:gold_ingot'},
			{'mcl_core:gold_ingot',"mcl_chests:chest",'mcl_core:gold_ingot'},
			{'mcl_core:gold_ingot','mcl_core:gold_ingot','mcl_core:gold_ingot'},
		}
	})

minetest.register_craft({
	output = 'technic:gold_locked_chest',
	recipe = {
		{'mcl_core:iron_ingot'},
		{'technic:gold_chest'},
	}
})

technic.chests:register("Gold", {
	width = 13,
	height = 5,
	sort = true,
	autosort = true,
	infotext = true,
	color = false,
	locked = false,
})

technic.chests:register("Gold", {
	width = 13,
	height = 5,
	sort = true,
	autosort = true,
	infotext = true,
	color = false,
	locked = true,
})

