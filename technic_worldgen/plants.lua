--
-- Item Overrides
--

minetest.override_item("mcl_flowers:tallgrass", {
groups = {handy=1, shearsy=1, flammable=3, fire_encouragement=60, fire_flammability=100, attached_node=1,plant=1, place_flowerlike=2, non_mycelium_plant=1, dig_by_water=1, destroy_by_lava_flow=1, deco_block=1, flora=1},
})

minetest.override_item("mcl_flowers:fern", {
groups = {handy=1, shearsy=1, flammable=3, fire_encouragement=60, fire_flammability=100, attached_node=1,plant=1, place_flowerlike=2, non_mycelium_plant=1, dig_by_water=1, destroy_by_lava_flow=1, deco_block=1, flora=1},
})

minetest.override_item("mcl_flowers:peony", {
groups = {flower = 1, place_flowerlike = 1, dig_immediate = 3, flora=1},
})

minetest.override_item("mcl_flowers:rose_bush", {
groups = {flower = 1, place_flowerlike = 1, dig_immediate = 3, flora=1},
})

minetest.override_item("mcl_flowers:lilac", {
groups = {flower = 1, place_flowerlike = 1, dig_immediate = 3, flora=1},
})

minetest.override_item("mcl_flowers:sunflower", {
groups = {flower = 1, place_flowerlike = 1, dig_immediate = 3, flora=1},
})

minetest.override_item("mcl_flowers:double_grass", {
groups = {flower = 1, place_flowerlike = 1, dig_immediate = 3, flora=1},
})

minetest.override_item("mcl_flowers:double_fern", {
groups = {flower = 1, place_flowerlike = 1, dig_immediate = 3, flora=1},
})

--
-- 3D Papyrus
--

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
			{-0.375, -0.5, 0.25, -0.25, 0.5, 0.375},
			{0.25, -0.5, 0.25, 0.375, 0.5, 0.375},
			{0.25, -0.5, -0.375, 0.375, 0.5, -0.25},
			{-0.375, -0.5, -0.375, -0.25, 0.5, -0.25},
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625},
			{0.0625, -0.0625, 0, 0.1875, 0.0625, 0},
			{-0.1875, 0.1875, 0, -0.0625, 0.3125, 0},
			{-0.3125, 0.125, -0.5, -0.3125, 0.25, -0.375},
			{-0.3125, -0.1875, -0.25, -0.3125, -0.0625, -0.125},
			{0.3125, 0.0625, -0.25, 0.3125, 0.1875, -0.125},
			{0.3125, -0.25, -0.5, 0.3125, -0.125, -0.375},
			{0.125, -0.125, 0.3125, 0.3125, 0, 0.3125},
			{0.25, 0.1875, 0.3125, 0.5, 0.3125, 0.3125},
			{-0.25, 0.125, 0.3125, -0.125, 0.25, 0.3125},
			{-0.5, -0.25, 0.3125, -0.375, -0.125, 0.3125},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, 0.25, -0.25, 0.5, 0.375},
			{0.25, -0.5, 0.25, 0.375, 0.5, 0.375},
			{0.25, -0.5, -0.375, 0.375, 0.5, -0.25},
			{-0.375, -0.5, -0.375, -0.25, 0.5, -0.25},
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625},
			{0.0625, -0.0625, 0, 0.1875, 0.0625, 0},
			{-0.1875, 0.1875, 0, -0.0625, 0.3125, 0},
			{-0.3125, 0.125, -0.5, -0.3125, 0.25, -0.375},
			{-0.3125, -0.1875, -0.25, -0.3125, -0.0625, -0.125},
			{0.3125, 0.0625, -0.25, 0.3125, 0.1875, -0.125},
			{0.3125, -0.25, -0.5, 0.3125, -0.125, -0.375},
			{0.125, -0.125, 0.3125, 0.3125, 0, 0.3125},
			{0.25, 0.1875, 0.3125, 0.5, 0.3125, 0.3125},
			{-0.25, 0.125, 0.3125, -0.125, 0.25, 0.3125},
			{-0.5, -0.25, 0.3125, -0.375, -0.125, 0.3125},
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

--
-- 3D Mushrooms
--

