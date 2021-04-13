
minetest.register_craft({
	output = 'technic:solar_array_mv 1',
	recipe = {
	{'technic:solar_array_lv', 'technic:solar_array_lv', 'technic:solar_array_lv'},
	{'mcl_core:iron_ingot', 'technic:copper_ingot', 'mcl_core:iron_ingot'},
	{'',                  'technic:mv_cable',       ''},
	}
})

technic.register_solar_array({tier="MV", power=71.43})

-- compatibility alias for upgrading from old versions of technic
minetest.register_alias("technic:solar_panel_mv", "technic:solar_array_mv")
