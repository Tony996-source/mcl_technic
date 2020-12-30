-- HV compressor

minetest.register_craft({
	output = 'technic:hv_compressor',
	recipe = {
	{'technic:steel_ingot', 'technic:steel_ingot', 'technic:steel_ingot'},
	{'mesecons_pistons:piston_normal_off', 'mcl_core:gold_ingot', 'mesecons_pistons:piston_normal_off'},
	{'technic:steel_ingot', 'technic:hv_cable', 'technic:steel_ingot'},
	}
})

technic.register_compressor({tier = "HV", demand = {1600, 1200, 800}, speed = 8, upgrade = 2, tube = 2})
