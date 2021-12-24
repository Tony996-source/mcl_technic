
	minetest.register_craft({
		output = 'mcl_technic:gold_chest',
		recipe = {
			{'mcl_core:gold_ingot','mcl_core:gold_ingot','mcl_core:gold_ingot'},
			{'mcl_core:gold_ingot',"mcl_chests:chest",'mcl_core:gold_ingot'},
			{'mcl_core:gold_ingot','mcl_core:gold_ingot','mcl_core:gold_ingot'},
		}
	})

minetest.register_craft({
	output = 'mcl_technic:gold_locked_chest',
	recipe = {
		{'mcl_core:iron_ingot'},
		{'mcl_technic:gold_chest'},
	}
})

mcl_technic.chests:register("Gold", {
	width = 13,
	height = 5,
	sort = true,
	autosort = true,
	infotext = true,
	color = false,
	locked = false,
})

mcl_technic.chests:register("Gold", {
	width = 13,
	height = 5,
	sort = true,
	autosort = true,
	infotext = true,
	color = false,
	locked = true,
})

