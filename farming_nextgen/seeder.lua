--*******************************************************
--****                 The Seeder
--**** All coding made by Gundul except recursive_dig 
--**** was taken from technic:chainsaw mod coded by
--**** Maciej Kasatkin (RealBadAngel)
--*******************************************************

local farm_redo = false
      
-- different values if technic not present
if not farmingNG.havetech then
      farmingNG.seeder_charge_per_node = math.floor(65535 / farmingNG.seeder_max_charge * farmingNG.seeder_charge_per_node)
      farmingNG.seeder_max_charge = 65535
end
-- The default soils
local soil_nodenames = {
	["mcl_farming:soil"] 	 	= true,
	["mcl_farming:soil_wet"] 		= true,
}

farmingNG.seeder_seed = {
-- *** farming
	    {"mcl_farming:beetroot_seeds", "mcl_farming:beetroot_0"},
	    {"mcl_farming:carrot_item",    "mcl_farming:carrot_1"},
	    {"mcl_farming:melon_seeds",    "mcl_farming:melontige_1"},
	    {"mcl_farming:potato_item",    "mcl_farming:potato_1"},
	    {"mcl_farming:pumpkin_seeds",  "mcl_farming:pumpkin_1"},
	    {"mcl_farming:wheat_seeds",    "mcl_farming:wheat_1"},
	    }

local function check_valid_util(sname)
     for i in ipairs(farmingNG.seeder_utils) do
      if sname == farmingNG.seeder_utils[i][1] then return true end
     end
    return false
end

	    

-- function to check for valid seeds
local function check_valid_seed(sname)
  
    for i in ipairs(farmingNG.seeder_seed) do
      if sname == farmingNG.seeder_seed[i][1] then return true end
    end
    return false
end

--function to give name of seedlings
local function give_seedling(sname, util)

     if not util then
	  for i in ipairs(farmingNG.seeder_seed) do
	    if sname == farmingNG.seeder_seed[i][1] then return farmingNG.seeder_seed[i][2] end
	  end
     else
	  for i in ipairs(farmingNG.seeder_utils) do
	    if sname ==farmingNG.seeder_utils[i][1] then return farmingNG.seeder_utils[i][2] end
	  end
     end
    return nil
end

