
mcl_technic.register_tier("MV", "Medium Voltage")

local path = mcl_technic.modpath.."/machines/MV"

-- Wiring stuff
dofile(path.."/cables.lua")
dofile(path.."/battery_box.lua")
-- Generators
dofile(path.."/generator.lua")
dofile(path.."/solar_array.lua")

-- Machines
dofile(path.."/alloy_furnace.lua")
dofile(path.."/electric_furnace.lua")
dofile(path.."/grinder.lua")
dofile(path.."/extractor.lua")
dofile(path.."/compressor.lua")
dofile(path.."/tool_workshop.lua")

-- The power radiator supplies appliances with inductive coupled power:
-- Lighting and associated textures is taken directly from VanessaE's homedecor and made electric.
-- This is currently useless, slow, and mostly copied
--dofile(path.."/power_radiator.lua")
--dofile(path.."/lighting.lua")

