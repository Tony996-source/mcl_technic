local modpath = minetest.get_modpath("mcl_technic_worldgen")

mcl_technic = rawget(_G, "mcl_technic") or {}
mcl_technic.worldgen = {
	gettext = rawget(_G, "intllib") and intllib.Getter() or function(s) return s end,
}

dofile(modpath.."/mapgen.lua")
dofile(modpath.."/plants.lua")
dofile(modpath.."/trees.lua")
