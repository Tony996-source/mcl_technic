-- The high voltage solar array is an assembly of medium voltage arrays.
-- Solar arrays are not able to store large amounts of energy.

minetest.register_craft({
	output = 'mcl_technic:solar_array_hv 1',
	recipe = {
	{'mcl_technic:solar_array_mv', 'mcl_technic:solar_array_mv', 'mcl_technic:solar_array_mv'},
	{'mcl_technic:steel_ingot', 'mcl_core:gold_ingot',        'mcl_technic:steel_ingot'},
	{'',                        'mcl_technic:hv_cable',       ''},
	}
})

mcl_technic.register_solar_array({tier="HV", power=142.86})

