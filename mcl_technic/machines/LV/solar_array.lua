-- The solar array is an assembly of panels into a powerful array
-- The assembly can deliver more energy than the individual panel because
-- of the transformer unit which converts the panel output variations into
-- a stable supply.
-- Solar arrays are not able to store large amounts of energy.
-- The LV arrays are used to make medium voltage arrays.

minetest.register_craft({
	output = 'mcl_technic:solar_array_lv 1',
	recipe = {
	{'mcl_core:iron_ingot', 'mcl_technic:solar_panel', 'mcl_core:iron_ingot'},
	{'mcl_core:iron_ingot', 'mcl_core:iron_ingot',     'mcl_core:iron_ingot'},
	{'',                    'mcl_technic:lv_cable',    ''},
	}
})

mcl_technic.register_solar_array({tier="LV", power=35.715})

