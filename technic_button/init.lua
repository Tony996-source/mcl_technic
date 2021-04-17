-- WALL BUTTON
-- A button that when pressed emits power for a short moment and then turns off again

local S = minetest.get_translator("technic_button")

local button_sounds = {} -- remember button push sounds

local button_get_output_rules = mesecon.rules.wallmounted_get

local boxes_off = {
	type = "wallmounted",
	wall_side = { -8/16, -2/16, -4/16, -6/16, 2/16, 4/16 },
	wall_bottom = { -4/16, -8/16, -2/16, 4/16, -6/16, 2/16 },
	wall_top = { -4/16, 6/16, -2/16, 4/16, 8/16, 2/16 },
}
local boxes_on = {
	type = "wallmounted",
	wall_side = { -8/16, -2/16, -4/16, -7/16, 2/16, 4/16 },
	wall_bottom = { -4/16, -8/16, -2/16, 4/16, -7/16, 2/16 },
	wall_top = { -4/16, 7/16, -2/16, 4/16, 8/16, 2/16 },
}

-- Push the button
mesecon.push_button = function(pos, node)
	-- No-op if button is already pushed
	if mesecon.is_receptor_on(node) then
		return
	end
	local def = minetest.registered_nodes[node.name]
	minetest.set_node(pos, {name="technic_button:button_"..def._mcl_button_basename.."_on", param2=node.param2})
	mesecon.receptor_on(pos, button_get_output_rules(node))
	local sfx = button_sounds[node.name]
	if sfx then
		minetest.sound_play(sfx, {pos=pos}, true)
	end
	local timer = minetest.get_node_timer(pos)
	timer:start(def._mcl_button_timer)
end

local on_button_place = function(itemstack, placer, pointed_thing)
	if pointed_thing.type ~= "node" then
		-- no interaction possible with entities
		return itemstack
	end

	local under = pointed_thing.under
	local node = minetest.get_node(under)
	local def = minetest.registered_nodes[node.name]
	if not def then return end
	local groups = def.groups

	-- Check special rightclick action of pointed node
	if def and def.on_rightclick then
		if not placer:get_player_control().sneak then
			return def.on_rightclick(under, node, placer, itemstack,
				pointed_thing) or itemstack, false
		end
	end

	-- If the pointed node is buildable, let's look at the node *behind* that node
	if def.buildable_to then
		local dir = vector.subtract(pointed_thing.above, pointed_thing.under)
		local actual = vector.subtract(under, dir)
		local actualnode = minetest.get_node(actual)
		def = minetest.registered_nodes[actualnode.name]
		groups = def.groups
	end

	-- Only allow placement on full-cube solid opaque nodes
	if (not groups) or (not groups.solid) or (not groups.opaque) or (def.node_box and def.node_box.type ~= "regular") then
		return itemstack
	end

	local above = pointed_thing.above

	local idef = itemstack:get_definition()
	local itemstack, success = minetest.item_place_node(itemstack, placer, pointed_thing)

	if success then
		if idef.sounds and idef.sounds.place then
			minetest.sound_play(idef.sounds.place, {pos=above, gain=1}, true)
		end
	end
	return itemstack
end

local buttonuse = S("Use the button to push it.")

