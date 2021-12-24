
local load_start = os.clock()

mcl_technic = rawget(_G, "mcl_technic") or {}
mcl_technic.creative_mode = minetest.settings:get_bool("creative_mode")

local modpath = minetest.get_modpath("mcl_technic")
mcl_technic.modpath = modpath

-- Boilerplate to support intllib
if rawget(_G, "intllib") then
	mcl_technic.getter = intllib.Getter()
else
	mcl_technic.getter = function(s,a,...)if a==nil then return s end a={a,...}return s:gsub("(@?)@(%(?)(%d+)(%)?)",function(e,o,n,c)if e==""then return a[tonumber(n)]..(o==""and c or"")else return"@"..o..n..c end end) end
end
local S = mcl_technic.getter

-- Read configuration file
dofile(modpath.."/config.lua")

-- Helper functions
dofile(modpath.."/helpers.lua")

-- Items 
dofile(modpath.."/items.lua")

-- Craft recipes for items 
dofile(modpath.."/crafts.lua")

-- Register functions
dofile(modpath.."/register.lua")

-- Machines
dofile(modpath.."/machines/init.lua")

-- Tools
dofile(modpath.."/tools/init.lua")

-- Aliases for legacy node/item names
dofile(modpath.."/legacy.lua")

dofile(modpath.."/craftguide.lua")

dofile(modpath.."/redef.lua")

if minetest.settings:get_bool("log_mods") then
	print(S("[mcl_technic] Loaded in %f seconds"):format(os.clock() - load_start))
end

