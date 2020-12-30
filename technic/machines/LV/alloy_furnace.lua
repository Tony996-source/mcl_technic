-- LV Alloy furnace

-- FIXME: kpoppel: I'd like to introduce an induction heating element here...
minetest.register_craft({
	output = 'technic:lv_alloy_furnace',
	recipe = {
	{'mcl_core:brick', 'mcl_core:brick', 'mcl_core:brick'},
	{'mcl_core:brick', 'mcl_core:iron_ingot', 'mcl_core:brick'},
	{'mcl_core:brick', 'technic:lv_cable', 'mcl_core:brick'},
	}
})

technic.register_alloy_furnace({tier = "LV", speed = 1, demand = {300}})