minetest.register_node(":mcl_mushrooms:mushroom_brown", {
	description = ("Brown Mushroom"),
	drawtype = "nodebox",
	tiles = { "farming_mushroom_brown_3d.png" },
	inventory_image = "farming_mushroom_brown.png",
	wield_image = "farming_mushroom_brown.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {dig_immediate=3,mushroom=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1, flora=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, -0.375, 0.0625},
			{-0.1875, -0.375, -0.1875, 0.1875, -0.25, 0.1875},
			{-0.125, -0.25, -0.125, 0.125, -0.1875, 0.125},
		},
	},
	light_source = 1,
	node_placement_prediction = "",
	on_place = on_place,
	_mcl_blast_resistance = 0,
})

minetest.register_node(":mcl_mushrooms:mushroom_red", {
	description = ("Brown Mushroom"),
	drawtype = "nodebox",
	tiles = { "farming_mushroom_red_3d.png" },
	inventory_image = "farming_mushroom_red.png",
	wield_image = "farming_mushroom_red.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {dig_immediate=3,mushroom=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1, flora=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, -0.375, 0.0625},
			{-0.1875, -0.375, -0.1875, 0.1875, -0.25, 0.1875},
			{-0.125, -0.25, -0.125, 0.125, -0.1875, 0.125},
		},
	},
	light_source = 1,
	node_placement_prediction = "",
	on_place = on_place,
	_mcl_blast_resistance = 0,
})

--
-- 3D Flowers
--

minetest.register_node(":mcl_flowers:tulip_red", {
	description = ("Red Tulip"),
	drawtype = "nodebox",
	tiles = { "mcl_flowers_tulip_red_3d.png" },
	inventory_image = "mcl_flowers_tulip_red.png",
	wield_image = "mcl_flowers_tulip_red.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1, flora=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, -0.1875, 0.0625},
			{-0.0625, -0.1875, 0.0625, 0.0625, -0.0625, 0.125},
			{-0.0625, -0.1875, -0.125, 0.0625, -0.0625, -0.0625},
			{0.0625, -0.1875, -0.0625, 0.125, -0.0625, 0.0625}, 
			{-0.125, -0.1875, -0.0625, -0.0625, -0.0625, 0.0625},
			{-0.1875, -0.4375, 0, -0.0625, -0.375, 0},
			{-0.25, -0.375, 0, -0.125, -0.3125, 0},
			{0.0625, -0.4375, 0, 0.1875, -0.375, 0},
			{0.125, -0.375, 0, 0.25, -0.3125, 0},
			{0, -0.4375, -0.1875, 0, -0.375, -0.0625},
			{0, -0.375, -0.25, 0, -0.3125, -0.125}, 
			{0, -0.4375, 0.0625, 0, -0.375, 0.1875},
			{0, -0.375, 0.125, 0, -0.3125, 0.25},
			{-0.125, -0.0625, 0.0625, -0.0625, 0, 0.125},
			{-0.125, -0.0625, -0.125, -0.0625, 0, -0.0625}, 
			{0.0625, -0.0625, -0.125, 0.125, 3.72529e-09, -0.0625},
			{0.0625, -0.0625, 0.0625, 0.125, 7.45058e-09, 0.125},
			{0.125, -0.0625, -0.0625, 0.1875, 0.0625, 0.0625},
			{-0.1875, -0.0625, -0.0625, -0.125, 0.0625, 0.0625},
			{-0.0625, -0.0625, 0.125, 0.0625, 0.0625, 0.1875},
			{-0.0625, -0.0625, -0.1875, 0.0625, 0.0625, -0.125},
		},
	},
	light_source = 1,
	node_placement_prediction = "",
	on_place = on_place,
	_mcl_blast_resistance = 0,
})

