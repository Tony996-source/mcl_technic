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
-- 3D Carrots
--

for i=1, 7 do
	local texture, sel_height
	if i < 3 then
		sel_height1 = -0.4375
		texture = "farming_carrot_1.png"
		texture1 = "farming_carrot_1_3d.png"
	elseif i < 5 then
		sel_height1 = -0.375
		texture = "farming_carrot_2.png"
		texture1 = "farming_carrot_2_3d.png"
	else
		sel_height1 = -0.3125
		texture = "farming_carrot_3.png"
		texture1 = "farming_carrot_3_3d.png"
	end

	local create, name, longdesc
	if i == 1 then
		create = true
		name = ("Premature Carrot Plant")
		longdesc = ("Carrot plants are plants which grow on farmland under sunlight in 8 stages, but only 4 stages can be visually told apart. On hydrated farmland, they grow a bit faster. They can be harvested at any time but will only yield a profit when mature.")
	else
		create = false
	end
	minetest.register_node(":mcl_farming:carrot_"..i, {
		description = ("Premature Carrot Plant (Stage @1)"),
		_doc_items_create_entry = create,
		_doc_items_entry_name = name,
		_doc_items_longdesc = longdesc,
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		drawtype = "nodebox",
		drop = "mcl_farming:carrot_item",
		tiles = {texture1},
		inventory_image = texture,
		wield_image = texture,
		node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, 0.1875, -0.1875, sel_height1, 0.3125},
			{0.1875, -0.5, 0.1875, 0.3125, sel_height1, 0.3125},
			{0.1875, -0.5, -0.3125, 0.3125, sel_height1, -0.1875},
			{-0.3125, -0.5, -0.3125, -0.1875, sel_height1, -0.1875},
		},
	},	
		groups = {dig_immediate=3, not_in_creative_inventory=1,plant=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1},
		sounds = mcl_sounds.node_sound_leaves_defaults(),
		_mcl_blast_resistance = 0,
	})
end

minetest.register_node(":mcl_farming:carrot", {
	description = ("Mature Carrot Plant"),
	_doc_items_longdesc = ("Mature carrot plants are ready to be harvested for carrots. They won't grow any further."),
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "nodebox",
	tiles = {"farming_carrot_4_3d.png"},
	inventory_image = "farming_carrot_4.png",
	wield_image = "farming_carrot_4.png",
	drop = {
		max_items = 1,
		items = {
			{ items = {'mcl_farming:carrot_item 4'}, rarity = 5 },
			{ items = {'mcl_farming:carrot_item 3'}, rarity = 2 },
			{ items = {'mcl_farming:carrot_item 2'}, rarity = 2 },
			{ items = {'mcl_farming:carrot_item 1'} },
		}
	},
	
 node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, 0.125, -0.125, -0.375, 0.375},
			{-0.3125, -0.375, 0.1875, -0.1875, -0.1875, 0.3125},
			{0.125, -0.5, 0.125, 0.375, -0.375, 0.375},
			{0.1875, -0.375, 0.1875, 0.3125, -0.1875, 0.3125},
			{0.125, -0.5, -0.375, 0.375, -0.375, -0.125},
			{0.1875, -0.375, -0.3125, 0.3125, -0.1875, -0.1875},
			{-0.375, -0.5, -0.375, -0.125, -0.375, -0.125},
			{-0.3125, -0.375, -0.3125, -0.1875, -0.1875, -0.1875},
		},
	},	

	groups = {dig_immediate=3, not_in_creative_inventory=1,plant=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	_mcl_blast_resistance = 0,
})

--
-- 3D Potatoes
--

