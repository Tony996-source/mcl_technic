-- check if we have the necessary dependencies to allow actually using these materials in the crafts
local mesecons_materials = minetest.get_modpath("mesecons_materials")

-- tubes crafting recipes

minetest.register_craft({
	output = 'technic:diamond_drill_head',
	recipe = {
		{'mcl_core:iron_ingot', 'mcl_core:diamond', 'mcl_core:iron_ingot'},
		{'mcl_core:diamond',               '',                'mcl_core:diamond'},
		{'mcl_core:iron_ingot', 'mcl_core:diamond', 'mcl_core:iron_ingot'},
	}
})

local isolation = mesecons_materials and "mesecons_materials:fiber" or "technic:rubber"


minetest.register_craft({
	output = 'technic:carbon_cloth',
	recipe = {
		{'technic:graphite', 'technic:graphite', 'technic:graphite'}
	}
})

minetest.register_craft({
	output = 'technic:steel_block',
	recipe = {
		{'technic:steel_ingot', 'technic:steel_ingot', 'technic:steel_ingot'},
		{'technic:steel_ingot', 'technic:steel_ingot', 'technic:steel_ingot'},
		{'technic:steel_ingot', 'technic:steel_ingot', 'technic:steel_ingot'},
	}
})

minetest.register_craft({
    type = 'shapeless',
	output = 'technic:steel_ingot 9',
	recipe = {'technic:steel_block'},
})

minetest.register_craft({
	type = "fuel",
	recipe = "technic:oil",
	burntime = 400,
})

minetest.register_craft({
	type = "cooking",
	output = "technic:rubber",
	recipe = "technic:oil",
})

minetest.register_craft({
	type = "cooking",
	output = "mcl_core:charcoal_lump",
	recipe = "group:wood",
	cooktime = 10,
})
