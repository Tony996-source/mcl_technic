-- HV compressor

minetest.register_craft({
	output = 'mcl_technic:hv_compressor',
	recipe = {
	{'mcl_technic:steel_ingot', 'mcl_technic:mv_compressor', 'mcl_technic:steel_ingot'},
	{'mesecons_pistons:piston_normal_off', 'mcl_core:gold_ingot', 'mesecons_pistons:piston_normal_off'},
	{'mcl_technic:steel_ingot', 'mcl_technic:hv_cable', 'mcl_technic:steel_ingot'},
	}
})

mcl_technic.register_compressor({tier = "HV", demand = {1600, 1200, 800}, speed = 20, upgrade = 2, tube = 2})
