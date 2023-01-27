
-- Grinding Guide

mcl_craftguide.register_craft_type("grinding", {
	description = "Grinding",
	icon = "mcl_technic_hv_grinder_front_active.png",
})

local grind_recipe = {

    {"mcl_rubber:rubbertree",            "mcl_technic:sawdust"},
    {"mcl_rubber:stripped_rubbertree",   "mcl_technic:sawdust"},
    {"mcl_rubber:rubberwood",            "mcl_technic:sawdust"},
 
	-- Dusts
	{"mcl_core:coal_lump",         "mcl_technic:coal_dust"},
	{"mcl_core:charcoal_lump",     "mcl_technic:charcoal_dust"},
	{"mcl_core:stone_with_iron",   "mcl_technic:iron_dust"},
	{"mcl_core:stone_with_gold",   "mcl_technic:gold_dust"},
	{"mcl_core:gold_ingot",        "mcl_technic:gold_dust"},
	{"mcl_core:iron_ingot",        "mcl_technic:iron_dust"},
	{"mcl_copper:raw_copper",      "mcl_technic:copper_dust"},
    {"mcl_copper:copper_ingot",    "mcl_technic:copper_dust"},
    {"mcl_core:diamond",           "mcl_technic:diamond_dust"},
	
-- Trees
    {"mcl_core:tree",                   "mcl_technic:sawdust"},
    {"mcl_core:jungletree",             "mcl_technic:sawdust"},
    {"mcl_core:birchtree",              "mcl_technic:sawdust"},
    {"mcl_core:sprucetree",             "mcl_technic:sawdust"},
    {"mcl_core:acaciatree",             "mcl_technic:sawdust"},
    {"mcl_core:darktree",               "mcl_technic:sawdust"},
    {"mcl_mangrove:mangrove_tree",      "mcl_technic:sawdust"},
    {"mcl_mangrove:mangrove_wood",      "mcl_technic:sawdust"},
    {"mcl_core:wood",                   "mcl_technic:sawdust"},
    {"mcl_core:junglewood",             "mcl_technic:sawdust"},
    {"mcl_core:sprucewood",             "mcl_technic:sawdust"},
    {"mcl_core:birchwood",              "mcl_technic:sawdust"},
    {"mcl_core:darkwood",               "mcl_technic:sawdust"},
    {"mcl_core:acaciawood",             "mcl_technic:sawdust"},
    {"mcl_core:stripped_acacia",        "mcl_technic:sawdust"},
    {"mcl_core:stripped_birch",         "mcl_technic:sawdust"},
    {"mcl_core:stripped_dark_oak",      "mcl_technic:sawdust"},
    {"mcl_core:stripped_jungle",        "mcl_technic:sawdust"},
    {"mcl_core:stripped_oak",           "mcl_technic:sawdust"},
    {"mcl_core:stripped_spruce",        "mcl_technic:sawdust"},
    {"mcl_core:stripped_acacia_bark",   "mcl_technic:sawdust"},
    {"mcl_core:stripped_birch_bark",    "mcl_technic:sawdust"},
    {"mcl_core:stripped_dark_oak_bark", "mcl_technic:sawdust"},
    {"mcl_core:stripped_jungle_bark",   "mcl_technic:sawdust"},
    {"mcl_core:stripped_oak_bark",      "mcl_technic:sawdust"},
    {"mcl_core:stripped_spruce_bark",   "mcl_technic:sawdust"},
    {"mcl_core:acacia_bark",            "mcl_technic:sawdust"},
    {"mcl_core:birch_bark",             "mcl_technic:sawdust"},
    {"mcl_core:dark_oak_bark",          "mcl_technic:sawdust"},
    {"mcl_core:jungle_bark",            "mcl_technic:sawdust"},
    {"mcl_core:oak_bark",               "mcl_technic:sawdust"},
    {"mcl_core:spruce_bark",            "mcl_technic:sawdust"},
    
	-- Other
	{"mcl_mobitems:bone",          "mcl_bone_meal:bone_meal"},
	{"mcl_core:cobble",            "mcl_core:gravel"},
	{"mcl_core:gravel",            "mcl_core:sand"},
	{"mcl_core:sandstone",         "mcl_core:sand"},
	{"mcl_core:redsandstone",      "mcl_core:redsand"},
    {"mcl_core:stone",             "mcl_technic:stone_dust"},
    {"mcl_technic:steel_ingot",    "mcl_technic:steel_dust"},
    {"mcl_core:iron_nugget",       "mcl_technic:lowgrade_iron_dust"},
    {"mcl_core:gold_nugget",       "mcl_technic:lowgrade_gold_dust"},
    {"mcl_raw_ores:raw_gold",      "mcl_technic:gold_dust"},
    {"mcl_raw_ores:raw_iron",      "mcl_technic:iron_dust"},
    {"mcl_raw_ores:raw_iron",      "mcl_technic:iron_dust 2"},
}



