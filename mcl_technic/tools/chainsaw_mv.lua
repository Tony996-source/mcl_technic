-- Configuration

local chainsaw_max_charge = 30000 -- Maximum charge of the saw
-- Gives 2500 nodes on a single charge (about 50 complete normal trees)
local chainsaw_charge_per_node = 12

local chainsaw_leaves = true -- Cut down tree leaves.
-- Leaf decay may cause slowness on large trees if this is disabled.

local chainsaw_vines = true -- Cut down vines

local timber_nodenames = {} -- Cuttable nodes

local max_saw_radius = 12 -- max x/z distance away from starting position to allow cutting
-- Prevents forest destruction, increase for extra wide trees


	timber_nodenames["mcl_core:acaciatree"]        = true
	timber_nodenames["mcl_core:birchtree"]         = true
	timber_nodenames["mcl_core:jungletree"]        = true
	timber_nodenames["mcl_core:papyrus"]           = true
	timber_nodenames["mcl_core:cactus"]            = true
	timber_nodenames["mcl_core:tree"]              = true
	timber_nodenames["mcl_core:apple"]             = true
	timber_nodenames["mcl_core:sprucetree"]        = true
	timber_nodenames["mcl_core:darktree"]          = true
	timber_nodenames["mcl_mangrove:mangrove_tree"] = true
	timber_nodenames["mcl_mangrove:hanging_propagule"] = true

if chainsaw_leaves then
	timber_nodenames["mcl_core:acacialeaves"]          = true
	timber_nodenames["mcl_core:birchleaves"]           = true
	timber_nodenames["mcl_core:leaves"]                = true
	timber_nodenames["mcl_core:jungleleaves"]          = true
	timber_nodenames["mcl_core:spruceleaves"]          = true
	timber_nodenames["mcl_core:darkleaves"]            = true
	timber_nodenames["mcl_cocoas:cocoa_1"]             = true
	timber_nodenames["mcl_cocoas:cocoa_2"]             = true
	timber_nodenames["mcl_cocoas:cocoa_3"]             = true
	timber_nodenames["mcl_mangrove:mangroveleaves"]    = true
	timber_nodenames["mcl_mangrove:mangrove_roots"]    = true
	timber_nodenames["mcl_core:vine"]                  = true
end

local S = mcl_technic.getter

mcl_technic.register_power_tool("mcl_technic:chainsaw_mv", chainsaw_max_charge)

-- Table for saving what was sawed down
local produced = {}

-- Save the items sawed down so that we can drop them in a nice single stack
local function handle_drops(drops)
	for _, item in ipairs(drops) do
		local stack = ItemStack(item)
		local name = stack:get_name()
		local p = produced[name]
		if not p then
			produced[name] = stack
		else
			p:set_count(p:get_count() + stack:get_count())
		end
	end
end

-- This function does all the hard work. Recursively we dig the node at hand
-- if it is in the table and then search the surroundings for more stuff to dig.
local function recursive_dig(pos, origin, remaining_charge)
	if remaining_charge < chainsaw_charge_per_node then
		return remaining_charge
	end
	local node = minetest.get_node(pos)

	if not timber_nodenames[node.name] then
		return remaining_charge
	end

	-- Wood found - cut it
	handle_drops(minetest.get_node_drops(node.name, ""))
	minetest.remove_node(pos)
	remaining_charge = remaining_charge - chainsaw_charge_per_node

	-- Check for snow on pine trees, sand/gravel on leaves, etc
	minetest.check_for_falling(pos)

	-- Check surroundings and run recursively if any charge left
	for y=-1, 1 do
		if (pos.y + y) >= origin.y then
			for x=-1, 1 do
				if (pos.x + x) <= (origin.x + max_saw_radius) and (pos.x + x) >= (origin.x - max_saw_radius) then
					for z=-1, 1 do
						if (pos.z + z) <= (origin.z + max_saw_radius) and (pos.z + z) >= (origin.z - max_saw_radius) then
							local npos = {x=pos.x+x, y=pos.y+y, z=pos.z+z}
							if remaining_charge < chainsaw_charge_per_node then
								return remaining_charge
							end
							if timber_nodenames[minetest.get_node(npos).name] then
								remaining_charge = recursive_dig(npos, origin, remaining_charge)
							end
						end
					end
				end
			end
		end
	end
	return remaining_charge
