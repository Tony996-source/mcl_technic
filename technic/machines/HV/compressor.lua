-- HV compressor

minetest.register_craft({
	output = 'technic:hv_compressor',
	recipe = {
	{'technic:carbon_plate', 'mcl_core:iron_ingot', 'technic:carbon_plate'},
	{'technic:carbon_plate', 'mcl_core:gold_ingot', 'technic:carbon_plate'},
	{'technic:carbon_plate', 'technic:hv_cable', 'technic:carbon_plate'},
	}
})

technic.register_compressor({tier = "HV", demand = {1600, 1200, 800}, speed = 8, upgrade = 2, tube = 2})
