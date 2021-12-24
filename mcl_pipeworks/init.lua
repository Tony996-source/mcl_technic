-- This mod supplies various steel pipes and plastic pneumatic tubes
-- and devices that they can connect to.
--

mcl_pipeworks = {}

local DEBUG = false

mcl_pipeworks.worldpath = minetest.get_worldpath()
mcl_pipeworks.modpath = minetest.get_modpath("mcl_pipeworks")

dofile(mcl_pipeworks.modpath.."/default_settings.lua")
-- Read the external config file if it exists.
local worldsettingspath = mcl_pipeworks.worldpath.."/mcl_pipeworks_settings.txt"
local worldsettingsfile = io.open(worldsettingspath, "r")
if worldsettingsfile then
	worldsettingsfile:close()
	dofile(worldsettingspath)
end

-- Random variables

mcl_pipeworks.expect_infinite_stacks = true
if minetest.get_modpath("unified_inventory") or not minetest.settings:get_bool("creative_mode") then
	mcl_pipeworks.expect_infinite_stacks = false
end

mcl_pipeworks.meseadjlist={{x=0,y=0,z=1},{x=0,y=0,z=-1},{x=0,y=1,z=0},{x=0,y=-1,z=0},{x=1,y=0,z=0},{x=-1,y=0,z=0}}

mcl_pipeworks.rules_all = {{x=0, y=0, z=1},{x=0, y=0, z=-1},{x=1, y=0, z=0},{x=-1, y=0, z=0},
		{x=0, y=1, z=1},{x=0, y=1, z=-1},{x=1, y=1, z=0},{x=-1, y=1, z=0},
		{x=0, y=-1, z=1},{x=0, y=-1, z=-1},{x=1, y=-1, z=0},{x=-1, y=-1, z=0},
		{x=0, y=1, z=0}, {x=0, y=-1, z=0}}

mcl_pipeworks.mesecons_rules={{x=0,y=0,z=1},{x=0,y=0,z=-1},{x=1,y=0,z=0},{x=-1,y=0,z=0},{x=0,y=1,z=0},{x=0,y=-1,z=0}}
mcl_pipeworks.digilines_rules={{x=0,y=0,z=1},{x=0,y=0,z=-1},{x=1,y=0,z=0},{x=-1,y=0,z=0},{x=0,y=1,z=0},{x=0,y=-1,z=0}}

mcl_pipeworks.liquid_texture = "default_water.png"

mcl_pipeworks.button_off   = {text="", texture="mcl_pipeworks_button_off.png", addopts="false;false;mcl_pipeworks_button_interm.png"}
mcl_pipeworks.button_on    = {text="", texture="mcl_pipeworks_button_on.png",  addopts="false;false;mcl_pipeworks_button_interm.png"}
mcl_pipeworks.button_base  = "image_button[0,4.3;1,0.6"
mcl_pipeworks.button_label = "label[0.9,4.31;Allow splitting incoming stacks from tubes]"

-- Helper functions

function mcl_pipeworks.fix_image_names(table, replacement)
	local outtable={}
	for i in ipairs(table) do
		outtable[i]=string.gsub(table[i], "_XXXXX", replacement)
	end

	return outtable
end

function mcl_pipeworks.add_node_box(t, b)
	if not t or not b then return end
	for i in ipairs(b)
		do table.insert(t, b[i])
	end
end

function mcl_pipeworks.may_configure(pos, player)
	local name = player:get_player_name()
	local meta = minetest.get_meta(pos)
	local owner = meta:get_string("owner")

	if owner ~= "" then -- wielders and filters
		return owner == name
	end
	return not minetest.is_protected(pos, name)
end

function mcl_pipeworks.replace_name(tbl,tr,name)
	local ntbl={}
	for key,i in pairs(tbl) do
		if type(i)=="string" then
			ntbl[key]=string.gsub(i,tr,name)
		elseif type(i)=="table" then
			ntbl[key]=mcl_pipeworks.replace_name(i,tr,name)
		else
			ntbl[key]=i
		end
	end
	return ntbl
end

mcl_pipeworks.logger = function(msg)
	print("[mcl_pipeworks] "..msg)
end

-------------------------------------------
-- Load the various other parts of the mod

dofile(mcl_pipeworks.modpath.."/common.lua")
dofile(mcl_pipeworks.modpath.."/models.lua")
dofile(mcl_pipeworks.modpath.."/autoplace_tubes.lua")
dofile(mcl_pipeworks.modpath.."/luaentity.lua")
dofile(mcl_pipeworks.modpath.."/lua_tube.lua")
dofile(mcl_pipeworks.modpath.."/item_transport.lua")
dofile(mcl_pipeworks.modpath.."/crafts.lua")
dofile(mcl_pipeworks.modpath.."/tube_registration.lua")
dofile(mcl_pipeworks.modpath.."/routing_tubes.lua")
dofile(mcl_pipeworks.modpath.."/sorting_tubes.lua")
dofile(mcl_pipeworks.modpath.."/vacuum_tubes.lua")
dofile(mcl_pipeworks.modpath.."/signal_tubes.lua")
dofile(mcl_pipeworks.modpath.."/decorative_tubes.lua")
dofile(mcl_pipeworks.modpath.."/filter-injector.lua")
dofile(mcl_pipeworks.modpath.."/trashcan.lua")
dofile(mcl_pipeworks.modpath.."/wielder.lua")

minetest.register_alias("mcl_pipeworks:pipe", "mcl_pipeworks:pipe_110000_empty")

print("Pipeworks loaded!")
