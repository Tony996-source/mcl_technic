-- HV extractor

minetest.register_craft({
	output = 'technic:hv_extractor',
	recipe = {
	{'technic:steel_ingot', 'technic:mv_extractor', 'technic:steel_ingot'},
	{'pipeworks:tube_1', 'mcl_core:gold_ingot', 'pipeworks:tube_1'},
	{'technic:steel_block', 'technic:hv_cable', 'technic:steel_block'},
	}
})

technic.register_extractor({tier = "HV", demand = {1600, 1200, 800}, speed = 8, upgrade = 2, tube = 2})
