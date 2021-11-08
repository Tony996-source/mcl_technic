minetest.register_alias("generator_mv", "technic:generator_mv")
if minetest.get_modpath("mcl_copper") then
minetest.register_craft({
	output = 'technic:mv_generator',
	recipe = {
	{'mcl_core:stone', 'technic:lv_generator', 'mcl_core:stone'},
	{'mcl_core:stone', 'mcl_copper:copper_ingot', 'mcl_core:stone'},
	{'mcl_core:stone', 'technic:mv_cable', 'mcl_core:stone'},
	}
})
else
minetest.register_craft({
	output = 'technic:mv_generator',
	recipe = {
	{'mcl_core:stone', 'technic:lv_generator', 'mcl_core:stone'},
	{'mcl_core:stone', 'technic:copper_ingot', 'mcl_core:stone'},
	{'mcl_core:stone', 'technic:mv_cable', 'mcl_core:stone'},
	}
})
end
technic.register_generator({tier="MV", tube=1, supply=600})