for _, grind_recipe in pairs(grind_recipe) do


mcl_craftguide.register_craft({
	type   = "grinding",
	width  = 2,
	output = grind_recipe[2],
	items  = {grind_recipe[1]},
})
end

-- Compressing Guide

mcl_craftguide.register_craft_type("compressing", {
	description = "Compressing",
	icon = "mcl_technic_hv_compressor_front_active.png",
})

local compress_recipe = {
	{"mcl_core:snowblock",          "mcl_core:ice"},
	{"mcl_core:sand",               "mcl_core:sandstone"},
	{"mcl_core:redsand",            "mcl_core:redsandstone"},
	{"mcl_technic:coal_dust",       "mcl_technic:graphite"},
	{"mcl_technic:charcoal_dust",   "mcl_technic:graphite"},
	{"mcl_technic:carbon_cloth",    "mcl_technic:carbon_plate"},
    {"mcl_core:coalblock",          "mcl_core:diamond"},
    {"mcl_technic:charcoalblock",   "mcl_core:diamond"},
    {"mcl_core:charcoal_lump",      "mcl_technic:charcoalblock"},
    {"mcl_technic:sawdust",         "mcl_core:paper"},
    {"mcl_core:coal_lump",          "mcl_core:coalblock"},
    {"mcl_raw_ores:raw_gold",       "mcl_raw_ores:raw_gold_block"},
    {"mcl_raw_ores:raw_iron",       "mcl_raw_ores:raw_iron_block"},
    {"mcl_core:gold_ingot",         "mcl_core:goldblock"},
    {"mcl_core:iron_ingot",         "mcl_core:ironblock"},
    {"mcl_copper:copper_ingot",     "mcl_copper:block"},
    {"mcl_copper:raw_copper",       "mcl_copper:block_raw"},
    {"mcl_core:diamond",            "mcl_core:diamondblock"},
    {"mcl_technic:steel_ingot",     "mcl_technic:steel_block"},
    {"mcl_dye:blue",                "mcl_core:lapisblock"},
    {"mcl_core:emerald",            "mcl_core:emeraldblock"},
    {"mcl_mobitems:rotten_flesh",   "mcl_mobitems:leather"},
    {"mcl_technic:copper_nugget",   "mcl_copper:copper_ingot"},
    {"mcl_technic:diamond_dust",    "mcl_core:diamond"},
    {"mesecons:redstone",           "mesecons_torch:redstoneblock"}
}

for _, compress_recipe in pairs(compress_recipe) do


mcl_craftguide.register_craft({
	type   = "compressing",
	width  = 2,
	output = compress_recipe[2],
	items  = {compress_recipe[1]},
})
end


-- Extracting Guide

mcl_craftguide.register_craft_type("extracting", {
	description = "Extracting",
	icon = "mcl_technic_hv_extractor_front_active.png",
})

