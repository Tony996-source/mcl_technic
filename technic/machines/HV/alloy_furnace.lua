-- HV alloy furnace

minetest.register_craft({
	output = 'technic:hv_alloy_furnace',
	recipe = {
	{'technic:carbon_plate', 'mcl_core:iron_ingot', 'technic:carbon_plate'},
	{'pipeworks:tube_1',              'mcl_core:gold_ingot',        'pipeworks:tube_1'},
	{'technic:carbon_plate',       'technic:hv_cable',              'technic:carbon_plate'},
	}
})


technic.register_alloy_furnace({tier = "HV", speed = 8, upgrade = 2, tube = 2, demand = {6000, 4000, 2000}})

