-- LV Alloy furnace

-- FIXME: kpoppel: I'd like to introduce an induction heating element here...
minetest.register_craft({
	output = 'mcl_technic:lv_alloy_furnace',
	recipe = {
	{'mcl_core:brick_block', 'mcl_technic:coal_alloy_furnace', 'mcl_core:brick_block'},
	{'mcl_core:brick_block', 'mcl_core:iron_ingot', 'mcl_core:brick_block'},
	{'mcl_core:brick_block', 'mcl_technic:lv_cable', 'mcl_core:brick_block'},
	}
})

mcl_technic.register_alloy_furnace({tier = "LV", speed = 5, demand = {300}})

