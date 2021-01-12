-- MV alloy furnace

minetest.register_craft({
	output = 'technic:mv_alloy_furnace',
	recipe = {
	{'mcl_core:brick', 'technic:lv_alloy_furnace', 'mcl_core:brick'},
	{'mcl_core:brick', 'technic:copper_ingot', 'mcl_core:brick'},
	{'mcl_core:brick', 'technic:mv_cable', 'mcl_core:brick'},
	}
})


technic.register_alloy_furnace({tier = "MV", speed = 4, upgrade = 1, tube = 1, demand = {3000, 2000, 1000}})

