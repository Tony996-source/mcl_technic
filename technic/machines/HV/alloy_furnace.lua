-- HV alloy furnace

minetest.register_craft({
	output = 'technic:hv_alloy_furnace',
	recipe = {
	{'technic:steel_ingot', 'technic:steel_ingot', 'technic:steel_ingot'},
	{'pipeworks:tube_1',              'mcl_core:gold_ingot',        'pipeworks:tube_1'},
	{'technic:steel_ingot',       'technic:hv_cable',              'technic:steel_ingot'},
	}
})


technic.register_alloy_furnace({tier = "HV", speed = 8, upgrade = 2, tube = 2, demand = {6000, 4000, 2000}})

