-- The high voltage solar array is an assembly of medium voltage arrays.
-- Solar arrays are not able to store large amounts of energy.

minetest.register_craft({
	output = 'technic:solar_array_hv 1',
	recipe = {
	{'technic:solar_panel', 'technic:solar_panel', 'technic:solar_panel'},
	{'technic:carbon_plate', 'mcl_core:gold_ingot', 'technic:carbon_plate'},
	{'',                     'technic:hv_cable',       ''},
	}
})

technic.register_solar_array({tier="HV", power=2000})