minetest.register_node(":mcl_flowers:tulip_orange", {
	description = ("Orange Tulip"),
	drawtype = "nodebox",
	tiles = { "flowers_tulip_3d.png" },
	inventory_image = "flowers_tulip.png",
	wield_image = "flowers_tulip.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {flora=1, dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, -0.1875, 0.0625},
			{-0.0625, -0.1875, 0.0625, 0.0625, -0.0625, 0.125},
			{-0.0625, -0.1875, -0.125, 0.0625, -0.0625, -0.0625},
			{0.0625, -0.1875, -0.0625, 0.125, -0.0625, 0.0625}, 
			{-0.125, -0.1875, -0.0625, -0.0625, -0.0625, 0.0625},
			{-0.1875, -0.4375, 0, -0.0625, -0.375, 0},
			{-0.25, -0.375, 0, -0.125, -0.3125, 0},
			{0.0625, -0.4375, 0, 0.1875, -0.375, 0},
			{0.125, -0.375, 0, 0.25, -0.3125, 0},
			{0, -0.4375, -0.1875, 0, -0.375, -0.0625},
			{0, -0.375, -0.25, 0, -0.3125, -0.125}, 
			{0, -0.4375, 0.0625, 0, -0.375, 0.1875},
			{0, -0.375, 0.125, 0, -0.3125, 0.25},
			{-0.125, -0.0625, 0.0625, -0.0625, 0, 0.125},
			{-0.125, -0.0625, -0.125, -0.0625, 0, -0.0625}, 
			{0.0625, -0.0625, -0.125, 0.125, 3.72529e-09, -0.0625},
			{0.0625, -0.0625, 0.0625, 0.125, 7.45058e-09, 0.125},
			{0.125, -0.0625, -0.0625, 0.1875, 0.0625, 0.0625},
			{-0.1875, -0.0625, -0.0625, -0.125, 0.0625, 0.0625},
			{-0.0625, -0.0625, 0.125, 0.0625, 0.0625, 0.1875},
			{-0.0625, -0.0625, -0.1875, 0.0625, 0.0625, -0.125},
		},
	},
	light_source = 1,
	node_placement_prediction = "",
	on_place = on_place,
	_mcl_blast_resistance = 0,
})

minetest.register_node(":mcl_flowers:tulip_pink", {
	description = ("Pink Tulip"),
	drawtype = "nodebox",
	tiles = { "mcl_flowers_tulip_pink_3d.png" },
	inventory_image = "mcl_flowers_tulip_pink.png",
	wield_image = "mcl_flowers_tulip_pink.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {flora=1, dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, -0.1875, 0.0625},
			{-0.0625, -0.1875, 0.0625, 0.0625, -0.0625, 0.125},
			{-0.0625, -0.1875, -0.125, 0.0625, -0.0625, -0.0625},
			{0.0625, -0.1875, -0.0625, 0.125, -0.0625, 0.0625}, 
			{-0.125, -0.1875, -0.0625, -0.0625, -0.0625, 0.0625},
			{-0.1875, -0.4375, 0, -0.0625, -0.375, 0},
			{-0.25, -0.375, 0, -0.125, -0.3125, 0},
			{0.0625, -0.4375, 0, 0.1875, -0.375, 0},
			{0.125, -0.375, 0, 0.25, -0.3125, 0},
			{0, -0.4375, -0.1875, 0, -0.375, -0.0625},
			{0, -0.375, -0.25, 0, -0.3125, -0.125}, 
			{0, -0.4375, 0.0625, 0, -0.375, 0.1875},
			{0, -0.375, 0.125, 0, -0.3125, 0.25},
			{-0.125, -0.0625, 0.0625, -0.0625, 0, 0.125},
			{-0.125, -0.0625, -0.125, -0.0625, 0, -0.0625}, 
			{0.0625, -0.0625, -0.125, 0.125, 3.72529e-09, -0.0625},
			{0.0625, -0.0625, 0.0625, 0.125, 7.45058e-09, 0.125},
			{0.125, -0.0625, -0.0625, 0.1875, 0.0625, 0.0625},
			{-0.1875, -0.0625, -0.0625, -0.125, 0.0625, 0.0625},
			{-0.0625, -0.0625, 0.125, 0.0625, 0.0625, 0.1875},
			{-0.0625, -0.0625, -0.1875, 0.0625, 0.0625, -0.125},
		},
	},
	light_source = 1,
	node_placement_prediction = "",
	on_place = on_place,
	_mcl_blast_resistance = 0,
})

