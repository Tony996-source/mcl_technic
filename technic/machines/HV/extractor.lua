-- HV extractor

minetest.register_craft({
	output = 'technic:hv_extractor',
	recipe = {
	{'mcl_core:ironblock', 'mcl_core:ironblock', 'mcl_core:ironblock'},
	{'mcl_core:ironblock', 'mcl_core:gold_ingot', 'mcl_core:ironblock'},
	{'mcl_core:ironblock', 'technic:hv_cable', 'mcl_core:ironblock'},
	}
})

technic.register_extractor({tier = "HV", demand = {1600, 1200, 800}, speed = 8, upgrade = 2, tube = 2})
