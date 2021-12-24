minetest.register_alias("hv_generator", "mcl_technic:hv_generator")

minetest.register_craft({
	output = 'mcl_technic:hv_generator',
	recipe = {
	{'mcl_technic:steel_ingot', 'mcl_technic:mv_generator', 'mcl_technic:steel_ingot'},
	{'pipeworks:tube_1', 'mcl_core:gold_ingot', 'pipeworks:tube_1'},
	{'mcl_technic:steel_block', 'mcl_technic:hv_cable', 'mcl_technic:steel_block'},
	}
})

mcl_technic.register_generator({tier="HV", tube=1, supply=1200})