minetest.register_node(":mcl_flowers:tulip_white", {
	description = ("White Tulip"),
	drawtype = "nodebox",
	tiles = { "mcl_flowers_tulip_white_3d.png" },
	inventory_image = "mcl_flowers_tulip_white.png",
	wield_image = "mcl_flowers_tulip_white.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {flora=1, dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, -0.1875, 0.0625},
			{-0.0625, -0.1875, 0.0625, 0.0625, -0.0625, 0.125},
			{-0.0625, -0.1875, -0.125, 0.0625, -0.0625, -0.0625},
			{0.0625, -0.1875, -0.0625, 0.125, -0.0625, 0.0625}, 
			{-0.125, -0.1875, -0.0625, -0.0625, -0.0625, 0.0625},
			{-0.1875, -0.4375, 0, -0.0625, -0.375, 0},
			{-0.25, -0.375, 0, -0.125, -0.3125, 0},
			{0.0625, -0.4375, 0, 0.1875, -0.375, 0},
			{0.125, -0.375, 0, 0.25, -0.3125, 0},
			{0, -0.4375, -0.1875, 0, -0.375, -0.0625},
			{0, -0.375, -0.25, 0, -0.3125, -0.125}, 
			{0, -0.4375, 0.0625, 0, -0.375, 0.1875},
			{0, -0.375, 0.125, 0, -0.3125, 0.25},
			{-0.125, -0.0625, 0.0625, -0.0625, 0, 0.125},
			{-0.125, -0.0625, -0.125, -0.0625, 0, -0.0625}, 
			{0.0625, -0.0625, -0.125, 0.125, 3.72529e-09, -0.0625},
			{0.0625, -0.0625, 0.0625, 0.125, 7.45058e-09, 0.125},
			{0.125, -0.0625, -0.0625, 0.1875, 0.0625, 0.0625},
			{-0.1875, -0.0625, -0.0625, -0.125, 0.0625, 0.0625},
			{-0.0625, -0.0625, 0.125, 0.0625, 0.0625, 0.1875},
			{-0.0625, -0.0625, -0.1875, 0.0625, 0.0625, -0.125},
		},
	},
	light_source = 1,
	node_placement_prediction = "",
	on_place = on_place,
	_mcl_blast_resistance = 0,
})

minetest.register_node(":mcl_flowers:allium", {
	description = ("Allium"),
	drawtype = "nodebox",
	tiles = { "mcl_flowers_allium_3d_top.png",
		"mcl_flowers_allium_3d_top.png",
		"mcl_flowers_allium_3d.png",
		"mcl_flowers_allium_3d.png",
		"mcl_flowers_allium_3d.png",
		"mcl_flowers_allium_3d.png"
	 },
	inventory_image = "mcl_flowers_allium.png",
	wield_image = "mcl_flowers_allium.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {flora=1, dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.125, 0.0625},
			{-0.125, 0.125, -0.125, 0.125, 0.1875, 0.125},
			{-0.1875, 0.1875, -0.1875, 0.1875, 0.3125, 0.1875},
			{-0.125, 0.25, -0.25, 0.125, 0.3125, 0.25},
			{-0.25, 0.25, -0.125, 0.25, 0.3125, 0.125},
			{-0.1875, 0.3125, -0.125, 0.1875, 0.375, 0.125},
			{-0.125, 0.3125, -0.1875, 0.125, 0.375, 0.1875},
			{-0.125, 0.375, -0.125, 0.125, 0.4375, 0.125},
			{-0.0625, 0.4375, -0.0625, 0.0625, 0.5, 0.0625},
			{0, -0.5, 0.0625, 0, -0.3125, 0.125}, 
			{0, -0.4375, 0.125, 0, -0.25, 0.1875},
			{0, -0.3125, 0.1875, 0, -0.125, 0.25}, 
			{0, -0.5, -0.125, 0, -0.3125, -0.0625},
			{0, -0.4375, -0.1875, 0, -0.25, -0.125},
			{0, -0.3125, -0.25, 0, -0.125, -0.1875},
			{0.0625, -0.5, 0, 0.125, -0.3125, 1.49012e-08},
			{0.125, -0.4375, 0, 0.1875, -0.25, 1.49012e-08},
			{0.1875, -0.3125, 0, 0.25, -0.125, 1.49012e-08},
			{-0.125, -0.5, 0, -0.0625, -0.3125, 1.49012e-08},
			{-0.1875, -0.4375, 0, -0.125, -0.25, 1.49012e-08},
			{-0.25, -0.3125, 0, -0.1875, -0.125, 1.49012e-08},
		},
	},
	light_source = 1,
	node_placement_prediction = "",
	on_place = on_place,
	_mcl_blast_resistance = 0,
})

