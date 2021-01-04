-- HV Electric Furnace
-- This is a faster version of the stone furnace which runs on EUs
-- In addition to this it can be upgraded with microcontrollers and batteries
-- This new version uses the batteries to lower the power consumption of the machine
-- Also in addition this furnace can be attached to the pipe system from the pipeworks mod.

-- FIXME: kpoppel I'd like to introduce an induction heating element here also
minetest.register_craft({
	output = 'technic:hv_electric_furnace',
	recipe = {
	{'technic:steel_ingot', 'technic:mv_electric_furnace', 'technic:steel_ingot'},
	{'pipeworks:tube_1', 'mcl_core:gold_ingot', 'pipeworks:tube_1'},
	{'technic:steel_ingot', 'technic:hv_cable', 'technic:steel_ingot'},
	}
})

technic.register_electric_furnace({tier="HV", upgrade=2, tube=2, demand={4000, 2000, 1000}, speed=8})