--- Iterator over positions to try to saw around a sawed node.
-- This returns positions in a 3x1x3 area around the position, plus the
-- position above it.  This does not return the bottom position to prevent
-- the seeder from cutting down nodes below the cutting position.
-- @param pos Sawing position.
function farmingNG.iterSawTries(pos)
	-- Copy position to prevent mangling it
	local pos = vector.new(pos)
	local i = 0

	return function()
		i = i + 1
		-- Given a (top view) area like so (where 5 is the starting position):
		-- X -->
		-- Z 123
		-- | 456
		-- V 789
		-- This will return positions 1, 4, 7, 2, 8 (skip 5), 3, 6, 9,
		-- and the position above 5.
		if i == 1 then
			-- Move to starting position
			pos.x = pos.x - 1
			pos.z = pos.z - 1
		elseif i == 4 or i == 7 then
			-- Move to next X and back to start of Z when we reach
			-- the end of a Z line.
			pos.x = pos.x + 1
			pos.z = pos.z - 2
		elseif i == 5 then
			-- Skip the middle position (we've already run on it)
			-- and double-increment the counter.
			pos.z = pos.z + 2
			i = i + 1
		elseif i <= 9 then
			-- Go to next Z.
			pos.z = pos.z + 1
		elseif i == 10 then
			-- Move back to center and up.
			-- The Y+ position must be last so that we don't dig
			-- straight upward and not come down (since the Y-
			-- position isn't checked).
			pos.x = pos.x - 1
			pos.z = pos.z - 1
			pos.y = pos.y + 1
		else
			return nil
		end
		return pos
	end
end

-- This function does all the hard work. Recursively we dig the node at hand
-- if it is in the table and then search the surroundings for more stuff to dig.
local function recursive_dig(pos, remaining_charge, seednum,seedstack, user)
	local uppos = {x =pos.x, y =(pos.y) +1,z =pos.z}
	local toppos = {x =pos.x, y =(pos.y) +2,z =pos.z}
	local name = user:get_player_name()
	
	if remaining_charge < farmingNG.seeder_charge_per_node or seedstack:is_empty() then
		return remaining_charge, seednum, seedstack
	end
	local node = minetest.get_node(pos)
	local upper = minetest.get_node(uppos)
	local top = minetest.get_node(toppos)
	local seedname = seedstack:get_name()
	local helpers = check_valid_util(upper.name)

	if not soil_nodenames[node.name] then
		return remaining_charge, seednum, seedstack
	end	
	
	if not check_valid_util(seedname) then
	      if upper.name == "air" or upper.name == "mcl_farming:weed" or string.match(upper.name,"mcl_core:grass")then
		    minetest.set_node(uppos, {name="air"})
		    remaining_charge = remaining_charge - farmingNG.seeder_charge_per_node
		    seednum = seednum +1
		    seedstack:take_item()
		    if remaining_charge < 1 then remaining_charge = 1 end
		    
		    if give_seedling(seedname,false) then
			  minetest.add_node(uppos, {name = give_seedling(seedname,false), param2 = 1})
			  minetest.get_node_timer(uppos):start(math.random(166, 286))
		    end
	      else
		    return remaining_charge, seednum, seedstack
	      end
	else
	     if (upper.name == "air" or upper.name == "mcl_farming:weed" or string.match(upper.name,"mcl_core:grass")) and top.name == "air" then 
		    minetest.set_node(uppos, {name="air"})
		    remaining_charge = remaining_charge - farmingNG.seeder_charge_per_node
		    seednum = seednum +1
		    seedstack:take_item()
		    if remaining_charge < 1 then remaining_charge = 1 end
		    
		    if give_seedling(seedname, true) then
			  minetest.add_node(uppos, {name = give_seedling(seedname, true), param2 = 1})
			  minetest.get_node_timer(uppos):start(math.random(166, 286))
		    end
	     else
		    return remaining_charge, seednum, seedstack
	     end
	end

	-- Check surroundings and run recursively if any charge left
	for npos in farmingNG.iterSawTries(pos) do
		if remaining_charge < farmingNG.seeder_charge_per_node then
			break
		end
		if soil_nodenames[minetest.get_node(npos).name] then
			remaining_charge, seednum, seedstack = recursive_dig(npos, remaining_charge, seednum, seedstack, user)
		end
	end
	return remaining_charge, seednum, seedstack
end



-- Seeder entry point
local function seeder_dig(pos, current_charge, seednum, seedstack, user)
	-- Start sawing things down
	local remaining_charge, seednum, seedstack = recursive_dig(pos, current_charge, seednum, seedstack, user)
	minetest.sound_play("farming_nextgen_seeder", {pos = pos, gain = 1.0, max_hear_distance = 10})
	return remaining_charge, seednum, seedstack
end


if farmingNG.havetech then
  
	  local S = technic.getter

	  technic.register_power_tool("farming_nextgen:seeder", farmingNG.seeder_max_charge)


	  minetest.register_tool("farming_nextgen:seeder", {
		  description = S("Seed Machine"),
		  inventory_image = "farming_nextgen_seeder.png",
		  stack_max = 1,
		  wear_represents = "technic_RE_charge",
		  on_refill = technic.refill_RE_charge,
		  on_use = function(itemstack, user, pointed_thing)
		    local seednum=0
		    local name = user:get_player_name()
		    local privs = minetest.get_player_privs(name)
		    
			
			  if pointed_thing.type ~= "node" then
				  return itemstack
			  end

			  local meta = minetest.deserialize(itemstack:get_metadata())
			  if not meta or not meta.charge or
					  meta.charge < farmingNG.seeder_charge_per_node then
				  return
			  end

			  local inv = user:get_inventory()
			  local indexnumber = user:get_wield_index()+1
			  local seedstack = inv:get_stack("main", indexnumber)
			  local seedname = seedstack:get_name()

			  
			  
			  if minetest.is_protected(pointed_thing.under, name) then
				  minetest.record_protection_violation(pointed_thing.under, name)
				  return
			  end

			  -- Send current charge to digging function so that the
			  -- seeder will stop after digging a number of nodes
			  if seedname then
			    
			    if check_valid_seed(seedname) or check_valid_util(seedname) then
				meta.charge, seednum, seedstack = seeder_dig(pointed_thing.under, meta.charge, seednum, seedstack, user)
				minetest.chat_send_player(name,"*** You used :  "..seednum.." seeds")
			    else
				minetest.chat_send_player(name," *** you need valid seeds on the right side of your device")
			    end
			    
			    
			      
			  else
			      minetest.chat_send_player(name," *** you need valid seeds on the right side of your device")
			  end
			  
			  if not technic.creative_mode then
				  technic.set_RE_wear(itemstack, meta.charge, farmingNG.seeder_max_charge)
				  itemstack:set_metadata(minetest.serialize(meta))
			  end
			  inv:set_stack("main", indexnumber, seedstack)
			  return itemstack
		    
			  
		  end,
	  })


if farmingNG.easy then
	minetest.register_craft({
	output = "farming_nextgen:seeder",
	recipe = {
	{"technic:battery", "group:button", "technic:battery"},
	{"mcl_core:iron_ingot", "mcl_core:iron_ingot", "mcl_core:iron_ingot"},
	{"mcl_core:diamond", "", "mcl_core:diamond"},
		}
	})
	  end
	  
else
	      
	  
	  minetest.register_tool("farming_nextgen:seeder", {
		  description = "Automatic seeding tool",
		  groups = {soil=3,soil=2},
		  inventory_image = "farming_nextgen_seeder.png",
		  stack_max=1,
		  liquids_pointable = false,
		  on_use = function(itemstack, user, pointed_thing)
		    local seednum=0
		    local name = user:get_player_name()
		    local privs = minetest.get_player_privs(name)
		    
			  
			  if pointed_thing.type ~= "node" then
				  return itemstack
			  end

			  local charge = 65535 - itemstack:get_wear()
			  
			  if not charge or  
					  charge < farmingNG.seeder_charge_per_node then
					  minetest.chat_send_player(name," *** Your device needs to be serviced")
				  return
			  end

			  local inv = user:get_inventory()
			  local indexnumber = user:get_wield_index()+1
			  local seedstack = inv:get_stack("main", indexnumber)
			  local seedname = seedstack:get_name()

			  
			  
			  if minetest.is_protected(pointed_thing.under, name) then
				  minetest.record_protection_violation(pointed_thing.under, name)
				  return
			  end

			  
			  
			  if seedname then
			    if check_valid_seed(seedname) or check_valid_util(seedname) then
				charge, seednum, seedstack = seeder_dig(pointed_thing.under, charge, seednum, seedstack, user)
				if farmingNG.chaton then
				     minetest.chat_send_player(name,"*** You used :  "..seednum.." seeds     ".."Charge for "..math.floor(charge/farmingNG.seeder_charge_per_node).." seeds left")
				end
			    else
				minetest.chat_send_player(name," *** you need valid seeds on the right side of your device")
			    end
			  else
			      minetest.chat_send_player(name," *** you need valid seeds on the right side of your device")
			  end
			  
			  
			  itemstack:set_wear(65535-charge)
			  
			  inv:set_stack("main", indexnumber, seedstack)
			  return itemstack
		    
			  
		  end,
	  })

minetest.register_craft({
	output = "farming_nextgen:seeder",
	recipe = {
	     {"technic:battery", "group:button", "technic:battery"},
	     {"mcl_core:iron_ingot", "mcl_core:gold_ingot", "mcl_core:iron_ingot"},
	     {"mcl_core:diamond", "", "mcl_core:diamond"},
		 }
})
end

