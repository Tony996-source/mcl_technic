
local modpath = minetest.get_modpath("technic_chests")

technic = rawget(_G, "technic") or {}
technic.chests = {}

dofile(modpath.."/common.lua")
dofile(modpath.."/register.lua")
dofile(modpath.."/iron_chest.lua")
dofile(modpath.."/gold_chest.lua")
dofile(modpath.."/silicon_chest.lua")


