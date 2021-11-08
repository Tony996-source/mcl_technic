
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

minetest.register_craftitem(":technic:copper_ingot", {
	description = ("Copper Ingot"),
	inventory_image = "technic_copper_ingot.png",
})

minetest.register_node(":technic:copper_block", {
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

minetest.register_craftitem(":technic:copper_dust", {
	description = ("Copper Dust"),
	inventory_image = "technic_copper_dust.png",
})

minetest.override_item("mcl_nether:netheriteblock", {
    tiles = {"netherite_block.png"},
})

minetest.register_craftitem(":technic:copper_nugget", {
	description = ("Copper Nugget"),
	inventory_image = "technic_copper_nugget.png",
})
