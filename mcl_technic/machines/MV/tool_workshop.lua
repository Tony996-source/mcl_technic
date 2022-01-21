-- Tool workshop
-- This machine repairs tools.

minetest.register_alias("tool_workshop_mv", "mcl_technic:tool_workshop_mv")

local S = mcl_technic.getter

local tube_entry = "^mcl_pipeworks_tube_connection_metallic.png"

minetest.register_craft({
	output = 'mcl_technic:tool_workshop_mv',
	recipe = {
	{'group:wood',  'mcl_core:diamond',  'group:wood'},
	{'mcl_technic:carbon_plate', 'mcl_copper:copper_ingot', 'mcl_technic:carbon_plate'},
	{'mcl_technic:steel_block', 'mcl_technic:mv_cable', 'mcl_technic:steel_block'},
	}
})

local workshop_demand = {5000, 3500, 2000}

local workshop_formspec =
	"size[9,9;]"..
	"list[current_name;src;3,1;1,1;]"..
	mcl_formspec.get_itemslot_bg(3,1,1,1)..
	"label[0,0;"..S("%s Tool Workshop"):format("MV").."]"..
	"list[current_name;upgrade1;1,3;1,1;]"..
	mcl_formspec.get_itemslot_bg(1,3,1,1)..
	"list[current_name;upgrade2;2,3;1,1;]"..
	mcl_formspec.get_itemslot_bg(2,3,1,1)..
	"label[1,4;"..S("Upgrade Slots").."]"..
			"list[current_player;main;0,5;9,3;9]"..
	    mcl_formspec.get_itemslot_bg(0,5,9,3)..
	    "list[current_player;main;0,8;9,1;]"..
	    mcl_formspec.get_itemslot_bg(0,8,9,1)..
	"listring[current_player;main]"..
	"listring[current_name;src]"..
	"listring[current_player;main]"..
	"listring[current_name;upgrade1]"..
	"listring[current_player;main]"..
	"listring[current_name;upgrade2]"..
	"listring[current_player;main]"

local run = function(pos, node)
	local meta         = minetest.get_meta(pos)
	local inv          = meta:get_inventory()
	local eu_input     = meta:get_int("MV_EU_input")
	local machine_name = S("%s Tool Workshop"):format("MV")
	local machine_node = "mcl_technic:tool_workshop_mv"

	-- Setup meta data if it does not exist.
	if not eu_input then
		meta:set_int("MV_EU_demand", workshop_demand[1])
		meta:set_int("MV_EU_input", 0)
		return
	end

	local EU_upgrade, tube_upgrade = mcl_technic.handle_machine_upgrades(meta)

	local repairable = false
	local srcstack = inv:get_stack("src", 1)
	if not srcstack:is_empty() then
		local itemdef = minetest.registered_items[srcstack:get_name()]
		if itemdef and
				(not itemdef.wear_represents or
				itemdef.wear_represents == "mechanical_wear") and
				srcstack:get_wear() ~= 0 then
			repairable = true
		end
	end
	mcl_technic.handle_machine_mcl_pipeworks(pos, tube_upgrade, function (pos, x_velocity, z_velocity)
		if not repairable then
			mcl_technic.send_items(pos, x_velocity, z_velocity, "src")
		end
	end)
if not repairable then
		meta:set_string("infotext", S("%s Idle"):format(machine_name))
		meta:set_int("MV_EU_demand", 0)
		mcl_technic.swap_node(pos, "mcl_technic:tool_workshop_mv")
		return
	end
	
	if eu_input < workshop_demand[EU_upgrade+1] then
		meta:set_string("infotext", S("%s Idle"):format(machine_name))
		mcl_technic.swap_node(pos, "mcl_technic:tool_workshop_mv")
	elseif eu_input >= workshop_demand[EU_upgrade+1] then
	    mcl_technic.swap_node(pos, "mcl_technic:tool_workshop_mv_active")
		meta:set_string("infotext", S("%s Active"):format(machine_name))
		srcstack:add_wear(-8000)
		inv:set_stack("src", 1, srcstack)
		if mcl_experience.throw_xp then
					local dir = vector.divide(minetest.facedir_to_dir(minetest.get_node(pos).param2),-1.95)
					mcl_experience.throw_xp(vector.add(pos, dir), 1)
				end
	end
	return
	meta:set_int("MV_EU_demand", workshop_demand[EU_upgrade+1])
	