for k=1, 7 do
if k < 2 then
minetest.register_node(":mcl_farming:potato_" .. k, {
	description = ("Premature Potato Plant (Stage 1)"),
	_doc_items_create_entry = create,
	_doc_items_entry_name = name,
	_doc_items_longdesc = longdesc,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "nodebox",
	drop = "mcl_farming:potato_item",
	tiles = { "mcl_farming_potatoes_stage_3_3d.png" },
	inventory_image = "mcl_farming_potatoes_stage_" .. k,
	wield_image = "mcl_farming_potatoes_stage_" .. k,
	node_box = {
		type = "fixed",
		fixed = { 
		{-0.25, -0.5, 0.125, -0.1875, -0.4375, 0.25},
			{0.125, -0.5, 0.1875, 0.25, -0.4375, 0.25},
			{0.1875, -0.5, -0.25, 0.25, -0.4375, -0.125},
			{-0.25, -0.5, -0.25, -0.125, -0.4375, -0.1875},
		},
	},	
	groups = {dig_immediate=3, not_in_creative_inventory=1,plant=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	_mcl_blast_resistance = 0,
})

elseif k < 4 then

minetest.register_node(":mcl_farming:potato_" .. k, {
	description = ("Premature Potato Plant (Stage 3)"),
	_doc_items_create_entry = create,
	_doc_items_entry_name = name,
	_doc_items_longdesc = longdesc,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "nodebox",
	drop = "mcl_farming:potato_item",
	tiles = { "mcl_farming_potatoes_stage_3_3d.png" },
	inventory_image = "mcl_farming_potatoes_stage_" .. k,
	wield_image = "mcl_farming_potatoes_stage_" .. k,
	node_box = {
		type = "fixed",
		fixed = { 
		{-0.25, -0.5, 0.0625, -0.125, -0.4375, 0.25},
		{0.0625, -0.5, 0.125, 0.25, -0.4375, 0.25},
		{0.125, -0.5, -0.25, 0.25, -0.4375, -0.0625},
		{-0.25, -0.5, -0.25, -0.0625, -0.4375, -0.125},
		},
	},	
	groups = {dig_immediate=3, not_in_creative_inventory=1,plant=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	_mcl_blast_resistance = 0,
})

elseif k < 6 then

minetest.register_node(":mcl_farming:potato_" .. k, {
	description = ("Premature Potato Plant (Stage 5)"),
	_doc_items_create_entry = create,
	_doc_items_entry_name = name,
	_doc_items_longdesc = longdesc,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "nodebox",
	drop = "mcl_farming:potato_item",
	tiles = { "mcl_farming_potatoes_stage_3_3d.png" },
	inventory_image = "mcl_farming_potatoes_stage_" .. k,
	wield_image = "mcl_farming_potatoes_stage_" .. k,
	node_box = {
		type = "fixed",
		fixed = { 
		{-0.3125, -0.5, 0.0625, -0.125, -0.4375, 0.3125},
		{0.0625, -0.5, 0.125, 0.3125, -0.4375, 0.3125},
		{0.125, -0.5, -0.3125, 0.3125, -0.4375, -0.0625},
		{-0.3125, -0.5, -0.3125, -0.0625, -0.4375, -0.125},
		},
	},	
	groups = {dig_immediate=3, not_in_creative_inventory=1,plant=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	_mcl_blast_resistance = 0,
})

else

minetest.register_node(":mcl_farming:potato_" .. k, {
	description = ("Premature Potato Plant (Stage 7)"),
	_doc_items_create_entry = create,
	_doc_items_entry_name = name,
	_doc_items_longdesc = longdesc,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "nodebox",
	drop = "mcl_farming:potato_item",
	tiles = { "mcl_farming_potatoes_stage_3_3d.png" },
	inventory_image = "mcl_farming_potatoes_stage_" .. k,
	wield_image = "mcl_farming_potatoes_stage_" .. k,
	node_box = {
		type = "fixed",
		fixed = { 
		{-0.3125, -0.5, 0, -0.0625, -0.4375, 0.3125},
		{0, -0.5, 0.0625, 0.3125, -0.4375, 0.3125},
		{0.0625, -0.5, -0.3125, 0.3125, -0.4375, 0},
		{-0.3125, -0.5, -0.3125, 0, -0.4375, -0.0625},
		},
	},	
	groups = {dig_immediate=3, not_in_creative_inventory=1,plant=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	_mcl_blast_resistance = 0,
})

end
end

-- Mature plant

minetest.register_node(":mcl_farming:potato", {
	description = ("Mature Potato Plant"),
	_doc_items_longdesc = ("Mature potato plants are ready to be harvested for potatoes. They won't grow any further."),
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "nodebox",
	tiles = {"mcl_farming_potatoes_stage_3_3d.png"},
	wield_image = "mcl_farming_potatoes_stage_3.png",
	inventory_image = "mcl_farming_potatoes_stage_3.png",
	drop = {
		items = {
			{ items = {'mcl_farming:potato_item 1'} },
			{ items = {'mcl_farming:potato_item 1'}, rarity = 2 },
			{ items = {'mcl_farming:potato_item 1'}, rarity = 2 },
			{ items = {'mcl_farming:potato_item 1'}, rarity = 2 },
			{ items = {'mcl_farming:potato_item_poison 1'}, rarity = 50 }
		}
	},
	node_box = {
		type = "fixed",
		fixed = {
		{-0.375, -0.5, 0, -0.0625, -0.4375, 0.375},
			{-0.3125, -0.4375, 0.0625, -0.125, -0.375, 0.3125},
			{-0.375, -0.5, -0.375, 0, -0.4375, -0.0625},
			{0, -0.5, 0.0625, 0.375, -0.4375, 0.375},
			{0.0625, -0.5, -0.375, 0.375, -0.4375, 0},
			{-0.3125, -0.4375, -0.3125, -0.0625, -0.375, -0.125},
			{0.125, -0.4375, -0.3125, 0.3125, -0.375, -0.0625},
			{0.0625, -0.4375, 0.125, 0.3125, -0.375, 0.3125},
		},
	},	
	groups = {dig_immediate=3, not_in_creative_inventory=1,plant=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	_mcl_blast_resistance = 0,
})

--
-- 3D Beetroot
--

minetest.register_node(":mcl_farming:beetroot_0", {
	description = ("Premature Beetroot Plant (Stage 1)"),
	_doc_items_longdesc = ("Beetroot plants are plants which grow on farmland under sunlight in 4 stages. On hydrated farmland, they grow a bit faster. They can be harvested at any time but will only yield a profit when mature."),
	_doc_items_entry_name = ("Premature Beetroot Plant"),
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "nodebox",
	drop = "mcl_farming:beetroot_seeds",
	tiles = {"mcl_farming_beetroot_1_3d.png"},
	inventory_image = "mcl_farming_beetroot_0.png",
	wield_image = "mcl_farming_beetroot_0.png",
node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, 0.1875, -0.1875, -0.4375, 0.25},
			{0.1875, -0.5, 0.1875, 0.25, -0.4375, 0.25},
			{0.1875, -0.5, -0.25, 0.25, -0.4375, -0.1875},
			{-0.25, -0.5, -0.25, -0.1875, -0.4375, -0.1875},
		},
	},
	groups = {dig_immediate=3, not_in_creative_inventory=1,plant=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	_mcl_blast_resistance = 0,
})

minetest.register_node(":mcl_farming:beetroot_1", {
	description = ("Premature Beetroot Plant (Stage 2)"),
	_doc_items_create_entry = false,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "nodebox",
	drop = "mcl_farming:beetroot_seeds",
	tiles = {"mcl_farming_beetroot_1_3d.png"},
	inventory_image = "mcl_farming_beetroot_1.png",
	wield_image = "mcl_farming_beetroot_1.png",
node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, 0.1875, -0.1875, -0.375, 0.25},
			{0.1875, -0.5, 0.1875, 0.25, -0.375, 0.25},
			{0.1875, -0.5, -0.25, 0.25, -0.375, -0.1875},
			{-0.25, -0.5, -0.25, -0.1875, -0.375, -0.1875},
		},
	},
	groups = {dig_immediate=3, not_in_creative_inventory=1,plant=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	_mcl_blast_resistance = 0,
})

minetest.register_node(":mcl_farming:beetroot_2", {
	description = ("Premature Beetroot Plant (Stage 3)"),
	_doc_items_create_entry = false,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "nodebox",
	drop = "mcl_farming:beetroot_seeds",
	tiles = {"mcl_farming_beetroot_2_3d.png"},
	inventory_image = "mcl_farming_beetroot_2.png",
	wield_image = "mcl_farming_beetroot_2.png",
node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, 0.125, -0.125, -0.4375, 0.3125},
			{-0.25, -0.5, 0.1875, -0.1875, -0.3125, 0.25},
			{0.125, -0.5, 0.125, 0.3125, -0.4375, 0.3125},
			{0.1875, -0.5, 0.1875, 0.25, -0.3125, 0.25},
			{0.125, -0.5, -0.3125, 0.3125, -0.4375, -0.125},
			{0.1875, -0.5, -0.25, 0.25, -0.3125, -0.1875},
			{-0.3125, -0.5, -0.3125, -0.125, -0.4375, -0.125},
			{-0.25, -0.5, -0.25, -0.1875, -0.3125, -0.1875},
		},
	},
	groups = {dig_immediate=3, not_in_creative_inventory=1,plant=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	_mcl_blast_resistance = 0,
})

