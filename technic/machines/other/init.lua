local path = technic.modpath.."/machines/other"

-- mesecons and tubes related


if technic.config:get_bool("enable_frames") and minetest.get_modpath("mesecons_mvps") ~= nil then
end

-- Coal-powered machines
dofile(path.."/coal_alloy_furnace.lua")