minetest.register_node(":mcl_flowers:azure_bluet", {
	description = ("Azure Bluet"),
	drawtype = "nodebox",
	tiles = { 
	    "mcl_flowers_azure_bluet_3d_top.png",
		"mcl_flowers_azure_bluet_3d_top.png",
		"mcl_flowers_azure_bluet_3d.png",
		"mcl_flowers_azure_bluet_3d.png",
		"mcl_flowers_azure_bluet_3d.png",
		"mcl_flowers_azure_bluet_3d.png"
	 },
	inventory_image = "mcl_flowers_azure_bluet.png",
	wield_image = "mcl_flowers_allium.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {flora=1, dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, 0.25, -0.25, -0.3125, 0.3125},
			{-0.375, -0.3125, 0.25, -0.1875, -0.3125, 0.3125},
			{-0.3125, -0.3125, 0.1875, -0.25, -0.3125, 0.375},
			{-0.25, -0.5, 0, -0.1875, -0.25, 0.0625},
			{-0.3125, -0.25, 0, -0.125, -0.25, 0.0625},
			{-0.25, -0.25, -0.0625, -0.1875, -0.25, 0.125},
			{-0.3125, -0.5, -0.25, -0.25, -0.3125, -0.1875},
			{-0.375, -0.3125, -0.25, -0.1875, -0.3125, -0.1875},
			{-0.3125, -0.3125, -0.3125, -0.25, -0.3125, -0.125},
			{-0.0625, -0.5, -0.3125, 6.33299e-08, -0.25, -0.25},
			{-0.125, -0.25, -0.3125, 0.0624999, -0.25, -0.25},
			{-0.0625, -0.25, -0.375, -5.02914e-08, -0.25, -0.1875},
			{0.0625, -0.5, 0.0625, 0.125, -0.3125, 0.125},
			{0, -0.3125, 0.0625, 0.1875, -0.3125, 0.125},
			{0.0625, -0.3125, 0, 0.125, -0.3125, 0.1875},
			{-0.0625, -0.5, -0.0625, 5.7742e-08, -0.1875, 1.22935e-07},
			{-0.125, -0.1875, -0.0625, 0.0624999, -0.1875, 3.72529e-08},
			{-0.0625, -0.1875, -0.125, -3.72529e-08, -0.1875, 0.0625},
			{-0.125, -0.5, 0.1875, -0.0624999, -0.1875, 0.25},
			{-0.1875, -0.1875, 0.1875, -1.00583e-07, -0.1875, 0.25},
			{-0.125, -0.1875, 0.125, -0.0625, -0.1875, 0.3125},
			{0.125, -0.5, -0.1875, 0.1875, -0.3125, -0.125},
			{0.0625, -0.3125, -0.1875, 0.25, -0.3125, -0.125},
			{0.125, -0.3125, -0.25, 0.1875, -0.3125, -0.0625},
			{0.125, -0.5, 0.25, 0.1875, -0.1875, 0.3125},
			{0.125, -0.1875, 0.1875, 0.1875, -0.1875, 0.375},
			{0.0625, -0.1875, 0.25, 0.25, -0.1875, 0.3125},
			{0.25, -0.5, 0.125, 0.3125, -0.25, 0.1875},
			{0.1875, -0.25, 0.125, 0.375, -0.25, 0.1875},
			{0.25, -0.25, 0.0625, 0.3125, -0.25, 0.25},
			{0.3125, -0.5, -0.375, 0.375, -0.25, -0.3125},
			{0.25, -0.25, -0.375, 0.4375, -0.25, -0.3125},
			{0.3125, -0.25, -0.4375, 0.375, -0.25, -0.25},
			{0.3125, -0.5, -0.0625, 0.375, -0.375, 1.02445e-07},
			{0.25, -0.375, -0.0625, 0.4375, -0.375, -3.72529e-08},
			{0.3125, -0.375, -0.125, 0.375, -0.375, 0.0625},
		},
	},
	light_source = 1,
	node_placement_prediction = "",
	on_place = on_place,
	_mcl_blast_resistance = 0,
})