end

-- Function to randomize positions for new node drops
local function get_drop_pos(pos)
	local drop_pos = {}

	for i = 0, 8 do
		-- Randomize position for a new drop
		drop_pos.x = pos.x + math.random(-3, 3)
		drop_pos.y = pos.y - 1
		drop_pos.z = pos.z + math.random(-3, 3)

		-- Move the randomized position upwards until
		-- the node is air or unloaded.
		for y = drop_pos.y, drop_pos.y + 5 do
			drop_pos.y = y
			local node = minetest.get_node_or_nil(drop_pos)

			if not node then
				-- If the node is not loaded yet simply drop
				-- the item at the original digging position.
				return pos
			elseif node.name == "air" then
				-- Add variation to the entity drop position,
				-- but don't let drops get too close to the edge
				drop_pos.x = drop_pos.x + (math.random() * 0.8) - 0.5
				drop_pos.z = drop_pos.z + (math.random() * 0.8) - 0.5
				return drop_pos
			end
		end
	end

	-- Return the original position if this takes too long
	return pos
end

-- Chainsaw entry point
local function chainsaw_dig(pos, current_charge)
	-- Start sawing things down
	local remaining_charge = recursive_dig(pos, pos, current_charge)
	minetest.sound_play("chainsaw", {pos = pos, gain = 1.0,
			max_hear_distance = 10})

	-- Now drop items for the player
	for name, stack in pairs(produced) do
		-- Drop stacks of stack max or less
		local count, max = stack:get_count(), stack:get_stack_max()
		stack:set_count(max)
		while count > max do
			minetest.add_item(get_drop_pos(pos), stack)
			count = count - max
		end
		stack:set_count(count)
		minetest.add_item(get_drop_pos(pos), stack)
	end

	-- Clean up
	produced = {}

	return remaining_charge
end

minetest.register_tool("mcl_technic:chainsaw_mv", {
	description = S("MV Chainsaw"),
	inventory_image = "mcl_technic_chainsaw_mv.png",
	stack_max = 1,
	wear_represents = "mcl_technic_RE_charge",
	on_refill = mcl_technic.refill_RE_charge,
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type ~= "node" then
			return itemstack
		end

		local meta = minetest.deserialize(itemstack:get_metadata())
		if not meta or not meta.charge or
				meta.charge < chainsaw_charge_per_node then
			return
		end

		local name = user:get_player_name()
		if minetest.is_protected(pointed_thing.under, name) then
			minetest.record_protection_violation(pointed_thing.under, name)
			return
		end

		-- Send current charge to digging function so that the
		-- chainsaw will stop after digging a number of nodes
		meta.charge = chainsaw_dig(pointed_thing.under, meta.charge)
		if not mcl_technic.creative_mode then
			mcl_technic.set_RE_wear(itemstack, meta.charge, chainsaw_max_charge)
			itemstack:set_metadata(minetest.serialize(meta))
		end
		return itemstack
	end,
})

if minetest.get_modpath("mcl_copper") then
minetest.register_craft({
	output = "mcl_technic:chainsaw_mv",
	recipe = {
	{"mcl_pipeworks:plastic_sheet", "mcl_technic:chainsaw_lv",   "mcl_technic:battery"},
	{"mcl_pipeworks:plastic_sheet", "mcl_copper:copper_ingot",   "mcl_technic:mv_cable"},
	{"",                            "",                          "mcl_pipeworks:plastic_sheet"},
	},

})

-- Add cuttable nodes after all mods loaded
minetest.after(0, function ()
	for k, v in pairs(minetest.registered_nodes) do
		if v.groups.tree then
			timber_nodenames[k] = true
		elseif chainsaw_leaves and (v.groups.leaves or v.groups.leafdecay or v.groups.leafdecay_drop) then
			timber_nodenames[k] = true
		elseif chainsaw_vines and v.groups.vines then
			timber_nodenames[k] = true
		end
	end
end)
end
