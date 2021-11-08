-- MV grinder
if minetest.get_modpath("mcl_copper") then
minetest.register_craft({
	output = 'technic:mv_grinder',
	recipe = {
	{'mcl_core:redsandstone', 'technic:lv_grinder', 'mcl_core:redsandstone'},
	{'mcl_core:redsandstone', 'mcl_copper:copper_ingot', 'mcl_core:redsandstone'},
	{'mcl_core:granite', 'technic:mv_cable', 'mcl_core:granite'},
	}
})
else
minetest.register_craft({
	output = 'technic:mv_grinder',
	recipe = {
	{'mcl_core:redsandstone', 'technic:lv_grinder', 'mcl_core:redsandstone'},
	{'mcl_core:redsandstone', 'technic:copper_ingot', 'mcl_core:redsandstone'},
	{'mcl_core:granite', 'technic:mv_cable', 'mcl_core:granite'},
	}
})
end
technic.register_grinder({tier="MV", demand={600, 450, 300}, speed=10, upgrade=1, tube=1})