minetest.register_node(":mcl_flowers:oxeye_daisy", {
	description = ("Oxeye Daisy"),
	drawtype = "nodebox",
	tiles = { 
	    "mcl_flowers_oxeye_daisy_3d_top.png",
		"mcl_flowers_oxeye_daisy_3d_top.png",
		"mcl_flowers_oxeye_daisy_3d.png",
		"mcl_flowers_oxeye_daisy_3d.png",
		"mcl_flowers_oxeye_daisy_3d.png",
		"mcl_flowers_oxeye_daisy_3d.png"
	 },
	inventory_image = "mcl_flowers_oxeye_daisy.png",
	wield_image = "mcl_flowers_oxeye_daisy.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {flora=1, dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, 0.0625, 0, 0.375, 0.125},
			{-0.125, 0.375, 0.0625, 0.0625, 0.375, 0.125},
			{-0.0625, 0.375, 0, 0, 0.375, 0.1875},
			{-0.1875, -0.5, 0.1875, -0.125, 0.25, 0.25},
			{-0.25, 0.25, 0.1875, -0.0625, 0.25, 0.25},
			{-0.1875, 0.25, 0.125, -0.125, 0.25, 0.3125},
			{-0.1875, -0.5, -0.0625, -0.125, 0.25, -5.58794e-08},
			{-0.25, 0.25, -0.0625, -0.0625, 0.25, 3.72529e-09},
			{-0.1875, 0.25, -0.125, -0.125, 0.25, 0.0625},
			{0.0625, -0.5, -0.0625, 0.125, 0.25, -5.58794e-08},
			{0, 0.25, -0.0625, 0.1875, 0.25, 3.72529e-09},
			{0.0625, 0.25, -0.125, 0.125, 0.25, 0.0625},
			{0.0625, -0.5, 0.1875, 0.125, 0.25, 0.25},
			{0, 0.25, 0.1875, 0.1875, 0.25, 0.25},
			{0.0625, 0.25, 0.125, 0.125, 0.25, 0.3125},
			{-0.0625, -0.5, 0.3125, 2.98023e-08, 0.125, 0.375},
			{-0.125, 0.125, 0.3125, 0.0625, 0.125, 0.375},
			{-0.0625, 0.125, 0.25, -2.98023e-08, 0.125, 0.4375},
			{-0.0625, -0.5, -0.1875, 2.98023e-08, 0.125, -0.125},
			{-0.125, 0.125, -0.1875, 0.0625, 0.125, -0.125},
			{-0.0625, 0.125, -0.25, -2.98023e-08, 0.125, -0.0625},
			{-0.3125, -0.5, 0.0625, -0.25, 0.125, 0.125},
			{-0.375, 0.125, 0.0625, -0.1875, 0.125, 0.125},
			{-0.3125, 0.125, 0, -0.25, 0.125, 0.1875},
			{0.1875, -0.5, 0.0625, 0.25, 0.125, 0.125},
			{0.125, 0.125, 0.0625, 0.3125, 0.125, 0.125},
			{0.1875, 0.125, 0, 0.25, 0.125, 0.1875},
			{-0.3125, -0.5, 0.3125, -0.25, 0, 0.375},
			{-0.375, 0, 0.3125, -0.1875, 0, 0.375},
			{-0.3125, 0, 0.25, -0.25, 0, 0.4375},
			{0.1875, -0.5, 0.3125, 0.25, 0, 0.375},
			{0.125, 0, 0.3125, 0.3125, 0, 0.375},
			{0.1875, 0, 0.25, 0.25, 0, 0.4375},
			{0.1875, -0.5, -0.1875, 0.25, 0, -0.125},
			{0.125, 0, -0.1875, 0.3125, 0, -0.125},
			{0.1875, 0, -0.25, 0.25, 0, -0.0625},
			{-0.3125, -0.5, -0.1875, -0.25, 0, -0.125},
			{-0.375, 0, -0.1875, -0.1875, 0, -0.125},
			{-0.3125, 0, -0.25, -0.25, 0, -0.0625},
			{-0.1875, -0.5, -0.3125, -0.125, -0.125, -0.25},
			{-0.25, -0.125, -0.3125, -0.0625001, -0.125, -0.25},
			{-0.1875, -0.125, -0.375, -0.125, -0.125, -0.1875},
			{0.0625, -0.5, -0.3125, 0.125, -0.125, -0.25},
			{0, -0.125, -0.3125, 0.1875, -0.125, -0.25},
			{0.0625, -0.125, -0.375, 0.125, -0.125, -0.1875},
			{0.3125, -0.5, -0.3125, 0.375, -0.125, -0.25},
			{0.25, -0.125, -0.3125, 0.4375, -0.125, -0.25},
			{0.3125, -0.125, -0.375, 0.375, -0.125, -0.1875},
			{0.3125, -0.5, -0.0625, 0.375, -0.125, 6.70552e-08},
			{0.25, -0.125, -0.0625, 0.4375, -0.125, 2.23517e-08},
			{0.3125, -0.125, -0.125, 0.375, -0.125, 0.0625},
			{0.3125, -0.5, 0.1875, 0.375, -0.125, 0.25},
			{0.25, -0.125, 0.1875, 0.4375, -0.125, 0.25},
			{0.3125, -0.125, 0.125, 0.375, -0.125, 0.3125},
			{-0.375, -0.5, -0.375, -0.3125, -0.125, -0.3125},
			{-0.4375, -0.125, -0.375, -0.25, -0.125, -0.3125},
			{-0.375, -0.125, -0.4375, -0.3125, -0.125, -0.25},
		},
	},
	light_source = 1,
	node_placement_prediction = "",
	on_place = on_place,
	_mcl_blast_resistance = 0,
})

