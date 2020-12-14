
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

minetest.override_item("mcl_core:bedrock", {
        description = ("Bedrock"),
	_doc_items_longdesc = S("Bedrock is a very hard type of rock. It can not be broken, destroyed, collected or moved by normal means, unless in Creative Mode.").."\n"..
		S("In the End dimension, starting a fire on this block will create an eternal fire."),
	tiles = {"mcl_core_bedrock.png"},
	stack_max = 64,
	groups = {creative_breakable=1, building_block=1, material_stone=1, immortal=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	on_destruct = function () end,
    can_dig = function() return false end,
	is_ground_content = false,
	on_blast = function() end,
	drop = '',
	_mcl_blast_resistance = 3600000,
	_mcl_hardness = -1,
	diggable = false,
})
