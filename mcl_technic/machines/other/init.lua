local path = mcl_technic.modpath.."/machines/other"

-- mesecons and tubes related


if mcl_technic.config:get_bool("enable_frames") and minetest.get_modpath("mesecons_mvps") ~= nil then
end

-- Coal-powered machines
dofile(path.."/coal_alloy_furnace.lua")
