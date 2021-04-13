-- HV freezer

minetest.register_craft({
	output = 'technic:hv_freezer',
	recipe = {
	{'technic:carbon_plate', 'technic:carbon_plate', 'technic:carbon_plate'},
	{'pipeworks:tube_1', 'mcl_core:gold_ingot',    'pipeworks:tube_1'},
	{'technic:steel_block', 'technic:hv_cable', 'technic:steel_block'},
	}
})

technic.register_freezer({tier = "HV", demand = {1600, 1200, 800}, speed = 20, upgrade = 2, tube = 2})