mesecon.register_button = function(basename, description, texture, recipeitem, sounds, plusgroups, button_timer, push_by_arrow, longdesc, button_sound)
	local groups_off = table.copy(plusgroups)
	groups_off.attached_node=1
	groups_off.dig_by_water=1
	groups_off.destroy_by_lava_flow=1
	groups_off.dig_by_piston=1
	groups_off.button=1 -- button (off)

	local groups_on = table.copy(groups_off)
	groups_on.not_in_creative_inventory=1
	groups_on.button=2 -- button (on)

	if not button_sound then
		button_sound = "mesecons_button_push"
	end
	button_sounds["technic_button:button_"..basename.."_off"] = button_sound

	if push_by_arrow then
		groups_off.button_push_by_arrow = 1
		groups_on.button_push_by_arrow = 1
	end
	local tt = S("Provides redstone power when pushed")
	tt = tt .. "\n" .. S("Push duration: @1s", string.format("%.1f", button_timer))
	if push_by_arrow then
		tt = tt .. "\n" .. S("Pushable by arrow")
	end
	minetest.register_node("technic_button:button_"..basename.."_off", {
		drawtype = "nodebox",
		tiles = {texture},
		wield_image = "technic_button_wield_mask.png^"..texture.."^technic_button_wield_mask.png^[makealpha:255,126,126",
		-- FIXME: Use proper 3D inventory image
		inventory_image = "technic_button_wield_mask.png^"..texture.."^technic_button_wield_mask.png^[makealpha:255,126,126",
		wield_scale = { x=1, y=1, z=1},
		paramtype = "light",
		paramtype2 = "wallmounted",
		is_ground_content = false,
		walkable = false,
		sunlight_propagates = true,
		node_box = boxes_off,
		groups = groups_off,
		description = description,
		_tt_help = tt,
		_doc_items_longdesc = longdesc,
		_doc_items_usagehelp = buttonuse,
		on_place = on_button_place,
		node_placement_prediction = "",
		on_rightclick = function (pos, node)
			mesecon.push_button(pos, node)
		end,
		sounds = sounds,
		mesecons = {receptor = {
			state = mesecon.state.off,
			rules = button_get_output_rules,
		}},
		_mcl_button_basename = basename,
		_mcl_button_timer = button_timer,

		_mcl_blast_resistance = 0.5,
		_mcl_hardness = 0.5,
	})

	minetest.register_node("technic_button:button_"..basename.."_on", {
		drawtype = "nodebox",
		tiles = {texture},
		wield_image = "technic_button_wield_mask.png^"..texture.."^technic_button_wield_mask.png^[makealpha:255,126,126",
		wield_scale = { x=1, y=1, z=0.5},
		paramtype = "light",
		paramtype2 = "wallmounted",
		is_ground_content = false,
		walkable = false,
		sunlight_propagates = true,
		node_box = boxes_on,
		groups = groups_on,
		drop = 'technic_button:button_'..basename..'_off',
		_doc_items_create_entry = false,
		node_placement_prediction = "",
		sounds = sounds,
		mesecons = {receptor = {
			state = mesecon.state.on,
			rules = button_get_output_rules
		}},
		_mcl_button_basename = basename,
		_mcl_button_timer = button_timer,
		on_timer = function(pos, elapsed)
			local node = minetest.get_node(pos)
			if node.name=="technic_button:button_"..basename.."_on" then --has not been dug
				-- Is button pushable by arrow?
				if push_by_arrow then
					-- If there's an arrow stuck in the button, keep it pressed and check
					-- it again later.
					local objs = minetest.get_objects_inside_radius(pos, 1)
					for o=1, #objs do
						local entity = objs[o]:get_luaentity()
						if entity and entity.name == "mcl_bows:arrow_entity" then
							local timer = minetest.get_node_timer(pos)
							timer:start(button_timer)
							return
						end
					end
				end

				-- Normal operation: Un-press the button
				minetest.set_node(pos, {name="technic_button:button_"..basename.."_off",param2=node.param2})
				minetest.sound_play(button_sound, {pos=pos, pitch=0.9}, true)
				mesecon.receptor_off(pos, button_get_output_rules(node))
			end
		end,

		_mcl_blast_resistance = 0.5,
		_mcl_hardness = 0.5,
	})

	minetest.register_craft({
		output = "technic_button:button_"..basename.."_off",
		recipe = {{ recipeitem }},
	})
end

local items = {
	{ "iron", "mcl_core:iron_ingot", "technic_iron_button.png", S("Iron Button") },
	{ "gold", "mcl_core:gold_ingot", "technic_gold_button.png", S("Gold Button")},
    { "copper", "technic:copper_ingot", "technic_copper_button.png", S("Copper Button") },
    { "steel", "technic:steel_ingot", "technic_steel_button.png", S("Steel Button") },
}

for i=1, #items do
	mesecon.register_button(
		items[i][1],
		items[i][4],
		items[i][3],
		items[i][2],
		mcl_sounds.node_sound_metal_defaults(),
		{material_metal=1,handy=1,pickaxey=1},
		2,
		false,
		S("A "..items[i][1].." button is a redstone component made out of "..items[i][1].." which can be pushed to provide redstone power. When pushed, it powers adjacent redstone components for 2 seconds."),
		"mesecons_button_push_")
end

mesecon.register_button(
		"diamond",
		S("Diamond Button"),
		"technic_diamond_button.png",
		"mcl_core:diamond",
		mcl_sounds.node_sound_stone_defaults(),
		{material_diamond=1,handy=1,pickaxey=1},
		3,
		false,
		S("A diamond button is a redstone component made out of diamond which can be pushed to provide redstone power. When pushed, it powers adjacent redstone components for 3 seconds."),
		"mesecons_button_push_")
	
mesecon.register_button(
		"red_sandstone",
		S("Red Sandstone Button"),
		"technic_red_sandstone_button.png",
		"mcl_core:redsandstone",
		mcl_sounds.node_sound_stone_defaults(),
		{material_stone=1,handy=1,pickaxey=1},
		1.5,
		false,
		S("A red sandstone button is a redstone component made out of red sandstone which can be pushed to provide redstone power. When pushed, it powers adjacent redstone components for 1.5 seconds."),
		"mesecons_button_push_")
		
mesecon.register_button(
		"sandstone",
		S("Sandstone Button"),
		"technic_sandstone_button.png",
		"mcl_core:sandstone",
		mcl_sounds.node_sound_stone_defaults(),
		{material_stone=1,handy=1,pickaxey=1},
		1.5,
		false,
		S("A sandstone button is a redstone component made out of sandstone which can be pushed to provide redstone power. When pushed, it powers adjacent redstone components for 1.5 seconds."),
		"mesecons_button_push_")
