-- MV Electric Furnace

minetest.register_craft({
	output = 'mcl_technic:mv_electric_furnace',
	recipe = {
	{'mcl_core:cobble', 'mcl_technic:lv_electric_furnace', 'mcl_core:cobble'},
	{'mcl_core:cobble', 'mcl_copper:copper_ingot', 'mcl_core:cobble'},
	{'mcl_core:cobble', 'mcl_technic:mv_cable', 'mcl_core:cobble'},
	}
})

mcl_technic.register_electric_furnace({tier="MV", upgrade=1, tube=1, demand={2000, 1000, 500}, speed=10})

