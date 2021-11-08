
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

minetest.register_craftitem("technic:steel_ingot", {
	description = S("Steel Ingot"),
	inventory_image = "technic_steel_ingot.png",
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

minetest.register_node("technic:steel_block", {
	description = "Steel Block",
	tiles = {"technic_steel_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=2, building_block=1},
	sounds = mcl_sounds.node_sound_metal_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craftitem("technic:copper_dust", {
	description = ("Copper Dust"),
	inventory_image = "technic_copper_dust.png",
})

minetest.override_item("mcl_nether:netheriteblock", {
    tiles = {"netherite_block.png"},
})

minetest.register_craftitem("technic:copper_nugget", {
	description = ("Copper Nugget"),
	inventory_image = "technic_copper_nugget.png",
})

-- Copper
if minetest.get_modpath("mcl_copper") then
       minetest.override_item("mcl_copper:raw_copper", {
        drop = "mcl_copper:raw_copper",
        _mcl_fortune_drop = mcl_core.fortune_drop_ore,
    })

       minetest.override_item("mcl_copper:copper_ingot", {
        drop = "mcl_copper:copper_ingot",
        _mcl_fortune_drop = mcl_core.fortune_drop_ore,
    })
else
minetest.register_node( ":technic:mineral_copper", {
	description = ("Copper Ore"),
	tiles = { "default_stone.png^technic_mineral_copper.png" },
	is_ground_content = true,
	stack_max = 64,
	groups = {pickaxey=3, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	drop = "technic:mineral_copper",
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
})

minetest.register_craftitem("technic:copper_ingot", {
	description = ("Copper Ingot"),
	inventory_image = "technic_copper_ingot.png",
})

minetest.register_node("technic:copper_block", {
	description = "Copper Block",
	tiles = {"technic_copper_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=2, building_block=1},
	sounds = mcl_sounds.node_sound_metal_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})
end

mcl_stairs.register_stair_and_slab_simple("cracked_stone", "technic:cracked_stone", "Cracked Stone Stair", "Cracked Stone Slab", "Double Cracked Stone Slab")
