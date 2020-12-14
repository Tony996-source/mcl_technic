minetest.register_alias("hv_generator", "technic:hv_generator")

minetest.register_craft({
	output = 'technic:hv_generator',
	recipe = {
	{'technic:carbon_plate', 'mcl_furnaces:furnace', 'technic:carbon_plate'},
	{'pipeworks:tube_1', 'mcl_core:gold_ingot', 'pipeworks:tube_1'},
	{'technic:carbon_plate', 'technic:hv_cable', 'technic:carbon_plate'},
	}
})

technic.register_generator({tier="HV", tube=1, supply=1200})

