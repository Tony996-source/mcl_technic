-- MV extractor
if minetest.get_modpath("mcl_copper") then
minetest.register_craft({
	output = 'technic:mv_extractor',
	recipe = {
	{'mcl_core:andesite', 'technic:lv_extractor', 'mcl_core:andesite'},
	{'mcl_core:diorite', 'mcl_copper:copper_ingot', 'mcl_core:diorite'},
	{'mcl_core:diorite', 'technic:mv_cable', 'mcl_core:diorite'},
	}
})
else
minetest.register_craft({
	output = 'technic:mv_extractor',
	recipe = {
	{'mcl_core:andesite', 'technic:lv_extractor', 'mcl_core:andesite'},
	{'mcl_core:diorite', 'technic:copper_ingot', 'mcl_core:diorite'},
	{'mcl_core:diorite', 'technic:mv_cable', 'mcl_core:diorite'},
	}
})
end
technic.register_extractor({tier = "MV", demand = {800, 600, 400}, speed = 10, upgrade = 1, tube = 1})
