-- MV compressor

minetest.register_craft({
	output = 'mcl_technic:mv_compressor',
	recipe = {
	{'mcl_core:stone', 'mcl_technic:lv_compressor',  'mcl_core:stone'},
	{'mesecons_pistons:piston_normal_off', 'mcl_copper:copper_ingot', 'mesecons_pistons:piston_normal_off'},
	{'mcl_core:stone', 'mcl_technic:mv_cable', 'mcl_core:stone'},
	}
})

mcl_technic.register_compressor({tier = "MV", demand = {800, 600, 400}, speed = 10, upgrade = 1, tube = 1})
