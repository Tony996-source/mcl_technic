minetest.register_alias("generator_mv", "technic:generator_mv")

minetest.register_craft({
	output = 'technic:mv_generator',
	recipe = {
	{'mcl_core:stone', 'mcl_furnaces:furnace', 'mcl_core:stone'},
	{'mcl_core:stone', 'technic:copper_ingot', 'mcl_core:stone'},
	{'mcl_core:stone', 'technic:mv_cable', 'mcl_core:stone'},
	}
})

technic.register_generator({tier="MV", tube=1, supply=600})