minetest.register_node(":mcl_farming:beetroot", {
	description = ("Mature Beetroot Plant"),
	_doc_items_longdesc = ("A mature beetroot plant is a farming plant which is ready to be harvested for a beetroot and some beetroot seeds. It won't grow any further."),
	_doc_items_create_entry = true,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "nodebox",
	drop = {
		--[[ drops 1 beetroot guaranteed.
		drops 0-3 beetroot seeds:
		0 seeds: 42.18%
		1 seed:  14.06%
		2 seeds: 18.75%
		3 seeds: 25% ]]
		max_items = 2,
		items = {
			{ items = {"mcl_farming:beetroot_item"}, rarity = 1 },
			{ items = {"mcl_farming:beetroot_seeds 3"}, rarity = 4 },
			{ items = {"mcl_farming:beetroot_seeds 2"}, rarity = 4 },
			{ items = {"mcl_farming:beetroot_seeds 1"}, rarity = 4 },
		},
	},
	tiles = {"mcl_farming_beetroot_3_3d.png"},
	inventory_image = "mcl_farming_beetroot_3.png",
	wield_image = "mcl_farming_beetroot_3.png",
node_box = {
		type = "fixed",
		fixed = {
		    {-0.375, -0.5, 0.0625, -0.0625, -0.375, 0.375},
			{-0.3125, -0.375, 0.125, -0.125, -0.3125, 0.3125},
			{-0.25, -0.3125, 0.1875, -0.1875, -0.125, 0.25},
			{0.0625, -0.5, 0.0625, 0.375, -0.375, 0.375},
			{0.125, -0.375, 0.125, 0.3125, -0.3125, 0.3125},
			{0.1875, -0.3125, 0.1875, 0.25, -0.125, 0.25},
			{0.0625, -0.5, -0.375, 0.375, -0.375, -0.0625},
			{0.125, -0.375, -0.3125, 0.3125, -0.3125, -0.125},
			{0.1875, -0.3125, -0.25, 0.25, -0.125, -0.1875},
			{-0.375, -0.5, -0.375, -0.0625, -0.375, -0.0625},
			{-0.3125, -0.375, -0.3125, -0.125, -0.3125, -0.125},
			{-0.25, -0.3125, -0.25, -0.1875, -0.125, -0.1875},
		},
	},	
	groups = {dig_immediate=3, not_in_creative_inventory=1,plant=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,beetroot=4},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	_mcl_blast_resistance = 0,
})

