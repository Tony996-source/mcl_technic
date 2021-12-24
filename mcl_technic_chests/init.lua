
local modpath = minetest.get_modpath("mcl_technic_chests")

mcl_technic = rawget(_G, "mcl_technic") or {}
mcl_technic.chests = {}

dofile(modpath.."/common.lua")
dofile(modpath.."/register.lua")
dofile(modpath.."/iron_chest.lua")
dofile(modpath.."/gold_chest.lua")
dofile(modpath.."/silicon_chest.lua")


