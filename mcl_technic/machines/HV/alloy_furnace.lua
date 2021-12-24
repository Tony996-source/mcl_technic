-- HV alloy furnace

minetest.register_craft({
	output = 'mcl_technic:hv_alloy_furnace',
	recipe = {
	{'mcl_technic:steel_ingot', 'mcl_technic:mv_alloy_furnace', 'mcl_technic:steel_ingot'},
	{'pipeworks:tube_1',    'mcl_core:gold_ingot',      'pipeworks:tube_1'},
	{'mcl_technic:steel_ingot', 'mcl_technic:hv_cable',         'mcl_technic:steel_ingot'},
	}
})


mcl_technic.register_alloy_furnace({tier = "HV", speed = 20, upgrade = 2, tube = 2, demand = {6000, 4000, 2000}})

