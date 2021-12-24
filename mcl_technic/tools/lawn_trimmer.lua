
-- Configuration
-- Intended to hold as much as the chainsaw, 10000 units
local lawn_trimmer_max_charge        = 10000
-- With 25 units per object can mow 400 'group:flora' blocks
local lawn_trimmer_charge_per_object = 25

local S = mcl_technic.getter

local lawn_trimmer_mode_text = {
	S("sweep a single block under the user"),
	S("sweep 1 block around the user"),
	S("sweep 2 blocks around the user"),
	S("sweep 3 blocks around the user")
}

local node_removed

-- Mode switcher for the tool
local function lawn_trimmer_setmode(user, itemstack, meta)
	local player_name = user:get_player_name()

	if not meta then
		meta = {mode = nil}
	end
	if not meta.mode then
		minetest.chat_send_player(player_name, 
			S("Use while sneaking to change Lawn Trimmer modes."))
		meta.mode = 0
	end
	
	meta.mode = meta.mode % 4 + 1
	
	minetest.chat_send_player(player_name, 
		S("Lawn Trimmer Mode %d"):format(meta.mode) .. ": "
		.. lawn_trimmer_mode_text[meta.mode])
	itemstack:set_name("mcl_technic:lawn_trimmer_" .. meta.mode);
	itemstack:set_metadata(minetest.serialize(meta))
	return itemstack
end


-- Perform the trimming action
local function trim_the_lawn(itemstack, user, pointed_thing)
	local meta = minetest.deserialize(itemstack:get_metadata())
	local keys = user:get_player_control()
	
	if not meta or not meta.mode or keys.sneak then
		return lawn_trimmer_setmode(user, itemstack, meta)
	end
	
	meta.charge = meta.charge or 0
	
	if meta.charge < lawn_trimmer_charge_per_object then
		return -- no charge for even a single node, aborting
	end
	
	local pos
	if user.get_pos ~= nil then
		pos = user:get_pos()
	else
		-- we are held in a node breaker
		pos = pointed_thing.under
	end
	
	minetest.sound_play("mcl_technic_lawn_trimmer", {
-- 		to_player = user:get_player_name(),
		pos = pos,
		gain = 0.4,
	})
	
	
	-- Defining the area for the search needs two positions
	-- The tool has a limited range in the vertical axis, which is capped at +/- 1 node
	local start_pos = {
		x = pos.x - meta.mode + 1,
		z = pos.z - meta.mode + 1,
		y = pos.y - 1 
	} 
	local end_pos = {
		x = pos.x + meta.mode - 1,
		z = pos.z + meta.mode - 1,
		y = pos.y + 1
	} 

	-- Since nodes sometimes cannot be removed, we cannot rely on repeating 
	-- find_node_near() and removing found nodes
	local found_flora = minetest.find_nodes_in_area(start_pos, end_pos, {"group:flora"})
	for _, f in ipairs(found_flora) do
		node_removed = false
		-- Callback will set the flag to true if the node is dug successfully,
		-- otherwise skip to the next one.
		minetest.node_dig(f, minetest.get_node(f), user)
		if node_removed then
			meta.charge = meta.charge - lawn_trimmer_charge_per_object
			-- Abort if no charge left for another node
			if meta.charge < lawn_trimmer_charge_per_object then break end
		end
	end

	-- The charge won't expire in creative mode, but the tool still 
	-- has to be charged prior to use
	if not mcl_technic.creative_mode then
		mcl_technic.set_RE_wear(itemstack, meta.charge, lawn_trimmer_max_charge)
		itemstack:set_metadata(minetest.serialize(meta))
	end
	return itemstack
end

function check_removal()
	node_removed = true
end

-- Register the tool and its varieties in the game
mcl_technic.register_power_tool("mcl_technic:lawn_trimmer", lawn_trimmer_max_charge)
minetest.register_tool("mcl_technic:lawn_trimmer", {
	description = S("Lawn Trimmer"),
	groups = {mcl_technic_tool = 1, mcl_technic_powertool = 1},
	inventory_image = "mcl_technic_lawn_trimmer.png",
	stack_max = 1,
	wear_represents = "mcl_technic_RE_charge",
	on_refill = mcl_technic.refill_RE_charge,
	on_use = trim_the_lawn,
	after_use = check_removal
})

for i = 1, 4 do
	mcl_technic.register_power_tool("mcl_technic:lawn_trimmer_" .. i, lawn_trimmer_max_charge)
	minetest.register_tool("mcl_technic:lawn_trimmer_" .. i, {
		description = S("Lawn Trimmer Mode %d"):format(i),
		groups = {mcl_technic_tool = 1, mcl_technic_powertool = 1},
		inventory_image = "mcl_technic_lawn_trimmer.png^mcl_technic_tool_mode" .. i .. ".png",
		wield_image = "mcl_technic_lawn_trimmer.png",
		wear_represents = "mcl_technic_RE_charge",
		on_refill = mcl_technic.refill_RE_charge,
		groups = {not_in_creative_inventory = 1},
		on_use = trim_the_lawn,
		after_use = check_removal,
	})
end


-- Provide a crafting recipe

minetest.register_craft({
	output = 'mcl_technic:lawn_trimmer',
	recipe = {
		{'', 'mcl_core:stick', 'group:button'},
		{'mcl_core:gold_ingot', 'mcl_core:stick', 'mcl_technic:battery'},
		{'mcl_core:iron_ingot', '', ''},
	}
})
