
-- Grinding Guide

mcl_craftguide.register_craft_type("grinding", {
	description = "Grinding",
	icon = "mcl_technic_hv_grinder_front_active.png",
})

local grind_recipe = {
	-- Dusts
	{"mcl_core:coal_lump",         "mcl_technic:coal_dust"},
	{"mcl_core:charcoal_lump",     "mcl_technic:charcoal_dust"},
	{"mcl_core:stone_with_iron",   "mcl_technic:iron_dust"},
	{"mcl_core:stone_with_gold",   "mcl_technic:gold_dust"},
	{"mcl_core:gold_ingot",        "mcl_technic:gold_dust"},
	{"mcl_core:iron_ingot",        "mcl_technic:iron_dust"},
	{"mcl_raw_ores:raw_gold",      "mcl_technic:gold_dust"},
	{"mcl_raw_ores:raw_iron",      "mcl_technic:iron_dust"},
	{"mcl_copper:copper_ingot",    "mcl_technic:copper_dust"},
	{"mcl_copper:raw_copper",      "mcl_technic:copper_dust"},
	
-- Trees
    {"mcl_core:tree",              "mcl_technic:sawdust"},
    {"mcl_core:jungletree",        "mcl_technic:sawdust"},
    {"mcl_core:birchtree",         "mcl_technic:sawdust"},
    {"mcl_core:sprucetree",        "mcl_technic:sawdust"},
    {"mcl_core:acaciatree",        "mcl_technic:sawdust"},
    {"mcl_core:darktree",          "mcl_technic:sawdust"},
    {"mcl_core:wood",              "mcl_technic:sawdust"},
    {"mcl_core:junglewood",        "mcl_technic:sawdust"},
    {"mcl_core:sprucewood",        "mcl_technic:sawdust"},
    {"mcl_core:birchwood",         "mcl_technic:sawdust"},
    {"mcl_core:darkwood",          "mcl_technic:sawdust"},
    {"mcl_core:acaciawood",        "mcl_technic:sawdust"},
    
	-- Other
	{"mcl_mobitems:bone",          "mcl_dye:white"},
	{"mcl_core:cobble",            "mcl_core:gravel"},
	{"mcl_core:gravel",            "mcl_core:sand"},
	{"mcl_core:sandstone",         "mcl_core:sand"},
	{"mcl_core:redsandstone",      "mcl_core:redsand"},
    {"mcl_core:stone",             "mcl_technic:stone_dust"},
    {"mcl_core:iron_nugget",       "mcl_technic:lowgrade_iron_dust"},
    {"mcl_core:gold_nugget",       "mcl_technic:lowgrade_gold_dust"},
    {"mcl_technic:copper_nugget",  "mcl_technic:lowgrade_copper_dust"},
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
	{"mcl_core:snowblock",        "mcl_core:ice"},
	{"mcl_core:sand",             "mcl_core:sandstone"},
	{"mcl_core:redsand",          "mcl_core:redsandstone"},
	{"mcl_technic:coal_dust",     "mcl_technic:graphite"},
	{"mcl_technic:charcoal_dust", "mcl_technic:graphite"},
	{"mcl_technic:carbon_cloth",  "mcl_technic:carbon_plate"},
    {"mcl_core:coalblock",        "mcl_core:diamond"},
    {"mcl_core:charcoal_lump",    "mcl_technic:charcoalblock"},
    {"mcl_technic:sawdust",       "mcl_core:paper"},
    {"mcl_core:coal_lump",        "mcl_core:coalblock"},
    {"mcl_core:gold_ingot",       "mcl_core:goldblock"},
    {"mcl_core:iron_ingot",       "mcl_core:ironblock"},
    {"mcl_copper:copper_ingot",   "mcl_copper:block"},
    {"mcl_copper:raw_copper",     "mcl_copper:block_raw"},
    {"mcl_core:diamond",          "mcl_core:diamondblock"},
    {"mcl_technic:steel_ingot",   "mcl_technic:steel_block"},
    {"mcl_dye:blue",              "mcl_core:lapisblock"},
    {"mcl_core:emerald",          "mcl_core:emeraldblock"},
    {"mcl_mobitems:rotten_flesh", "mcl_mobitems:leather"},
    {"mcl_technic:copper_nugget", "mcl_copper:copper_ingot"},
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
	{"mcl_technic:coal_dust",       "mcl_dye:black"},
	{"mcl_core:cactus",             "mcl_dye:dark_green"},
	{"mcl_core:reeds",              "mcl_dye:dark_green"},
	{"mcl_flowers:blue_orchid",     "mcl_dye:blue"},
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
	{"mcl_technic:oil",             "mcl_pipeworks:oil_extract"},
	{"mcl_technic:sawdust",         "mcl_technic:oil"},
	{"mcl_technic:stone_dust",      "mcl_technic:lowgrade_iron_dust"},
	{"mcl_core:sand",               "mcl_technic:lowgrade_gold_dust"},
	{"mcl_core:redsand",            "mcl_technic:lowgrade_copper_dust"},
	{"mcl_core:dirt",               "mcl_mobitems:bone"},
	{"mcl_farming:beetroot_item",   "mcl_dye:red"},
	{"mcl_flowers:rose_bush",       "mcl_dye:red"},
	{"mcl_flowers:peony",           "mcl_dye:pink"},
	{"mcl_flowers:lilac",           "mcl_dye:magenta"},
	{"mcl_flowers:sunflower",       "mcl_dye:yellow"},
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
	    {"mcl_core:tree",                 "mcl_core:wood"},
		{"mcl_core:jungletree",           "mcl_core:junglewood"},
        {"mcl_core:birchtree",            "mcl_core:birchwood"},
        {"mcl_core:sprucetree",           "mcl_core:sprucewood"},
        {"mcl_core:acaciatree",           "mcl_core:acaciawood"},
        {"mcl_core:darktree",             "mcl_core:darkwood"},
        {"mcl_core:wood",                 "mcl_core:stick"},
		{"mcl_core:junglewood",           "mcl_core:stick"},
        {"mcl_core:birchwood",            "mcl_core:stick"},
        {"mcl_core:sprucewood",           "mcl_core:stick"},
        {"mcl_core:acaciawood",           "mcl_core:stick"},
        {"mcl_core:darkwood",             "mcl_core:stick"},
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
	    {"mcl_core:sand", "mcl_technic:coal_dust", "mcl_technic:silicon_wafer"},
	    {"mcl_core:sand", "mcl_technic:charcoal_dust", "mcl_technic:silicon_wafer"},
        {"mcl_core:redsand", "mcl_technic:coal_dust", "mcl_technic:silicon_wafer"},
        {"mcl_core:redsand", "mcl_technic:charcoal_dust", "mcl_technic:silicon_wafer"},
	    {"mcl_technic:silicon_wafer", "mcl_technic:gold_dust", "mcl_technic:doped_silicon_wafer"},
	    {"mcl_core:obsidian", "mcl_buckets:bucket_empty", "mcl_buckets:bucket_lava"},
	    {"mcl_core:ice", "mcl_buckets:bucket_empty", "mcl_buckets:bucket_water"},
	    {"mcl_core:snowblock", "mcl_buckets:bucket_empty", "mcl_buckets:bucket_river_water"},
	    {"mcl_core:snow", "mcl_buckets:bucket_empty", "mcl_buckets:bucket_water"},
	    {"mcl_core:iron_ingot", "mcl_technic:coal_dust", "mcl_technic:steel_ingot"},
	    {"mcl_technic:iron_dust", "mcl_technic:coal_dust", "mcl_technic:steel_ingot"},
	    {"mcl_pipeworks:oil_extract", "mcl_technic:rubber", "mcl_mobitems:leather"},
	    {"mcl_core:gold_ingot", "mcl_nether:netherite_scrap", "mcl_nether:netherite_ingot"},
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
	{"mcl_technic:hv_freezer",          "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_extractor",        "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_generator",        "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_grinder",          "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_quarry",           "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_recycler",         "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_sawmill",          "mcl_nether:netherite_scrap"},
	{"mcl_technic:hv_solar_array",      "mcl_nether:netherite_scrap"},
	{"mcl_technic:tool_workshop_hv",    "mcl_nether:netherite_scrap"},
	{"mcl_technic:chainsaw_hv",         "mcl_nether:netherite_scrap"},
	{"mcl_technic:vacuum_hv",           "mcl_nether:netherite_scrap"},

}

for _, recycle_recipe in pairs(recycle_recipe) do

mcl_craftguide.register_craft({
	type   = "recycling",
	width  = 2,
	output = recycle_recipe[2],
	items  = {recycle_recipe[1]},
})
end
