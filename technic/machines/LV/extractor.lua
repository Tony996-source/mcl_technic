
minetest.register_alias("extractor", "technic:lv_extractor")

minetest.register_craft({
	output = 'technic:lv_extractor',
	recipe = {
	{'mcl_core:andesite', 'mcl_core:iron_ingot', 'mcl_core:andesite'},
	{'mcl_core:andesite', 'mcl_core:gold_ingot', 'mcl_core:andesite'},
	{'',                     'technic:lv_cable',               ''},
	}
})

technic.register_extractor({tier = "LV", demand = {300}, speed = 1})
