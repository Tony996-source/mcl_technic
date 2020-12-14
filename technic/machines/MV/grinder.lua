-- MV grinder

minetest.register_craft({
	output = 'technic:mv_grinder',
	recipe = {
	{'mcl_core:redsandstone', 'default:diamond', 'mcl_core:redsandstone'},
	{'mcl_core:redsandstone', 'mcl_core:gold_ingot', 'mcl_core:redsandstone'},
	{'mcl_core:granite', 'technic:mv_cable', 'mcl_core:granite'},
	}
})

technic.register_grinder({tier="MV", demand={600, 450, 300}, speed=2, upgrade=1, tube=1})

