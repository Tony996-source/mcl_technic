
minetest.register_alias("lv_cable", "technic:lv_cable")

minetest.register_craft({
	output = 'technic:lv_cable 6',
	recipe = {
	{'mcl_core:paper', 'mcl_core:paper', 'mcl_core:paper'},
	{'mcl_core:iron_ingot', 'mcl_core:iron_ingot', 'mcl_core:iron_ingot'},
	{'mcl_core:paper', 'mcl_core:paper', 'mcl_core:paper'},
	}
}) 

technic.register_cable("LV", 2/16)