local extract_recipe = {
	{"mcl_rubber:rubberleaves",     "mcl_pipeworks:oil_extract"},
    {"mcl_rubber:rubber_raw",       "mcl_pipeworks:oil_extract"},
	{"mcl_technic:sawdust",         "mcl_rubber:rubber_raw" or "mcl_technic:oil"},
    {"mcl_technic:oil",             "mcl_pipeworks:oil_extract"},
	{"mcl_technic:coal_dust",       "mcl_dye:black"},
	{"mcl_technic:charcoal_dust",   "mcl_dye:black"},
	{"mcl_core:cactus",             "mcl_dye:dark_green"},
	{"mcl_core:reeds",              "mcl_dye:dark_green"},
	{"mcl_flowers:blue_orchid",     "mcl_dye:blue"},
	{"mcl_core:lapis",              "mcl_dye:blue"},
	{"mcl_flowers:oxeye_daisy",     "mcl_dye:white"},
	{"mcl_flowers:dandelion",       "mcl_dye:yellow"},
	{"mcl_flowers:tulip",           "mcl_dye:orange"},
	{"mcl_flowers:poppy",           "mcl_dye:red"},
	{"mcl_flowers:allium",          "mcl_dye:magenta"},
	{"mcl_flowers:tulip_pink",      "mcl_dye:pink"},
	{"mcl_flowers:tulip_red",       "mcl_dye:red"},
	{"mcl_flowers:tulip_white",     "mcl_dye:white"},
	{"mcl_flowers:tulip_orange",    "mcl_dye:orange"},
	{"mcl_end:chorus_fruit_popped", "mcl_dye:purple"},
	{"mcl_mobitems:ink_sac",        "mcl_dye:black"},
	{"mcl_cocoas:cocoa_beans",      "mcl_dye:brown"},
	{"mcl_bone_meal:bone_meal",     "mcl_dye:white"},
	{"mcl_flowers:azure_bluet",     "mcl_dye:grey"},

	{"mcl_technic:stone_dust",        "mcl_technic:lowgrade_iron_dust"},
	{"mcl_core:sand",                 "mcl_technic:lowgrade_gold_dust"},
	{"mcl_core:redsand",              "mcl_technic:lowgrade_copper_dust"},
	{"mcl_core:dirt",                 "mcl_mobitems:bone"},
	{"mcl_farming:beetroot_item",     "mcl_dye:red"},
	{"mcl_flowers:rose_bush",         "mcl_dye:red"},
	{"mcl_flowers:peony",             "mcl_dye:pink"},
	{"mcl_flowers:lilac",             "mcl_dye:magenta"},
	{"mcl_flowers:sunflower",         "mcl_dye:yellow"},
	{"mcl_core:stonebrickmossy",      "mcl_core:moss"},
	{"mcl_core:mossycobble",          "mcl_core:moss"},
	{"mcl_farming:wheat_item",        "mcl_farming:wheat_seeds "},
	{"mcl_core:leaves",               "mcl_pipeworks:oil_extract"},
	{"mcl_core:darkleaves",           "mcl_pipeworks:oil_extract"},
	{"mcl_core:jungleleaves",         "mcl_pipeworks:oil_extract"},
	{"mcl_core:acacialeaves",         "mcl_pipeworks:oil_extract"},
	{"mcl_core:spruceleaves",         "mcl_pipeworks:oil_extract"},
	{"mcl_core:birchleaves",          "mcl_pipeworks:oil_extract"},
	{"mcl_mangrove:mangroveleaves",   "mcl_pipeworks:oil_extract"},
	{"mcl_core:dirt_with_grass",      "mcl_mobitems:bone"},
	{"mcl_core:dirt_with_grass_snow", "mcl_mobitems:bone"},
	{"mcl_core:grass_path",           "mcl_mobitems:bone"},
	{"mcl_core:mycelium",             "mcl_mobitems:bone"},
	{"mcl_core:mycelium_snow",        "mcl_mobitems:bone"},
	{"mcl_core:podzol",               "mcl_mobitems:bone"},
	{"mcl_core:podzol_snow",          "mcl_mobitems:bone"},
	{"mcl_core:dirt",                 "mcl_mobitems:bone"},
	{"mcl_core:coarse_dirt",          "mcl_mobitems:bone"},
	{"mcl_deepslate:tuff",            "mcl_mobitems:bone"},
}

