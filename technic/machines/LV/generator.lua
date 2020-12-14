-- The electric generator.
-- A simple device to get started on the electric machines.
-- Inefficient and expensive in fuel (200EU per tick)
-- Also only allows for LV machinery to run.

minetest.register_alias("lv_generator", "technic:lv_generator")

minetest.register_craft({
	output = 'technic:lv_generator',
	recipe = {
		{'mcl_core:stone', 'mcl_furnaces:furnace', 'mcl_core:stone'},
		{'mcl_core:stone', 'mcl_core:gold_ingot', 'mcl_core:stone'},
		{'mcl_core:stone', 'technic:lv_cable', 'mcl_core:stone'},
	}
})

technic.register_generator({tier="LV", supply=200})

