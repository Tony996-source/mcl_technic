-- HV recycler

minetest.register_craft({
	output = 'technic:hv_recycler',
	recipe = {
	{'technic:steel_ingot', 'technic:carbon_plate', 'technic:steel_ingot'},
	{'pipeworks:tube_1', 'mcl_core:gold_ingot',    'pipeworks:tube_1'},
	{'technic:carbon_plate', 'technic:hv_cable', 'technic:carbon_plate'},
	}
})

technic.register_recycler({tier = "HV", demand = {1600, 1200, 800}, speed = 20, upgrade = 2, tube = 2})
