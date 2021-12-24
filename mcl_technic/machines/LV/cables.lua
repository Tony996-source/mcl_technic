
minetest.register_alias("lv_cable", "mcl_technic:lv_cable")

minetest.register_craft({
	output = 'mcl_technic:lv_cable 6',
	recipe = {
	{'mcl_core:paper', 'mcl_core:paper', 'mcl_core:paper'},
	{'mcl_core:iron_ingot', 'mcl_core:iron_ingot', 'mcl_core:iron_ingot'},
	{'mcl_core:paper', 'mcl_core:paper', 'mcl_core:paper'},
	}
}) 

mcl_technic.register_cable("LV", 2/16)

