
minetest.register_craft({
	output = 'technic:solar_array_mv 1',
	recipe = {
	{'technic:solar_panel', 'technic:solar_panel', 'technic:solar_panel'},
	{'mcl_core:iron_ingot', 'mcl_core:gold_ingot', 'mcl_core:iron_ingot'},
	{'',                  'technic:mv_cable',       ''},
	}
})

technic.register_solar_array({tier="MV", power=30})

-- compatibility alias for upgrading from old versions of technic
minetest.register_alias("technic:solar_panel_mv", "technic:solar_array_mv")
