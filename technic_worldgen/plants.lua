--
-- 3d Carrots
--

for i=1, 7 do
	local texture, sel_height
	if i < 3 then
		sel_height = -7/16
		sel_height1 = -0.4375
		texture = "farming_carrot_1.png"
		texture1 = "farming_carrot_1_3d.png"
	elseif i < 5 then
		sel_height = -6/16
		sel_height1 = -0.375
		texture = "farming_carrot_2.png"
		texture1 = "farming_carrot_2_3d.png"
	else
		sel_height = -5/16
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
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, sel_height, 0.5}
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
	
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -2/16, 0.5}
		},
	},
	groups = {dig_immediate=3, not_in_creative_inventory=1,plant=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	_mcl_blast_resistance = 0,
})

--
-- 3d Potatoes
--

for a=1, 7 do
	local texture, selbox
	if a < 3 then
		texture = "mcl_farming_potatoes_stage_0.png"
		texture1 = "mcl_farming_potatoes_stage_3_3d.png"
		
		p1x1 = -0.3125
		p1y1 = -0.5
		p1z1 = 0.125
		p1x2 = -0.1875
		p1y2 = -0.4375
		p1z2 = 0.3125
		
		p2x1 = 0.0625
		p2y1 = -0.5
		p2z1 = 0.1875
		p2x2 = 0.20
		p2y2 = -0.4375
		p2z2 = 0.3125
		
		p3x1 = 0.125
		p3y1 = -0.5
		p3z1 = -0.25
		p3x2 = 0.25
		p3y2 = -0.4375
		p3z2 = -0.0625
		
		p4x1 = -0.3125
		p4y1 = -0.5
		p4z1 = -0.25
		p4x2 = -0.125
		p4y2 = -0.4375
		p4z2 = -0.125
			
selbox = { -0.5, -0.5, -0.5, 0.5, -0.4375, 0.5 }
	elseif a < 5 then
		texture = "mcl_farming_potatoes_stage_1.png"
		texture1 = "mcl_farming_potatoes_stage_3_3d.png"
		
		p1x1 = -0.375
		p1y1 = -0.5
		p1z1 = 0.0625
		p1x2 = -0.125
		p1y2 = -0.4375
		p1z2 = 0.375
		
		p2x1 = 0.0
		p2y1 = -0.5
		p2z1 = 0.125
		p2x2 = 0.3125
		p2y2 = -0.4375
		p2z2 = 0.375
		
		p3x1 = 0.0625
		p3y1 = -0.5
		p3z1 = -0.3125
		p3x2 = 0.3125
		p3y2 = -0.4375
		p3z2 = 0
		
		p4x1 = -0.375
		p4y1 = -0.5
		p4z1 = -0.3125
		p4x2 = -0.0625
		p4y2 = -0.4375
		p4z2 = -0.0625
		
selbox = { -0.5, -0.5, -0.5, 0.5, -0.4375, 0.5 }
	else
		texture = "mcl_farming_potatoes_stage_2.png"
		texture1 = "mcl_farming_potatoes_stage_3_3d.png"
		
		p1x1 = -0.3125
		p1y1 = -0.5
		p1z1 = 0.0625
		p1x2 = -0.0625
		p1y2 = -0.4375
		p1z2 = 0.375
		
		p2x1 = 0.0625
		p2y1 = -0.5
		p2z1 = 0.0625
		p2x2 = 0.375
		p2y2 = -0.4375
		p2z2 = 0.3125
		
		p3x1 = 0.0625
		p3y1 = -0.5
		p3z1 = -0.375
		p3x2 = 0.3125
		p3y2 = -0.4375
		p3z2 = -0.0625
		
		p4_x1 = -0.375
		p4_y1 = -0.5
		p4_z1 = -0.3125
		p4_x2 = -0.0625
		p4_y2 = -0.4375
		p4_z2 = -0.0625
		
selbox = { -0.5, -0.5, -0.5, 0.5, -0.375, 0.5 }
	end

	local create, name, longdesc
	if a==1 then
		create = true
		name = ("Premature Potato Plant")
		longdesc = ("Potato plants are plants which grow on farmland under sunlight in 8 stages, but only 4 stages can be visually told apart. On hydrated farmland, they grow a bit faster. They can be harvested at any time but will only yield a profit when mature.")
	else
		create = false
		if minetest.get_modpath("doc") then
			doc.add_entry_alias("nodes", "mcl_farming:potato_1", "nodes", "mcl_farming:potato_"..a)
		end
	end

	minetest.register_node(":mcl_farming:potato_"..a, {
		description = ("Premature Potato Plant (Stage @1)"),
		_doc_items_create_entry = create,
		_doc_items_entry_name = name,
		_doc_items_longdesc = longdesc,
		paramtype = "light",
		paramtype2 = "meshoptions",
		sunlight_propagates = true,
		place_param2 = 3,
		walkable = false,
		drawtype = "nodebox",
		drop = "mcl_farming:potato_item",
		tiles = { texture1 },
		inventory_image = texture,
		wield_image = texture,
	node_box = {
		type = "fixed",
		fixed = { 
		{p1x1, p1y1, p1z1, p1x2, p1y2, p1z2},
		{p2x1, p2y1, p2z1, p2x2, p2y2, p2z2},
		{p3x1, p3y1, p3z1, p3x2, p3y2, p3z2},
		{p4x1, p4y1, p4z1, p4x2, p4y2, p4z2},
		 },
	},	
		selection_box = {
			type = "fixed",
			fixed = { selbox },
		},
		groups = {dig_immediate=3, not_in_creative_inventory=1,plant=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1},
		sounds = mcl_sounds.node_sound_leaves_defaults(),
		_mcl_blast_resistance = 0,
	})
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
		{-0.3125, -0.5, 0.0625, -0.0625, -0.4375, 0.375},
		{-0.25, -0.4375, 0.125, -0.125, -0.375, 0.3125},
		{0.0625, -0.5, 0.0625, 0.375, -0.4375, 0.3125},
		{0.125, -0.4375, 0.125, 0.3125, -0.375, 0.25},
		{0.0625, -0.5, -0.375, 0.3125, -0.4375, -0.0625},
		{0.125, -0.4375, -0.3125, 0.25, -0.375, -0.125},
		{-0.375, -0.5, -0.3125, -0.0625, -0.4375, -0.0625},
		{-0.3125, -0.4375, -0.25, -0.125, -0.375, -0.125},
		},
	},	
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, -0.375, 0.5 }
		}
	},
	groups = {dig_immediate=3, not_in_creative_inventory=1,plant=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	_mcl_blast_resistance = 0,
})

--
-- 3d beetroot
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
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
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
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -3/16, 0.5}
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
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 2/16, 0.5}
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
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 3/16, 0.5}
		},
	},
	groups = {dig_immediate=3, not_in_creative_inventory=1,plant=1,attached_node=1,dig_by_water=1,destroy_by_lava_flow=1,dig_by_piston=1,beetroot=4},
	sounds = mcl_sounds.node_sound_leaves_defaults(),
	_mcl_blast_resistance = 0,
})
