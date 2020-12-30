minetest.register_alias("hv_generator", "technic:hv_generator")

minetest.register_craft({
	output = 'technic:hv_generator',
	recipe = {
	{'technic:steel_ingot', 'mcl_furnaces:furnace', 'technic:steel_ingot'},
	{'pipeworks:tube_1', 'mcl_core:gold_ingot', 'pipeworks:tube_1'},
	{'technic:steel_block', 'technic:hv_cable', 'technic:steel_block'},
	}
})

technic.register_generator({tier="HV", tube=1, supply=1200})