minetest.register_node(":mcl_flowers:dandelion", {
	description = ("Dandelion"),
	drawtype = "nodebox",
	tiles = { 
	    "flowers_dandelion_yellow_3d_top.png",
		"flowers_dandelion_yellow_3d_top.png",
		"flowers_dandelion_yellow_3d.png",
		"flowers_dandelion_yellow_3d.png",
		"flowers_dandelion_yellow_3d.png",
		"flowers_dandelion_yellow_3d.png"
	 },
	inventory_image = "flowers_dandelion_yellow.png",
	wield_image = "flowers_dandelion_yellow.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {flora=1, dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{0, -0.5, -0.0625, 0.0625, 0.3125, 3.72529e-09},
			{-0.125, 0.3125, -0.1875, 0.1875, 0.375, 0.125},
			{-0.0625, 0.375, -0.125, 0.125, 0.4375, 0.0625},
			{0.0625, -0.5, 0, 0.0625, -0.3125, 0.0625},
			{0.0625, -0.4375, 0.0625, 0.0625, -0.25, 0.125},
			{0.0625, -0.3125, 0.125, 0.0625, -0.125, 0.1875},
			{0.0625, -0.4375, -0.125, 0.0625, -0.25, -0.0625},
			{0.0625, -0.375, -0.1875, 0.0625, -0.1875, -0.125},
			{0.0625, -0.25, -0.25, 0.0625, -0.0624999, -0.1875},
			{-0.0625, -0.5, -0.0625, 7.45058e-09, -0.3125, -0.0625},
			{-0.125, -0.4375, -0.0625, -0.0625, -0.25, -0.0625},
			{-0.1875, -0.3125, -0.0625, -0.125, -0.125, -0.0625},
			{0.0625, -0.4375, -0.0625, 0.125, -0.25, -0.0625},
			{0.125, -0.375, -0.0625, 0.1875, -0.1875, -0.0625},
			{0.1875, -0.25, -0.0625, 0.25, -0.0624999, -0.0625},
		},
	},
	light_source = 1,
	node_placement_prediction = "",
	on_place = on_place,
	_mcl_blast_resistance = 0,
})

