-- MV alloy furnace

minetest.register_craft({
	output = 'technic:mv_alloy_furnace',
	recipe = {
	{'mcl_core:brick', 'mcl_core:brick', 'mcl_core:brick'},
	{'mcl_core:brick', 'mcl_core:gold_ingot', 'mcl_core:brick'},
	{'mcl_core:brick', 'technic:mv_cable', 'mcl_core:brick'},
	}
})


technic.register_alloy_furnace({tier = "MV", speed = 1.5, upgrade = 1, tube = 1, demand = {3000, 2000, 1000}})

