
minetest.register_alias("compressor", "technic:lv_compressor")

minetest.register_craft({
	output = 'technic:lv_compressor',
	recipe = {
	{'mcl_core:stone', 'mcl_core:stone', 'mcl_core:stone'},
	{'mesecons_pistons:piston_normal_off', 'mcl_core:gold_ingot', 'mesecons_pistons:piston_normal_off'},
	{'mcl_core:iron_ingot', 'technic:lv_cable',       'mcl_core:iron_ingot'},
	},
})

technic.register_compressor({tier = "LV", demand = {300}, speed = 1})
