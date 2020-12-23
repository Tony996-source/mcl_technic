
local S = technic.getter

minetest.register_craftitem("technic:silicon_wafer", {
	description = S("Silicon Wafer"),
	inventory_image = "technic_silicon_wafer.png",
})


minetest.register_craftitem( "technic:doped_silicon_wafer", {
	description = S("Doped Silicon Wafer"),
	inventory_image = "technic_doped_silicon_wafer.png",
})

minetest.register_craftitem( "technic:diamond_drill_head", {
	description = S("Diamond Drill Head"),
	inventory_image = "technic_diamond_drill_head.png",
})

minetest.register_craftitem("technic:carbon_plate", {
	description = S("Carbon Plate"),
	inventory_image = "technic_carbon_plate.png",
})

minetest.register_craftitem("technic:graphite", {
	description = S("Graphite"),
	inventory_image = "technic_graphite.png",
})

minetest.register_craftitem("technic:carbon_cloth", {
	description = S("Carbon Cloth"),
	inventory_image = "technic_carbon_cloth.png",
})

minetest.register_craftitem("technic:oil", {
	description = "Crude Oil",
	inventory_image = "technic_oil.png",
	groups = {flammable = 1}
})

minetest.register_craftitem("technic:rubber", {
	description = S("Rubber"),
	inventory_image = "technic_rubber.png",
})

minetest.register_node("technic:cracked_stone", {
	description = "Cracked Stone",
	tiles = {"technic_cracked_stone.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=1, stone=1, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 1.5,
})

mcl_stairs.register_stair_and_slab_simple("cracked_stone", "technic:cracked_stone", "Cracked Stone Stair", "Cracked Stone Slab", "Double Cracked Stone Slab")
