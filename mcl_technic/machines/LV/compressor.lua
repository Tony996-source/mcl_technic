
minetest.register_alias("compressor", "mcl_technic:lv_compressor")

minetest.register_craft({
	output = 'mcl_technic:lv_compressor',
	recipe = {
	{'mcl_core:stone', 'mcl_core:stone', 'mcl_core:stone'},
	{'mesecons_pistons:piston_normal_off', 'mcl_core:iron_ingot', 'mesecons_pistons:piston_normal_off'},
	{'mcl_core:iron_ingot', 'mcl_technic:lv_cable',       'mcl_core:iron_ingot'},
	},
})

mcl_technic.register_compressor({tier = "LV", demand = {300}, speed = 5})
