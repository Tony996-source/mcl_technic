
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

minetest.override_item("mcl_core:reeds", {
    description = "Sugar Canes",
	tiles = {"default_papyrus_3d.png"},
	inventory_image = "mcl_core_reeds.png",
	wield_image = "mcl_core_reeds.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	groups = {snappy=3,flammable=2},
	stack_max = 64,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, 0.3125, -0.25, 0.5, 0.4375},
			{-0.125, -0.5, -0.125, 0, 0.5, 0},
			{0.125, -0.5, 0.1875, 0.25, 0.5, 0.3125},
			{-0.3125, -0.5, -0.375, -0.1875, 0.5, -0.25},
			{0.25, -0.5, -0.3125, 0.375, 0.5, -0.1875},
		},
	},	
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, 0.3125, -0.25, 0.5, 0.4375},
			{-0.125, -0.5, -0.125, 0, 0.5, 0},
			{0.125, -0.5, 0.1875, 0.25, 0.5, 0.3125},
			{-0.3125, -0.5, -0.375, -0.1875, 0.5, -0.25},
			{0.25, -0.5, -0.3125, 0.375, 0.5, -0.1875},
		}
	},
	groups = {dig_immediate=3, craftitem=1, deco_block=1, plant=1, non_mycelium_plant=1, dig_by_piston=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	node_placement_prediction = "",
	on_place = mcl_util.generate_on_place_plant_function(function(place_pos, place_node)
		local soil_pos = {x=place_pos.x, y=place_pos.y-1, z=place_pos.z}
		local soil_node = minetest.get_node_or_nil(soil_pos)
		if not soil_node then return false end
		local snn = soil_node.name -- soil node name

		-- Placement rules:
		-- * On top of group:soil_sugarcane AND next to water or frosted ice. OR
		-- * On top of sugar canes
		if snn == "mcl_core:reeds" then
			return true
		elseif minetest.get_item_group(snn, "soil_sugarcane") == 0 then
			return false
		end

		local posses = {
			{ x=0, y=0, z=1},
			{ x=0, y=0, z=-1},
			{ x=1, y=0, z=0},
			{ x=-1, y=0, z=0},
		}
		for p=1, #posses do
			local checknode = minetest.get_node(vector.add(soil_pos, posses[p]))
			if minetest.get_item_group(checknode.name, "water") ~= 0 or minetest.get_item_group(checknode.name, "frosted_ice") ~= 0 then
				-- Water found! Sugar canes are happy! :-)
				return true
			end
		end

		-- No water found! Sugar canes are not amuzed and refuses to be placed. :-(
		return false

	end),
	_mcl_blast_resistance = 0,
	_mcl_hardness = 0,
})

minetest.override_item("mcl_core:ladder", {
    tiles = {"default_wood.png", "default_wood.png", "default_wood.png", "default_wood.png"},
	inventory_image = "default_ladder.png",
	wield_image = "default_ladder.png",
    drawtype = 'nodebox',
    paramtype = 'light',
    node_box = {
        type = 'fixed',
        fixed = {
            {-0.375, -0.5, -0.5, -0.25, -0.375, 0.5}, -- strut_1
            {0.25, -0.5, -0.5, 0.375, -0.375, 0.5}, -- strut_2
            {-0.4375, -0.5, 0.2825, 0.4375, -0.375, 0.1425}, -- rung_1
            {-0.4375, -0.5, -0.3375, 0.4375, -0.375, -0.2125} -- rung_2
        }
    },
    selection_box = {
        type = 'wallmounted',
        wall_top = {-0.4375, 0.375, -0.5, 0.4375, 0.5, 0.5},
        wall_side = {-0.5, -0.5, -0.4375, -0.375, 0.5, 0.4375},
        wall_bottom = {-0.4375, -0.5, -0.5, 0.4375, -0.375, 0.5}
    }
})
