local modpath = minetest.get_modpath("technic_worldgen")

technic = rawget(_G, "technic") or {}
technic.worldgen = {
	gettext = rawget(_G, "intllib") and intllib.Getter() or function(s) return s end,
}

dofile(modpath.."/mapgen.lua")
dofile(modpath.."/plants.lua")
dofile(modpath.."/trees.lua")
