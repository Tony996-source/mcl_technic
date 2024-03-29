
mcl_technic.register_tier("LV", "Low Voltage")

local path = mcl_technic.modpath.."/machines/LV"

-- Wiring stuff
dofile(path.."/cables.lua")
dofile(path.."/battery_box.lua")

-- Generators
dofile(path.."/solar_panel.lua")
dofile(path.."/solar_array.lua")
dofile(path.."/generator.lua")

-- Machines
dofile(path.."/alloy_furnace.lua")
dofile(path.."/electric_furnace.lua")
dofile(path.."/grinder.lua")
dofile(path.."/extractor.lua")
dofile(path.."/compressor.lua")
