
minetest.register_craft({
	output = 'mcl_technic:solar_array_mv 1',
	recipe = {
	{'mcl_core:iron_ingot', 'mcl_technic:solar_array_lv', 'mcl_core:iron_ingot'},
	{'mcl_core:iron_ingot', 'mcl_copper:copper_ingot',    'mcl_core:iron_ingot'},
	{'',                    'mcl_technic:mv_cable',       ''},
	}
})

mcl_technic.register_solar_array({tier="MV", power=71.43})

-- compatibility alias for upgrading from old versions of mcl_technic
minetest.register_alias("mcl_technic:solar_panel_mv", "mcl_technic:solar_array_mv")
