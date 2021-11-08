-- MV compressor
if minetest.get_modpath("mcl_copper") then
minetest.register_craft({
	output = 'technic:mv_compressor',
	recipe = {
	{'mcl_core:stone', 'technic:lv_compressor',  'mcl_core:stone'},
	{'mesecons_pistons:piston_normal_off', 'mcl_copper:copper_ingot', 'mesecons_pistons:piston_normal_off'},
	{'mcl_core:stone', 'technic:mv_cable', 'mcl_core:stone'},
	}
})
else
minetest.register_craft({
	output = 'technic:mv_compressor',
	recipe = {
	{'mcl_core:stone', 'technic:lv_compressor',  'mcl_core:stone'},
	{'mesecons_pistons:piston_normal_off', 'technic:copper_ingot', 'mesecons_pistons:piston_normal_off'},
	{'mcl_core:stone', 'technic:mv_cable', 'mcl_core:stone'},
	}
})
end

technic.register_compressor({tier = "MV", demand = {800, 600, 400}, speed = 10, upgrade = 1, tube = 1})