--
-- 3D Wheat
--


for b=1, 7 do
    local texture, selbox
	  if b < 2 then
		texture = "mcl_farming_wheat_stage_1.png"
		texture1 = "mcl_farming_wheat_stage_1_3d.png"
		
	w1y2 = -0.4375
	w2y2 = -0.4375
	w3y2 = -0.4375
	w4y2 = -0.4375
	w5y2 = -0.4375
	w6y2 = -0.4375
	w7y2 = -0.4375
	w8y2 = -0.4375
	w9y2 = -0.4375
	w10y2 = -0.4375
	w11y2 = -0.4375
	w12y2 = -0.4375
	w13y2 = -0.4375
	w14y2 = -0.4375
	w15y2 = -0.4375
	w16y2 = -0.4375
	w17y2 = -0.4375
	w18y2 = -0.4375
	w19y2 = -0.4375
	w20y2 = -0.4375
	w21y2 = -0.4375
	w22y2 = -0.4375
	w23y2 = -0.4375
	w24y2 = -0.4375
	w25y2 = -0.4375
		
	  elseif b == 2 then
	    texture = "mcl_farming_wheat_stage_2.png"
		texture1 = "mcl_farming_wheat_stage_2_3d.png"
		
	w1y2 = -0.375
	w2y2 = -0.4375
	w3y2 = -0.375
	w4y2 = -0.4375
	w5y2 = -0.375
	w6y2 = -0.4375
	w7y2 = -0.375
	w8y2 = -0.4375
	w9y2 = -0.375
	w10y2 = -0.4375
	w11y2 = -0.375
	w12y2 = -0.4375
	w13y2 = -0.375
	w14y2 = -0.4375
	w15y2 = -0.375
	w16y2 = -0.4375
	w17y2 = -0.375
	w18y2 = -0.4375
	w19y2 = -0.375
	w20y2 = -0.4375
	w21y2 = -0.375
	w22y2 = -0.4375
	w23y2 = -0.375
	w24y2 = -0.4375
	w25y2 = -0.375
		
	  elseif b == 3 then
		texture = "mcl_farming_wheat_stage_3.png"
		texture1 = "mcl_farming_wheat_stage_3_3d.png"
		
	w1y2 = -0.25
	w2y2 = -0.3125
	w3y2 = -0.25
	w4y2 = -0.3125
	w5y2 = -0.25
	w6y2 = -0.3125
	w7y2 = -0.25
	w8y2 = -0.3125
	w9y2 = -0.25
	w10y2 = -0.3125
	w11y2 = -0.25
	w12y2 = -0.3125
	w13y2 = -0.25
	w14y2 = -0.3125
	w15y2 = -0.25
	w16y2 = -0.3125
	w17y2 = -0.25
	w18y2 = -0.3125
	w19y2 = -0.25
	w20y2 = -0.3125
	w21y2 = -0.25
	w22y2 = -0.3125
	w23y2 = -0.25
	w24y2 = -0.3125
	w25y2 = -0.25
	  
	  elseif b == 4 then
		texture = "mcl_farming_wheat_stage_4.png"
		texture1 = "mcl_farming_wheat_stage_4_3d.png"
		
	w1y2 = -0.125
	w2y2 = -0.1875
	w3y2 = -0.125
	w4y2 = -0.1875
	w5y2 = -0.125
	w6y2 = -0.1875
	w7y2 = -0.125
	w8y2 = -0.1875
	w9y2 = -0.125
	w10y2 = -0.1875
	w11y2 = -0.125
	w12y2 = -0.1875
	w13y2 = -0.125
	w14y2 = -0.1875
	w15y2 = -0.125
	w16y2 = -0.1875
	w17y2 = -0.125
	w18y2 = -0.1875
	w19y2 = -0.125
	w20y2 = -0.1875
	w21y2 = -0.125
	w22y2 = -0.1875
	w23y2 = -0.125
	w24y2 = -0.1875
	w25y2 = -0.125
		
	  elseif b == 5 then
		texture = "mcl_farming_wheat_stage_5.png"
		texture1 = "mcl_farming_wheat_stage_5_3d.png"
		
	w1y2 = 0
	w2y2 = -0.0625
	w3y2 = 0
	w4y2 = -0.0625
	w5y2 = 0
	w6y2 = -0.0625
	w7y2 = 0
	w8y2 = -0.0625
	w9y2 = 0
	w10y2 = -0.0625
	w11y2 = 0
	w12y2 = -0.0625
	w13y2 = 0
	w14y2 = -0.0625
	w15y2 = 0
	w16y2 = -0.0625
	w17y2 = 0
	w18y2 = -0.0625
	w19y2 = 0
	w20y2 = -0.0625
	w21y2 = 0
	w22y2 = -0.0625
	w23y2 = 0
	w24y2 = -0.0625
	w25y2 = 0
		
	  elseif b == 6 then
		texture = "mcl_farming_wheat_stage_6.png"
		texture1 = "mcl_farming_wheat_stage_6_3d.png"
		
	w1y2 = 0.125
	w2y2 = 0.0625
	w3y2 = 0.125
	w4y2 = 0.0625
	w5y2 = 0.125
	w6y2 = 0.0625
	w7y2 = 0.125
	w8y2 = 0.0625
	w9y2 = 0.125
	w10y2 = 0.0625
	w11y2 = 0.125
	w12y2 = 0.0625
	w13y2 = 0.125
	w14y2 = 0.0625
	w15y2 = 0.125
	w16y2 = 0.0625
	w17y2 = 0.125
	w18y2 = 0.0625
	w19y2 = 0.125
	w20y2 = 0.0625
	w21y2 = 0.125
	w22y2 = 0.0625
	w23y2 = 0.125
	w24y2 = 0.0625
	w25y2 = 0.125
	
	end

	local create, name, longdesc
	  if b == 1 then
		create = true
		name = ("Premature Wheat Plant")
		longdesc = ("Premature wheat plants grow on farmland under sunlight in 8 stages. On hydrated farmland, they grow faster. They can be harvested at any time but will only yield a profit when mature.")
	else
		create = false
	end

	minetest.register_node(":mcl_farming:wheat_"..b, {
		description = ("Premature Wheat Plant (Stage @1)"),
		_doc_items_create_entry = create,
		_doc_items_entry_name = name,
		_doc_items_longdesc = longdesc,
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		drawtype = "nodebox",
		drop = "mcl_farming:wheat_seeds",
		tiles = {texture1},
		inventory_image = texture,
		wield_image = texture,
node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, 0.3125, -0.3125, w1y2, 0.375},
			{-0.1875, -0.5, 0.3125, -0.125, w2y2, 0.375},
			{0, -0.5, 0.3125, 0.0625, w3y2, 0.375},
			{0.1875, -0.5, 0.3125, 0.25, w4y2, 0.375},
			{0.375, -0.5, 0.3125, 0.4375, w5y2, 0.375},
			{-0.4375, -0.5, 0.125, -0.375, w6y2, 0.1875},
			{-0.25, -0.5, 0.125, -0.1875, w7y2, 0.1875},
			{-0.0625, -0.5, 0.125, 0, w8y2, 0.1875},
			{0.125, -0.5, 0.125, 0.1875, w9y2, 0.1875},
			{0.3125, -0.5, 0.125, 0.375, w10y2, 0.1875},
			{-0.375, -0.5, -0.0625, -0.3125, w11y2, 0},
			{-0.1875, -0.5, -0.0625, -0.125, w12y2, 0},
			{0, -0.5, -0.0625, 0.0625, w13y2, 0},
			{0.1875, -0.5, -0.0625, 0.25, w14y2, 0},
			{0.375, -0.5, -0.0625, 0.4375, w15y2, 0},
			{-0.4375, -0.5, -0.25, -0.375, w16y2, -0.1875},
			{-0.25, -0.5, -0.25, -0.1875, w17y2, -0.1875},
			{-0.0625, -0.5, -0.25, 0, w18y2, -0.1875},
			{0.125, -0.5, -0.25, 0.1875, w19y2, -0.1875},
			{0.3125, -0.5, -0.25, 0.375, w20y2, -0.1875},
			{-0.375, -0.5, -0.4375, -0.3125, w21y2, -0.375},
			{-0.1875, -0.5, -0.4375, -0.125, w22y2, -0.375},
			{0, -0.5, -0.4375, 0.0625, w23y2, -0.375},
			{0.1875, -0.5, -0.4375, 0.25, w24y2, -0.375},
			{0.375, -0.5, -0.4375, 0.4375, w25y2, -0.375},
		},
	},
		groups = {dig_immediate=3, not_in_creative_inventory=1, plant=1,attached_node=1, dig_by_water=1,destroy_by_lava_flow=1, dig_by_piston=1},
		sounds = mcl_sounds.node_sound_leaves_defaults(),
		_mcl_blast_resistance = 0,
	})
