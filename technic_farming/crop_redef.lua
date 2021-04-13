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