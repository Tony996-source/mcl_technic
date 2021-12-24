-- MineClone2 Redefinitions and Additions.

-- Unbreakable Bedrock

local S = mcl_technic.getter
minetest.override_item("mcl_core:bedrock", {
    description = S("Bedrock"),
	_doc_items_longdesc = ("Bedrock is a very hard type of rock. It can not be broken, destroyed, collected or moved by normal means, unless in Creative Mode.").."\n"..
		S("In the End dimension, starting a fire on this block will create an eternal fire."),
	tiles = {"mcl_technic_bedrock.png"},
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

-- Obsidian retexture

minetest.override_item("mcl_core:obsidian", {
	description = S("Obsidian"),
	_doc_items_longdesc = S("Obsidian is an extremely hard mineral with an enourmous blast-resistance. Obsidian is formed when water meets lava."),
	tiles = {"mcl_technic_obsidian.png"},
	is_ground_content = true,
	sounds = mcl_sounds.node_sound_stone_defaults(),
	stack_max = 64,
	groups = {pickaxey=5, building_block=1, material_stone=1},
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,
})

-- Transparent Ice

minetest.override_item("mcl_core:ice", {
	description = S("Ice"),
	_doc_items_longdesc = S("Ice is a solid block usually found in cold areas. It melts near block light sources at a light level of 12 or higher. When it melts or is broken while resting on top of another block, it will turn into a water source."),
	drawtype = "glasslike",
	tiles = {"mcl_technic_ice.png"},
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
--     Node          dye       Description    Glass Colour
	{"white",      "white",      "White",      "white"},
	{"silver",     "grey",       "Silver",     "silver"},
	{"grey",       "dark_grey",  "Grey",       "gray"},
	{"black",      "black",      "Black",      "black"},
	{"purple",     "violet",     "Purple",     "purple"},
	{"blue",       "blue",       "Blue",       "blue"},
	{"cyan",       "cyan",       "Cyan",       "cyan"},
	{"green",      "dark_green", "Green",      "green"},
	{"lime",       "green",      "Lime",       "lime"},
	{"yellow",     "yellow",     "Yellow",     "yellow"},
	{"brown",      "brown",      "Brown",      "brown"},
	{"orange",     "orange",     "Orange",     "orange"},
	{"red",        "red",        "Red",        "red"},
	{"magenta",    "magenta",    "Magenta",    "magenta"},
	{"pink",       "pink",       "Pink",       "pink"},
    {"light_blue", "lightblue",  "Light Blue", "light_blue"},
}

for _, colour in pairs(colour) do

-- Clear Crafts
minetest.clear_craft({
	recipe = {
		{"mcl_dye:" .. colour[2], 'mcl_wool:white'}
	},
})

-- Register New Crafts

minetest.register_craft({
	type = "shapeless",
	output = "mcl_colorblocks:concrete_" .. colour[1] .. " 8",
	recipe = { "group:concrete", "mcl_dye:" .. colour[2], "group:concrete",
	           "group:concrete", "group:concrete", "group:concrete",
	           "group:concrete", "group:concrete", "group:concrete"
	},
})

minetest.register_craft({
	type = "shapeless",
	output = "mcl_colorblocks:concrete_powder_" .. colour[1] .. " 8",
	recipe = { "group:concrete_powder", "mcl_dye:" .. colour[2], "group:concrete_powder",
	           "group:concrete_powder", "group:concrete_powder", "group:concrete_powder",
	           "group:concrete_powder", "group:concrete_powder", "group:concrete_powder"
    },
})

minetest.register_craft({
	type = "shapeless",
	output = "mcl_colorblocks:hardened_clay_" .. colour[1] .. " 8",
	recipe = { "group:hardened_clay", "mcl_dye:" .. colour[2], "group:hardened_clay",
	           "group:hardened_clay", "group:hardened_clay", "group:hardened_clay",
	           "group:hardened_clay", "group:hardened_clay", "group:hardened_clay"
    },
})

minetest.register_craft({
	type = "shapeless",
	output = "mcl_colorblocks:glazed_terracotta_" .. colour[1] .. " 8",
	recipe = { "group:glazed_terracotta", "mcl_dye:" .. colour[2], "group:glazed_terracotta",
	           "group:glazed_terracotta", "group:glazed_terracotta", "group:glazed_terracotta",
	           "group:glazed_terracotta", "group:glazed_terracotta", "group:glazed_terracotta"
	},
})

minetest.register_craft({
	type = "shapeless",
	output = "mcl_wool:" .. colour[1] .. " 8",
	recipe = { "group:wool", "mcl_dye:" .. colour[2], "group:wool",
	           "group:wool", "group:wool", "group:wool",
	           "group:wool", "group:wool", "group:wool"
	},
})

minetest.register_craft({
	type = "shapeless",
	output = "mcl_wool:" .. colour[1] .. "_carpet 8",
	recipe = { "group:carpet", "mcl_dye:" .. colour[2], "group:carpet",
	           "group:carpet", "group:carpet", "group:carpet",
	           "group:carpet", "group:carpet", "group:carpet"
	},
})

minetest.register_craft({
	type = "shapeless",
	output = "mcl_core:glass_" .. colour[1] .. " 8",
	recipe = { "group:glass", "mcl_dye:" .. colour[2], "group:glass",
	           "group:glass", "group:glass", "group:glass",
	           "group:glass", "group:glass", "group:glass"
	},
})

minetest.register_craft({
	type = "shapeless",
	output = "xpanes:pane_" .. colour[1] .. "_flat 8",
	recipe = { "group:pane", "mcl_dye:" .. colour[2], "group:pane",
	           "group:pane", "group:pane", "group:pane",
	           "group:pane", "group:pane", "group:pane"
   },
})

minetest.register_craft({
	output = 'mcl_core:paper',
	recipe = {
		{'mcl_core:reeds', 'mcl_core:reeds', 'mcl_core:reeds'}
	}
})

minetest.register_craft({
	output = 'mcl_mobitems:string',
	recipe = {
		{'mcl_core:reeds', 'mcl_core:reeds'}
	}
})

-- Override Items

minetest.override_item("mcl_core:glass", {
	description = ("Glass"),
	_doc_items_longdesc = S("A decorative and mostly transparent block."),
	drawtype = "glasslike",
	is_ground_content = false,
	tiles = {"mcl_technic_coloured_glass_clear_framed.png"},
	paramtype = "light",
	sunlight_propagates = true,
	stack_max = 64,
	groups = {handy=1, glass=1, building_block=1, material_glass=1},
	sounds = mcl_sounds.node_sound_glass_defaults(),
	drop = "mcl_core:glass",
	_mcl_blast_resistance = 0.3,
	_mcl_hardness = 0.3,
	_mcl_silk_touch_drop = true,
})

minetest.override_item("mcl_core:glass_" .. colour[4], {
	description = colour[3].. (" Glass"),
	_doc_items_longdesc = S("A decorative and mostly transparent block."),
	drawtype = "glasslike",
	is_ground_content = false,
	tiles = {"mcl_technic_coloured_glass_".. colour[1] .. ".png"},
	paramtype = "light",
	sunlight_propagates = true,
	stack_max = 64,
	groups = {handy=1, glass=1, building_block=1, material_glass=1},
	sounds = mcl_sounds.node_sound_glass_defaults(),
	drop = "mcl_core:glass_" .. colour[4],
	_mcl_blast_resistance = 0.3,
	_mcl_hardness = 0.3,
	_mcl_silk_touch_drop = true,
})

minetest.override_item("xpanes:pane_" .. colour[4] .. "_flat", {
	description = colour[3] .. ("Glass Pane"),
	_doc_items_longdesc = S("A decorative and mostly transparent block."),
	inventory_image = "mcl_technic_coloured_glass_".. colour[1] .. ".png",
	wield_image = "mcl_technic_coloured_glass_".. colour[1] .. ".png",
	drawtype = "nodebox",
	is_ground_content = false,
	tiles = {"mcl_technic_coloured_glass_".. colour[1] .. ".png", "mcl_technic_coloured_glass_".. colour[1] .. ".png", "xpanes_top_glass_"..colour[4]..".png"},
	paramtype = "light",
	sunlight_propagates = true,
	stack_max = 64,
	groups = {handy=1, pane = 1, building_block=1, material_glass=1},
	sounds = mcl_sounds.node_sound_glass_defaults(),
	drop = "xpanes:pane_" .. colour[4] .. "_flat",
	_mcl_blast_resistance = 0.3,
	_mcl_hardness = 0.3,
	_mcl_silk_touch_drop = true,
})

minetest.override_item("xpanes:pane_" .. colour[4], {
	description = colour[3] .. ("Glass Pane"),
	_doc_items_longdesc = S("A decorative and mostly transparent block."),
	inventory_image = "mcl_technic_coloured_glass_".. colour[1] .. ".png",
	wield_image = "mcl_technic_coloured_glass_".. colour[1] .. ".png",
	drawtype = "nodebox",
	is_ground_content = false,
	tiles = {"mcl_technic_coloured_glass_".. colour[1] .. ".png", "mcl_technic_coloured_glass_".. colour[1] .. ".png", "xpanes_top_glass_"..colour[4]..".png"},
	paramtype = "light",
	sunlight_propagates = true,
	stack_max = 64,
	groups = {handy=1, pane = 1, building_block=1, material_glass=1, not_in_creative_inventory = 1},
	sounds = mcl_sounds.node_sound_glass_defaults(),
	drop = "xpanes:pane_" .. colour[4] .. "_flat",
	_mcl_blast_resistance = 0.3,
	_mcl_hardness = 0.3,
	_mcl_silk_touch_drop = true,
})

minetest.override_item("xpanes:pane_natural_flat", {
	description = ("Glass Pane"),
	_doc_items_longdesc = S("A decorative and mostly transparent block."),
	inventory_image = "mcl_technic_coloured_glass_clear_framed.png",
	wield_image = "mcl_technic_coloured_glass_clear_framed.png",
	drawtype = "nodebox",
	is_ground_content = false,
	tiles = {"mcl_technic_coloured_glass_pane_top.png", "mcl_technic_coloured_glass_pane_top.png", "mcl_technic_coloured_glass_pane_top.png", "mcl_technic_coloured_glass_clear_framed.png"},
	paramtype = "light",
	sunlight_propagates = true,
	stack_max = 64,
	groups = {handy=1, pane = 1, building_block=1, material_glass=1},
	sounds = mcl_sounds.node_sound_glass_defaults(),
	drop = "xpanes:pane_natural_flat",
	_mcl_blast_resistance = 0.3,
	_mcl_hardness = 0.3,
	_mcl_silk_touch_drop = true,
})
end

-- Register Cracked Stone

local axe = {   
 -- material,         Description
	{"wood",          "Axe Wood"},
	{"stone",         "Axe Stone"},
	{"iron",          "Axe Iron"},
	{"gold",          "Axe Gold"},
	{"diamond",       "Axe Diamond"},
	
}

for _, axe in pairs(axe) do
	
minetest.register_craft({
        type = "shapeless",
		output = "mcl_technic:cracked_stone",
		recipe = {"mcl_core:stone", "mcl_tools:axe_"..axe[1]},
		replacements = {{"mcl_tools:axe_"..axe[1], "mcl_tools:axe_"..axe[1]}}
})
end
