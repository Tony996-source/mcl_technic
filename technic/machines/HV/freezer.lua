-- HV freezer

minetest.register_craft({
	output = 'technic:hv_freezer',
	recipe = {
	{'technic:carbon_plate', 'technic:carbon_plate', 'technic:carbon_plate'},
	{'pipeworks:tube_1', 'mcl_core:gold_ingot',    'pipeworks:tube_1'},
	{'mcl_core:ironblock', 'technic:hv_cable', 'mcl_core:ironblock'},
	}
})

technic.register_freezer({tier = "HV", demand = {1600, 1200, 800}, speed = 8, upgrade = 2, tube = 2})
