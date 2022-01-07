-- HV sawmill

minetest.register_craft({
	output = 'mcl_technic:hv_sawmill',
	recipe = {
	{'mcl_technic:steel_ingot', 'mcl_technic:diamond_drill_head', 'mcl_technic:steel_ingot'},
	{'mcl_pipeworks:tube_1', 'mcl_core:gold_ingot', 'mcl_pipeworks:tube_1'},
	{'mcl_technic:steel_ingot', 'mcl_technic:hv_cable', 'mcl_technic:steel_ingot'},
	}
})

mcl_technic.register_sawmill({tier = "HV", demand = {1600, 1200, 800}, speed = 20, upgrade = 2, tube = 2})
