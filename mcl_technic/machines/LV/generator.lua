-- The electric generator.
-- A simple device to get started on the electric machines.
-- Inefficient and expensive in fuel (200EU per tick)
-- Also only allows for LV machinery to run.

minetest.register_alias("lv_generator", "mcl_technic:lv_generator")

minetest.register_craft({
	output = 'mcl_technic:lv_generator',
	recipe = {
		{'mcl_core:stone', 'mcl_furnaces:furnace', 'mcl_core:stone'},
		{'mcl_core:stone', 'mcl_core:iron_ingot', 'mcl_core:stone'},
		{'mcl_core:stone', 'mcl_technic:lv_cable', 'mcl_core:stone'},
	}
})

mcl_technic.register_generator({tier="LV", supply=300})