minetest.register_node(":mcl_flowers:blue_orchid", {
	description = ("Blue Orchid"),
	drawtype = "nodebox",
	tiles = {"mcl_flowers_blue_orchid_3d_top.png",
		"mcl_flowers_blue_orchid_3d_top.png",
		"mcl_flowers_blue_orchid_3d.png",
		"mcl_flowers_blue_orchid_3d.png",
		"mcl_flowers_blue_orchid_3d.png",
		"mcl_flowers_blue_orchid_3d.png"},
	inventory_image = "mcl_flowers_blue_orchid.png",
	wield_image = "mcl_flowers_blue_orchid.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {flora=1, dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, 0, 0, -0.3125, 0.0625},
			{-0.0625, -0.375, -0.0625, 0, -0.1875, 0},
			{-0.0625, -0.25, 0, 0, -0.0625, 0.0625},
			{-0.0625, -0.125, -0.0625, 0, -0.0625, 0},
			{-0.0625, -0.125, 0.0625, 0, -0.0625, 0.125},
			{0, -0.125, 0, 0.0625, -0.0625, 0.0625},
			{-0.125, -0.125, 0, -0.0625, -0.0625, 0.0625},
			{-0.1875, -0.0625, 0, -0.125, 0.0625, 0.0625},
			{0.0625, -0.0625, 0, 0.125, 0.0625, 0.0625},
			{-0.0625, -0.0625, 0.125, -2.98023e-08, 0.0625, 0.1875},
			{-0.0625, -0.0625, -0.125, -2.98023e-08, 0.0625, -0.0625},
			{-0.0625, 0.0625, -0.1875, -2.98023e-08, 0.125, -0.125},
			{-0.0625, 0.0625, 0.1875, -2.98023e-08, 0.125, 0.25},
			{0.125, 0.0625, 0, 0.1875, 0.125, 0.0625},
			{-0.25, 0.0625, 0, -0.1875, 0.125, 0.0625},
			{-0.25, 0.125, 0, -0.1875, 0.1875, 0.0625},
			{-0.0625, 0.125, 0.1875, 4.47035e-08, 0.1875, 0.25},
			{-0.0625, 0.125, -0.1875, 4.47035e-08, 0.1875, -0.125},
			{0.125, 0.125, 0, 0.1875, 0.1875, 0.0625},
			{0.125, 0.125, -0.0625, 0.1875, 0.1875, 1.11759e-08},
			{0.125, 0.125, 0.0625, 0.1875, 0.1875, 0.125},
			{0.1875, 0.125, 0, 0.25, 0.1875, 0.0625},
			{0.0625, 0.125, 0, 0.125, 0.1875, 0.0625},
			{-0.0625, 0.125, -0.125, 2.98023e-08, 0.1875, -0.0625},
			{-0.0625, 0.125, -0.25, 2.98023e-08, 0.1875, -0.1875},
			{0, 0.125, -0.1875, 0.0625, 0.1875, -0.125},
			{-0.125, 0.125, -0.1875, -0.0625, 0.1875, -0.125},
			{-0.25, 0.125, -0.0625, -0.1875, 0.1875, -2.23517e-08},
			{-0.25, 0.125, 0.0625, -0.1875, 0.1875, 0.125},
			{-0.3125, 0.125, 0, -0.25, 0.1875, 0.0625},
			{-0.1875, 0.125, 0, -0.125, 0.1875, 0.0625},
			{-0.0625, 0.125, 0.125, -3.35276e-08, 0.1875, 0.1875},
			{-0.0625, 0.125, 0.25, -3.35276e-08, 0.1875, 0.3125},
			{0, 0.125, 0.1875, 0.0625, 0.1875, 0.25},
			{-0.125, 0.125, 0.1875, -0.0625, 0.1875, 0.25},
			{-0.0625, 0.1875, 0.1875, -2.6077e-08, 0.25, 0.25},
			{-0.0625, 0.1875, -0.1875, -2.6077e-08, 0.25, -0.125},
			{-0.25, 0.1875, 0, -0.1875, 0.25, 0.0624999},
			{0.125, 0.1875, 0, 0.1875, 0.25, 0.0624999},
			{0.0625, 0.0625, 0, 0.125, 0.125, 0.0624999},
			{-0.0625, 0.0625, 0.125, -2.98023e-08, 0.125, 0.1875},
			{-0.1875, 0.0625, 0, -0.125, 0.125, 0.0624999},
			{-0.0625, 0.0625, -0.125, -4.09782e-08, 0.125, -0.0625001},
		},
	},
	light_source = 1,
	node_placement_prediction = "",
	on_place = on_place,
	_mcl_blast_resistance = 0,
})

minetest.register_node(":mcl_flowers:poppy", {
	description = ("Poppy"),
	drawtype = "nodebox",
	tiles = {"mcl_flowers_poppy_top.png",
		"mcl_flowers_poppy_top.png",
		"mcl_flowers_poppy_side.png",
		"mcl_flowers_poppy_side.png",
		"mcl_flowers_poppy_side.png",
		"mcl_flowers_poppy_side.png"},
	inventory_image = "mcl_flowers_poppy.png",
	wield_image = "mcl_flowers_poppy.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {flora=1, dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, 0.1875, -0.1875, 0.375, 0.25},
			{-0.4375, 0.375, 0.125, -0.25, 0.375, 0.3125},
			{-0.1875, 0.375, 0.125, -1.63913e-07, 0.375, 0.3125},
			{-0.1875, -0.5, -0.25, -0.125, 0.25, -0.1875},
			{-0.25, 0.25, -0.1875, -0.0625002, 0.25, -1.49012e-08},
			{-0.25, 0.25, -0.4375, -0.0625003, 0.25, -0.25},
			{0.1875, -0.5, -0.0625, 0.25, 0.0625, -1.11759e-08},
			{0.125, 0.0625, -0.25, 0.3125, 0.0625, -0.0625},
			{0.125, 0.0625, 0, 0.3125, 0.0625, 0.1875},
		},
	},
	light_source = 1,
	node_placement_prediction = "",
	on_place = on_place,
	_mcl_blast_resistance = 0,
})
