-- MV grinder

minetest.register_craft({
	output = 'mcl_technic:mv_grinder',
	recipe = {
	{'mcl_core:redsandstone', 'mcl_technic:lv_grinder', 'mcl_core:redsandstone'},
	{'mcl_core:redsandstone', 'mcl_copper:copper_ingot', 'mcl_core:redsandstone'},
	{'mcl_core:granite', 'mcl_technic:mv_cable', 'mcl_core:granite'},
	}
})

mcl_technic.register_grinder({tier="MV", demand={600, 450, 300}, speed=10, upgrade=1, tube=1})