for _, extract_recipe in pairs(extract_recipe) do


mcl_craftguide.register_craft({
	type   = "extracting",
	width  = 2,
	output = extract_recipe[2],
	items  = {extract_recipe[1]},
})
end


-- cutting Guide

mcl_craftguide.register_craft_type("cutting", {
	description = "Cutting",
	icon = "mcl_technic_hv_sawmill_front_active.png",
})

local cut_recipe = {
	{"mcl_core:tree",                   "mcl_core:wood"},
	{"mcl_core:jungletree",             "mcl_core:junglewood"},
    {"mcl_core:birchtree",              "mcl_core:birchwood"},
    {"mcl_core:sprucetree",             "mcl_core:sprucewood"},
    {"mcl_core:acaciatree",             "mcl_core:acaciawood"},
    {"mcl_core:darktree",               "mcl_core:darkwood"},
    {"mcl_mangrove:mangrove_tree",      "mcl_mangrove:mangrove_wood"},
    {"mcl_core:wood",                   "mcl_core:stick"},
	{"mcl_core:junglewood",             "mcl_core:stick"},
    {"mcl_core:birchwood",              "mcl_core:stick"},
    {"mcl_core:sprucewood",             "mcl_core:stick"},
    {"mcl_core:acaciawood",             "mcl_core:stick"},
    {"mcl_core:darkwood",               "mcl_core:stick"},
    {"mcl_mangrove:mangrove_wood",      "mcl_core:stick"},
    {"mcl_core:stripped_acacia",        "mcl_core:acaciawood"},
    {"mcl_core:stripped_birch",         "mcl_core:birchwood"},
    {"mcl_core:stripped_dark_oak",      "mcl_core:darkwood"},
    {"mcl_core:stripped_jungle",        "mcl_core:junglewood"},
    {"mcl_core:stripped_oak",           "mcl_core:wood"},
    {"mcl_core:stripped_spruce",        "mcl_core:sprucewood"},
    {"mcl_core:stripped_acacia_bark",   "mcl_core:acaciawood"},
    {"mcl_core:stripped_birch_bark",    "mcl_core:birchwood"},
    {"mcl_core:stripped_dark_oak_bark", "mcl_core:darkwood"},
    {"mcl_core:stripped_jungle_bark",   "mcl_core:junglewood"},
    {"mcl_core:stripped_oak_bark",      "mcl_core:wood"},
    {"mcl_core:stripped_spruce_bark",   "mcl_core:sprucewood"},
    {"mcl_core:acacia_bark",            "mcl_core:acaciawood"},
    {"mcl_core:birch_bark",             "mcl_core:birchwood"},
    {"mcl_core:dark_oak_bark",          "mcl_core:darkwood"},
    {"mcl_core:jungle_bark",            "mcl_core:junglewood"},
    {"mcl_core:oak_bark",               "mcl_core:wood"},
    {"mcl_core:spruce_bark",            "mcl_core:sprucewood"},
    {"mcl_rubber:rubbertree",          "mcl_rubber:rubberwood"},
    {"mcl_rubber:stripped_rubbertree", "mcl_rubber:rubberwood"},
    {"mcl_rubber:rubberwood",          "mcl_core:stick"},
}

for _, cut_recipe in pairs(cut_recipe) do


mcl_craftguide.register_craft({
	type   = "cutting",
	width  = 2,
	output = cut_recipe[2],
	items  = {cut_recipe[1]},
})
end

-- Alloying Guide

mcl_craftguide.register_craft_type("alloying", {
	description = "Alloying",
	icon = "mcl_technic_hv_alloy_furnace_front_active.png",
})