end

minetest.register_node("mcl_technic:tool_workshop_mv", {
	description = S("%s Tool Workshop"):format("MV"),
	paramtype2 = "facedir",
	tiles = {
		"mcl_technic_mv_workshop_top.png",
		"mcl_technic_mv_workshop_bottom.png",
		"mcl_technic_mv_workshop_side.png"..tube_entry,
		"mcl_technic_mv_workshop_side.png"..tube_entry,
		"mcl_technic_mv_workshop_side.png"..tube_entry,
		"mcl_technic_mv_workshop_front.png"
	},
	groups = {pickaxey=1,axey=1, handy=1, swordy=1,
		mcl_technic_machine=1, mcl_technic_mv=1, tubedevice=1, tubedevice_receiver=1},
		_mcl_blast_resistance = 6,
	_mcl_hardness = 1.5,
	connect_sides = {"bottom", "back", "left", "right"},
	sounds = mcl_sounds.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", S("%s Tool Workshop"):format("MV"))
		meta:set_string("formspec", workshop_formspec)
		local inv = meta:get_inventory()
		inv:set_size("src", 1)
		inv:set_size("upgrade1", 1)
		inv:set_size("upgrade2", 1)
	end,	
	can_dig = mcl_technic.machine_can_dig,
	allow_metadata_inventory_put = mcl_technic.machine_inventory_put,
	allow_metadata_inventory_take = mcl_technic.machine_inventory_take,
	tube = {
		can_insert = function (pos, node, stack, direction)
			return minetest.get_meta(pos):get_inventory():room_for_item("src", stack)
		end,
		insert_object = function (pos, node, stack, direction)
			return minetest.get_meta(pos):get_inventory():add_item("src", stack)
		end,
		connect_sides = {left = 1, right = 1, back = 1, top = 1, bottom = 1},
	},
	mcl_technic_run = run,
	after_place_node = mcl_pipeworks.after_place,
	after_dig_node = mcl_technic.machine_after_dig_node
})

minetest.register_node("mcl_technic:tool_workshop_mv_active", {
	description = S("%s Tool Workshop"):format("MV"),
	paramtype2 = "facedir",
	tiles = {
		"mcl_technic_mv_workshop_top.png",
		"mcl_technic_mv_workshop_bottom.png",
		"mcl_technic_mv_workshop_side.png"..tube_entry,
		"mcl_technic_mv_workshop_side.png"..tube_entry,
		"mcl_technic_mv_workshop_side.png"..tube_entry,
		"mcl_technic_mv_workshop_front_active.png"
	},
	groups = {pickaxey=1,axey=1, handy=1, swordy=1, not_in_creative_inventory = 1, 
		mcl_technic_machine=1, mcl_technic_mv=1, tubedevice=1, tubedevice_receiver=1},
	drop = "mcl_technic:tool_workshop_mv",
	connect_sides = {"bottom", "back", "left", "right"},
	sounds = mcl_sounds.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", S("%s Tool Workshop"):format("MV"))
		meta:set_string("formspec", workshop_formspec)
		local inv = meta:get_inventory()
		inv:set_size("src", 1)
		inv:set_size("upgrade1", 1)
		inv:set_size("upgrade2", 1)
	end,	
	can_dig = mcl_technic.machine_can_dig,
	allow_metadata_inventory_put = mcl_technic.machine_inventory_put,
	allow_metadata_inventory_take = mcl_technic.machine_inventory_take,
	tube = {
		can_insert = function (pos, node, stack, direction)
			return minetest.get_meta(pos):get_inventory():room_for_item("src", stack)
		end,
		insert_object = function (pos, node, stack, direction)
			return minetest.get_meta(pos):get_inventory():add_item("src", stack)
		end,
		connect_sides = {left = 1, right = 1, back = 1, top = 1, bottom = 1},
	},
	mcl_technic_run = run,
	after_place_node = mcl_pipeworks.after_place,
	after_dig_node = mcl_technic.machine_after_dig_node
})

mcl_technic.register_machine("MV", "mcl_technic:tool_workshop_mv", mcl_technic.receiver)

