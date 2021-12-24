minetest.register_alias("generator_mv", "mcl_technic:generator_mv")

minetest.register_craft({
	output = 'mcl_technic:mv_generator',
	recipe = {
	{'mcl_core:stone', 'mcl_technic:lv_generator', 'mcl_core:stone'},
	{'mcl_core:stone', 'mcl_copper:copper_ingot', 'mcl_core:stone'},
	{'mcl_core:stone', 'mcl_technic:mv_cable', 'mcl_core:stone'},
	}
})

mcl_technic.register_generator({tier="MV", tube=1, supply=600})

