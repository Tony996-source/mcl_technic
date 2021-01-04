-- MV Electric Furnace
-- This is a faster version of the stone furnace which runs on EUs
-- In addition to this it can be upgraded with microcontrollers and batteries
-- This new version uses the batteries to lower the power consumption of the machine
-- Also in addition this furnace can be attached to the pipe system from the pipeworks mod.

-- FIXME: kpoppel I'd like to introduce an induction heating element here also
minetest.register_craft({
	output = 'technic:mv_electric_furnace',
	recipe = {
	{'mcl_core:cobble', 'technic:lv_electric_furnace', 'mcl_core:cobble'},
	{'mcl_core:cobble', 'technic:copper_ingot', 'mcl_core:cobble'},
	{'mcl_core:cobble', 'technic:mv_cable', 'mcl_core:cobble'},
	}
})

technic.register_electric_furnace({tier="MV", upgrade=1, tube=1, demand={2000, 1000, 500}, speed=4})

