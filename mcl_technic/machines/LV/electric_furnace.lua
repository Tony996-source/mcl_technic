-- LV Electric Furnace
-- This is a faster version of the stone furnace which runs on EUs
-- In addition to this it can be upgraded with microcontrollers and batteries
-- This new version uses the batteries to lower the power consumption of the machine
-- Also in addition this furnace can be attached to the pipe system from the pipeworks mod.

-- FIXME: kpoppel I'd like to introduce an induction heating element here also
minetest.register_craft({
	output = 'mcl_technic:lv_electric_furnace',
	recipe = {
	{'mcl_core:cobble', 'mcl_core:cobble', 'mcl_core:cobble'},
	{'mcl_core:cobble', 'mcl_core:iron_ingot', 'mcl_core:cobble'},
	{'mcl_core:cobble', 'mcl_technic:lv_cable', 'mcl_core:cobble'},
	}
})

mcl_technic.register_electric_furnace({tier="LV", demand={300}, speed = 5})

