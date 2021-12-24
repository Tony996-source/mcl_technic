
minetest.register_alias("grinder", "mcl_technic:lv_grinder")
minetest.register_craft({
	output = 'mcl_technic:lv_grinder',
	recipe = {
	{'mcl_core:redsandstone', 'mcl_core:diamond', 'mcl_core:redsandstone'},
	{'mcl_core:redsandstone', 'mcl_core:iron_ingot', 'mcl_core:redsandstone'},
	{'mcl_core:diorite', 'mcl_technic:lv_cable', 'mcl_core:diorite'},
	}
})

mcl_technic.register_grinder({tier="LV", demand={200}, speed=5})

