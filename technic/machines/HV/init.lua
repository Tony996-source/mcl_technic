
technic.register_tier("HV", "High Voltage")

local path = technic.modpath.."/machines/HV"

-- Wiring stuff
dofile(path.."/cables.lua")
dofile(path.."/battery_box.lua")

-- Generators
dofile(path.."/solar_array.lua")
dofile(path.."/generator.lua")

-- Machines
dofile(path.."/quarry.lua")
dofile(path.."/alloy_furnace.lua")
dofile(path.."/compressor.lua")
dofile(path.."/electric_furnace.lua")
dofile(path.."/tool_workshop.lua")
dofile(path.."/grinder.lua")
dofile(path.."/extractor.lua")
dofile(path.."/freezer.lua")
dofile(path.."/sawmill.lua")
