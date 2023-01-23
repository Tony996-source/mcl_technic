
minetest.register_alias("extractor", "mcl_technic:lv_extractor")

minetest.register_craft({
	output = 'mcl_technic:lv_extractor',
	recipe = {
	{'mcl_core:andesite', 'mcl_core:andesite', 'mcl_core:andesite'},
	{'mcl_core:andesite', 'mcl_core:iron_ingot', 'mcl_core:andesite'},
	{'mcl_core:andesite', 'mcl_technic:lv_cable', 'mcl_core:andesite'},
	}
})

mcl_technic.register_extractor({tier = "LV", demand = {300}, speed = 5})
