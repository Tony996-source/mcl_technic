local path = technic.modpath.."/tools"

if technic.config:get_bool("enable_mining_drill") then
	dofile(path.."/mining_drill.lua")
end
if technic.config:get_bool("enable_mining_laser") then
	dofile(path.."/mining_lasers.lua")
end
if technic.config:get_bool("enable_flashlight") then
	dofile(path.."/flashlight.lua")
end
dofile(path.."/cans.lua")
dofile(path.."/chainsaw_mv.lua")
dofile(path.."/chainsaw_lv.lua")
dofile(path.."/chainsaw_hv.lua")
dofile(path.."/sonic_screwdriver.lua")
dofile(path.."/vacuum_lv.lua")
dofile(path.."/vacuum_mv.lua")
dofile(path.."/vacuum_hv.lua")
dofile(path.."/lawn_trimmer.lua")

if minetest.get_modpath("screwdriver") then
	-- compatibility alias
	minetest.register_alias("technic:screwdriver", "screwdriver:screwdriver")
end

