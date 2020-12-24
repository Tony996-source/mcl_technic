-- MineClone2 Redefinitions and Additions.

-- Unbreakable Bedrock

local S = technic.getter
minetest.override_item("mcl_core:bedrock", {
    description = S("Bedrock"),
	_doc_items_longdesc = ("Bedrock is a very hard type of rock. It can not be broken, destroyed, collected or moved by normal means, unless in Creative Mode.").."\n"..
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

-- Transparent Ice

minetest.override_item("mcl_core:ice", {
	description = S("Ice"),
	_doc_items_longdesc = S("Ice is a solid block usually found in cold areas. It melts near block light sources at a light level of 12 or higher. When it melts or is broken while resting on top of another block, it will turn into a water source."),
	drawtype = "glasslike",
	tiles = {"default_ice.png"},
	is_ground_content = true,
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = true,
	stack_max = 64,
	groups = {handy=1,pickaxey=1, slippery=3, building_block=1},
	drop = "",
	sounds = mcl_sounds.node_sound_glass_defaults(),
	node_dig_prediction = "mcl_core:water_source",
	after_dig_node = function(pos, oldnode)
		mcl_core.melt_ice(pos)
	end,
	_mcl_blast_resistance = 0.5,
	_mcl_hardness = 0.5,
})

-- 3D Papyrus

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

minetest.register_craft({
	output = 'mcl_core:paper',
	recipe = {
		{'mcl_core:reeds', 'mcl_core:reeds', 'mcl_core:reeds'}
	}
})

-- 3D Ladder

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

-- Register Stairs and new craft recipes

local colour = {
--     Node          dye       Description
	{"white",      "white",      "White"},
	{"silver",     "grey",       "Silver"},
	{"grey",       "dark_grey",  "Grey"},
	{"black",      "black",      "Black"},
	{"purple",     "violet",     "Purple"},
	{"blue",       "blue",       "Blue"},
	{"cyan",       "cyan",       "Cyan"},
	{"green",      "dark_green", "Green"},
	{"lime",       "green",      "Lime"},
	{"yellow",     "yellow",     "Yellow"},
	{"brown",      "brown",      "Brown"},
	{"orange",     "orange",     "Orange"},
	{"red",        "red",        "Red"},
	{"magenta",    "magenta",    "Magenta"},
	{"pink",       "pink",       "Pink"},
    {"light_blue", "lightblue",  "Light Blue"},
}

for _, colour in pairs(colour) do

mcl_stairs.register_stair_and_slab_simple(colour[1].."concrete", "mcl_colorblocks:concrete_"..colour[1], colour[3].."Concrete Stair", colour[3].."concrete Slab", colour[3].."Double concrete Slab")

mcl_stairs.register_stair_and_slab_simple(colour[1].."hardened_clay", "mcl_colorblocks:hardened_clay_"..colour[1], colour[3].."hardened_clay Stair", colour[3].."hardened_clay Slab", colour[3].."Double hardened_clay Slab")

minetest.register_craft({
	output = 'mcl_colorblocks:concrete_' .. colour[1],
	recipe = {
		{'mcl_stairs:slab_' .. colour[1] .. 'concrete'},
		{'mcl_stairs:slab_' .. colour[1] .. 'concrete'},
	}
})

minetest.register_craft({
	output = 'mcl_colorblocks:hardened_clay_' .. colour[1],
	recipe = {
		{'mcl_stairs:slab_' .. colour[1] .. 'hardened_clay'},
		{'mcl_stairs:slab_' .. colour[1] .. 'hardened_clay'},
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "mcl_colorblocks:concrete_" .. colour[1],
	recipe = { "group:concrete", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "mcl_colorblocks:concrete_powder_" .. colour[1],
	recipe = { "group:concrete_powder", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "mcl_colorblocks:hardened_clay_" .. colour[1],
	recipe = { "group:hardened_clay", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "mcl_colorblocks:glazed_terracotta_" .. colour[1],
	recipe = { "group:glazed_terracotta", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "mcl_wool:" .. colour[1],
	recipe = { "group:wool", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "mcl_core:glass_" .. colour[1],
	recipe = { "group:glass", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat",
	recipe = { "xpanes:pane_white_flat", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat",
	recipe = { "xpanes:pane_silver_flat", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat",
	recipe = { "xpanes:pane_grey_flat", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat",
	recipe = { "xpanes:pane_black_flat", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat",
	recipe = { "xpanes:pane_purple_flat", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat",
	recipe = { "xpanes:pane_blue_flat", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat",
	recipe = { "xpanes:pane_cyan_flat", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat",
	recipe = { "xpanes:pane_green_flat", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat",
	recipe = { "xpanes:pane_lime_flat", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat",
	recipe = { "xpanes:pane_yellow_flat", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat",
	recipe = { "xpanes:pane_brown_flat", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat",
	recipe = { "xpanes:pane_orange_flat", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat",
	recipe = { "xpanes:pane_red_flat", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat",
	recipe = { "xpanes:pane_magenta_flat", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat",
	recipe = { "xpanes:pane_pink_flat", "mcl_dye:" .. colour[2] },
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat",
	recipe = { "xpanes:pane_light_blue_flat", "mcl_dye:" .. colour[2] },
})
end

local axe = {   -- , Description , Image
	{"wood",          "Axe Wood"},
	{"stone",         "Axe Stone"},
	{"iron",          "Axe Iron"},
	{"gold",          "Axe Gold"},
	{"diamond",       "Axe Diamond"},
	
}

for _, axe in pairs(axe) do
	
minetest.register_craft({
        type = "shapeless",
		output = "technic:cracked_stone",
		recipe = {"mcl_core:stone", "mcl_tools:axe_"..axe[1]},
		replacements = {{"mcl_tools:axe_"..axe[1], "mcl_tools:axe_"..axe[1]}}
})
end

-- Register Extra ore gen.

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_lapis",
	wherein         = stonelike,
	clust_scarcity = 1000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(20),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_diamond",
	wherein         = stonelike,
	clust_scarcity = 1000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(20),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mcl_core:stone_with_gold",
	wherein         = stonelike,
	clust_scarcity = 1000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(20),
})