end

minetest.register_node(":mcl_farming:wheat", {
	description = ("Mature Wheat Plant"),
	_doc_items_longdesc = ("Mature wheat plants are ready to be harvested for wheat and wheat seeds. They won't grow any further."),
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	drawtype = "nodebox",
	tiles = {"mcl_farming_wheat_stage_7_3d.png"},
	inventory_image = "mcl_farming_wheat_stage_7.png",
	wield_image = "mcl_farming_wheat_stage_7.png",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, 0.3125, -0.3125, 0.25, 0.375},
			{-0.4375, 0.25, 0.3125, -0.3125, 0.5, 0.4375},
			{-0.1875, -0.5, 0.3125, -0.125, 0.1875, 0.375},
			{-0.25, 0.1875, 0.25, -0.125, 0.4375, 0.375},
			{0, -0.5, 0.3125, 0.0625, 0.25, 0.375},
			{-0.0625, 0.25, 0.3125, 0.0625, 0.5, 0.4375},
			{0.1875, -0.5, 0.3125, 0.25, 0.1875, 0.375},
			{0.125, 0.1875, 0.25, 0.25, 0.4375, 0.375},
			{0.375, -0.5, 0.3125, 0.4375, 0.25, 0.375},
			{0.3125, 0.25, 0.3125, 0.4375, 0.5, 0.4375},
			{-0.4375, -0.5, 0.125, -0.375, 0.1875, 0.1875},
			{-0.4375, 0.1875, 0.125, -0.3125, 0.4375, 0.25},
			{-0.25, -0.5, 0.125, -0.1875, 0.25, 0.1875},
			{-0.25, 0.25, 0.0625, -0.125, 0.5, 0.1875},
			{-0.0625, -0.5, 0.125, 0, 0.1875, 0.1875},
			{-0.0625, 0.1875, 0.125, 0.0625, 0.4375, 0.25},
			{0.125, -0.5, 0.125, 0.1875, 0.25, 0.1875},
			{0.125, 0.25, 0.0625, 0.25, 0.5, 0.1875},
			{0.3125, -0.5, 0.125, 0.375, 0.1875, 0.1875},
			{0.3125, 0.1875, 0.125, 0.4375, 0.4375, 0.25},
			{-0.375, -0.5, -0.0625, -0.3125, 0.25, 0},
			{-0.4375, 0.25, -0.0625, -0.3125, 0.5, 0.0625},
			{-0.1875, -0.5, -0.0625, -0.125, 0.1875, 0},
			{-0.25, 0.1875, -0.125, -0.125, 0.4375, 0},
			{0, -0.5, -0.0625, 0.0625, 0.25, 0},
			{-0.0625, 0.25, -0.0625, 0.0625, 0.5, 0.0625},
			{0.1875, -0.5, -0.0625, 0.25, 0.1875, 0},
			{0.125, 0.1875, -0.125, 0.25, 0.4375, 0},
			{0.375, -0.5, -0.0625, 0.4375, 0.25, 0},
			{0.3125, 0.25, -0.0625, 0.4375, 0.5, 0.0625},
			{-0.4375, -0.5, -0.25, -0.375, 0.1875, -0.1875},
			{-0.4375, 0.1875, -0.25, -0.3125, 0.4375, -0.125},
			{-0.25, -0.5, -0.25, -0.1875, 0.25, -0.1875},
			{-0.25, 0.25, -0.3125, -0.125, 0.5, -0.1875},
			{-0.0625, -0.5, -0.25, 0, 0.1875, -0.1875},
			{-0.0625, 0.1875, -0.25, 0.0625, 0.4375, -0.125},
			{0.125, -0.5, -0.25, 0.1875, 0.25, -0.1875},
			{0.125, 0.25, -0.3125, 0.25, 0.5, -0.1875},
			{0.3125, -0.5, -0.25, 0.375, 0.1875, -0.1875},
			{0.3125, 0.1875, -0.25, 0.4375, 0.4375, -0.125},
			{-0.375, -0.5, -0.4375, -0.3125, 0.25, -0.375},
			{-0.4375, 0.25, -0.4375, -0.3125, 0.5, -0.3125},
			{-0.1875, -0.5, -0.4375, -0.125, 0.25, -0.375},
			{-0.25, 0.1875, -0.5, -0.125, 0.4375, -0.375},
			{0, -0.5, -0.4375, 0.0625, 0.25, -0.375},
			{-0.0625, 0.25, -0.4375, 0.0625, 0.5, -0.3125},
			{0.1875, -0.5, -0.4375, 0.25, 0.25, -0.375},
			{0.125, 0.1875, -0.5, 0.25, 0.4375, -0.375},
			{0.375, -0.5, -0.4375, 0.4375, 0.25, -0.375},
			{0.3125, 0.25, -0.4375, 0.4375, 0.5, -0.3125},
		},
	},
	drop = {
		max_items = 4,
		items = {
			{ items = {'mcl_farming:wheat_seeds'} },
			{ items = {'mcl_farming:wheat_seeds'}, rarity = 2},
			{ items = {'mcl_farming:wheat_seeds'}, rarity = 5},
			{ items = {'mcl_farming:wheat_item'} }
		}
	},
	groups = {dig_immediate=3, not_in_creative_inventory=1, plant=1,attached_node=1, dig_by_water=1,destroy_by_lava_flow=1, dig_by_piston=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	_mcl_blast_resistance = 0,
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
	groups = {dig_immediate=3,mushroom=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
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
	groups = {dig_immediate=3,mushroom=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
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
	groups = {dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
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
	groups = {dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
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
	groups = {dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
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
	groups = {dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
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
	groups = {dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
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
	groups = {dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
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
	groups = {dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
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
	inventory_image = "mcl_flowers_dandelion.png",
	wield_image = "mcl_flowers_dandelion.png",
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	groups = {dig_immediate=3,flower=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,enderman_takable=1,deco_block=1},
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
