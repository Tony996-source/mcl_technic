
local S = mcl_technic.getter

minetest.register_craftitem("mcl_technic:silicon_wafer", {
	description = S("Silicon Wafer"),
	inventory_image = "mcl_technic_silicon_wafer.png",
})


minetest.register_craftitem( "mcl_technic:doped_silicon_wafer", {
	description = S("Doped Silicon Wafer"),
	inventory_image = "mcl_technic_doped_silicon_wafer.png",
})

minetest.register_craftitem( "mcl_technic:diamond_drill_head", {
	description = S("Diamond Drill Head"),
	inventory_image = "mcl_technic_diamond_drill_head.png",
})

minetest.register_craftitem("mcl_technic:carbon_plate", {
	description = S("Carbon Plate"),
	inventory_image = "mcl_technic_carbon_plate.png",
})

minetest.register_craftitem("mcl_technic:graphite", {
	description = S("Graphite"),
	inventory_image = "mcl_technic_graphite.png",
})

minetest.register_craftitem("mcl_technic:carbon_cloth", {
	description = S("Carbon Cloth"),
	inventory_image = "mcl_technic_carbon_cloth.png",
})

minetest.register_craftitem("mcl_technic:oil", {
	description = "Crude Oil",
	inventory_image = "mcl_technic_oil.png",
	groups = {flammable = 1}
})

minetest.register_craftitem("mcl_technic:rubber", {
	description = S("Rubber"),
	inventory_image = "mcl_technic_rubber.png",
})

minetest.register_craftitem("mcl_technic:steel_ingot", {
	description = S("Steel Ingot"),
	inventory_image = "mcl_technic_steel_ingot.png",
})

minetest.register_node("mcl_technic:cracked_stone", {
	description = "Cracked Stone",
	tiles = {"mcl_technic_cracked_stone.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=1, stone=1, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 1.5,
})

minetest.register_node("mcl_technic:steel_block", {
	description = "Steel Block",
	tiles = {"mcl_technic_steel_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=2, building_block=1},
	sounds = mcl_sounds.node_sound_metal_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_node("mcl_technic:charcoalblock", {
	description = S("Block of Charcoal"),
	_doc_items_longdesc = S("Blocks of charcoal are useful as a compact storage of charcoal and very useful as a furnace fuel. A block of charcoal is as efficient as 10 carcoal."),
	tiles = {"mcl_technic_charcoal_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=1, flammable=1, building_block=1, material_stone=1, fire_encouragement=5, fire_flammability=5},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})



minetest.register_craftitem("mcl_technic:copper_dust", {
	description = ("Copper Dust"),
	inventory_image = "mcl_technic_copper_dust.png",
})

minetest.override_item("mcl_nether:netheriteblock", {
    tiles = {"mcl_technic_netherite_block.png"},
})

minetest.register_craftitem("mcl_technic:copper_nugget", {
	description = ("Copper Nugget"),
	inventory_image = "mcl_technic_copper_nugget.png",
})

mcl_stairs.register_stair_and_slab_simple("cracked_stone", "mcl_technic:cracked_stone", "Cracked Stone Stair", "Cracked Stone Slab", "Double Cracked Stone Slab")


