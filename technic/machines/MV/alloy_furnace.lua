-- MV alloy furnace

minetest.register_craft({
	output = 'technic:mv_alloy_furnace',
	recipe = {
	{'mcl_core:brick_block', 'technic:lv_alloy_furnace', 'mcl_core:brick_block'},
	{'mcl_core:brick_block', 'technic:copper_ingot', 'mcl_core:brick_block'},
	{'mcl_core:brick_block', 'technic:mv_cable', 'mcl_core:brick_block'},
	}
})


technic.register_alloy_furnace({tier = "MV", speed = 10, upgrade = 1, tube = 1, demand = {3000, 2000, 1000}})