local alloy_recipe = {
{"mcl_core:sand",             "mcl_technic:coal_dust",        "mcl_technic:silicon_wafer"},
{"mcl_core:sand",             "mcl_technic:charcoal_dust",    "mcl_technic:silicon_wafer"},
{"mcl_core:redsand",          "mcl_technic:coal_dust",        "mcl_technic:silicon_wafer"},
{"mcl_core:redsand",          "mcl_technic:charcoal_dust",    "mcl_technic:silicon_wafer"},
{"mcl_technic:silicon_wafer", "mcl_technic:gold_dust",        "mcl_technic:doped_silicon_wafer"},
{"mcl_core:obsidian",         "mcl_buckets:bucket_empty",     "mcl_buckets:bucket_lava"},
{"mcl_core:ice",              "mcl_buckets:bucket_empty",     "mcl_buckets:bucket_water"},
{"mcl_core:snowblock",        "mcl_buckets:bucket_empty",     "mcl_buckets:bucket_water"},
{"mcl_core:snow 9",           "mcl_buckets:bucket_empty",     "mcl_buckets:bucket_water"},
{"mcl_core:iron_ingot",       "mcl_technic:coal_dust",        "mcl_technic:steel_ingot"},
{"mcl_technic:iron_dust",     "mcl_technic:coal_dust",        "mcl_technic:steel_ingot"},
{"mcl_core:iron_ingot",       "mcl_technic:charcoal_dust",    "mcl_technic:steel_ingot"},
{"mcl_technic:iron_dust",     "mcl_technic:charcoal_dust",    "mcl_technic:steel_ingot"},
{"mcl_pipeworks:oil_extract", "mcl_technic:rubber" or "mcl_rubber:rubber", "mcl_mobitems:leather"},
{"mcl_core:gold_ingot",       "mcl_nether:netherite_scrap", "mcl_nether:netherite_ingot"},
}

for _, alloy_recipe in pairs(alloy_recipe) do

mcl_craftguide.register_craft({
	type   = "alloying",
	width  = 3,
	output = alloy_recipe[3],
	items  = {alloy_recipe[1], alloy_recipe[2]},
})
end

-- Freezing Guide

mcl_craftguide.register_craft_type("freezing", {
	description = "Freezing",
	icon = "mcl_technic_hv_freezer_front_active.png",
})

mcl_craftguide.register_craft({
	type   = "freezing",
	width  = 2,
	output = "mcl_core:obsidian",
	items  = {"mcl_buckets:bucket_lava"},
})

mcl_craftguide.register_craft({
	type   = "freezing",
	width  = 2,
	output = "mcl_core:ice",
	items  = {"mcl_buckets:bucket_water"},
})

mcl_craftguide.register_craft({
	type   = "freezing",
	width  = 2,
	output = "mcl_core:snowblock",
	items  = {"mcl_buckets:bucket_river_water"},
})

-- Recycling

mcl_craftguide.register_craft_type("recycling", {
	description = "Recycling",
	icon = "mcl_technic_hv_recycler_front_active.png",
})

local recycle_recipe = {

	{"mcl_technic:hv_alloy_furnace",    "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_battery_box",      "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_compressor",       "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_electric_furnace", "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_extractor",        "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_freezer",          "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_generator",        "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_grinder",          "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_quarry",           "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_recycler",         "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_sawmill",          "mcl_nether:netherite_scrap"},
	{"mcl_technic:solar_array_hv",      "mcl_nether:netherite_scrap"},
	{"mcl_technic:tool_workshop_hv",    "mcl_nether:netherite_scrap"},
	{"mcl_technic:chainsaw_hv",         "mcl_nether:netherite_scrap"},
	{"mcl_technic:vacuum_hv",           "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_cable",          "mcl_nether:netherite_scrap"},
}

for _, recycle_recipe in pairs(recycle_recipe) do

mcl_craftguide.register_craft({
	type   = "recycling",
	width  = 2,
	output = recycle_recipe[2],
	items  = {recycle_recipe[1]},
})
end
