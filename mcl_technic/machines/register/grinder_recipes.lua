
local S = mcl_technic.getter

mcl_technic.register_recipe_type("grinding", { description = S("Grinding") })

function mcl_technic.register_grinder_recipe(data)
	data.time = data.time or 3
	mcl_technic.register_recipe("grinding", data)
end

local recipes = {
	-- Dusts
	{"mcl_core:coal_lump",         "mcl_technic:coal_dust 2"},
	{"mcl_core:charcoal_lump",     "mcl_technic:charcoal_dust 2"},
	{"mcl_core:stone_with_iron",   "mcl_technic:iron_dust 2"},
	{"mcl_core:stone_with_gold",   "mcl_technic:gold_dust 2"},
	{"mcl_core:gold_ingot",        "mcl_technic:gold_dust"},
	{"mcl_core:iron_ingot",        "mcl_technic:iron_dust"},
	{"mcl_copper:raw_copper",      "mcl_technic:copper_dust 2"},
    {"mcl_copper:copper_ingot",    "mcl_technic:copper_dust"},
    {"mcl_core:diamond",           "mcl_technic:diamond_dust 2"},
	
-- Trees
    {"mcl_core:tree",                   "mcl_technic:sawdust 8"},
    {"mcl_core:jungletree",             "mcl_technic:sawdust 8"},
    {"mcl_core:birchtree",              "mcl_technic:sawdust 8"},
    {"mcl_core:sprucetree",             "mcl_technic:sawdust 8"},
    {"mcl_core:acaciatree",             "mcl_technic:sawdust 8"},
    {"mcl_core:darktree",               "mcl_technic:sawdust 8"},
    {"mcl_core:wood",                   "mcl_technic:sawdust 2"},
    {"mcl_core:junglewood",             "mcl_technic:sawdust 2"},
    {"mcl_core:sprucewood",             "mcl_technic:sawdust 2"},
    {"mcl_core:birchwood",              "mcl_technic:sawdust 2"},
    {"mcl_core:darkwood",               "mcl_technic:sawdust 2"},
    {"mcl_core:acaciawood",             "mcl_technic:sawdust 2"},
    {"mcl_core:stripped_acacia",        "mcl_technic:sawdust 8"},
    {"mcl_core:stripped_birch",         "mcl_technic:sawdust 8"},
    {"mcl_core:stripped_dark_oak",      "mcl_technic:sawdust 8"},
    {"mcl_core:stripped_jungle",        "mcl_technic:sawdust 8"},
    {"mcl_core:stripped_oak",           "mcl_technic:sawdust 8"},
    {"mcl_core:stripped_spruce",        "mcl_technic:sawdust 8"},
    {"mcl_core:stripped_acacia_bark",   "mcl_technic:sawdust 8"},
    {"mcl_core:stripped_birch_bark",    "mcl_technic:sawdust 8"},
    {"mcl_core:stripped_dark_oak_bark", "mcl_technic:sawdust 8"},
    {"mcl_core:stripped_jungle_bark",   "mcl_technic:sawdust 8"},
    {"mcl_core:stripped_oak_bark",      "mcl_technic:sawdust 8"},
    {"mcl_core:stripped_spruce_bark",   "mcl_technic:sawdust 8"},
    {"mcl_core:acacia_bark",            "mcl_technic:sawdust 8"},
    {"mcl_core:birch_bark",             "mcl_technic:sawdust 8"},
    {"mcl_core:dark_oak_bark",          "mcl_technic:sawdust 8"},
    {"mcl_core:jungle_bark",            "mcl_technic:sawdust 8"},
    {"mcl_core:oak_bark",               "mcl_technic:sawdust 8"},
    {"mcl_core:spruce_bark",            "mcl_technic:sawdust 8"},
    
	-- Other
	{"mcl_mobitems:bone",          "mcl_dye:white 2"},
	{"mcl_core:cobble",            "mcl_core:gravel"},
	{"mcl_core:gravel",            "mcl_core:sand"},
	{"mcl_core:sandstone",         "mcl_core:sand"},
	{"mcl_core:redsandstone",      "mcl_core:redsand"},
    {"mcl_core:stone",             "mcl_technic:stone_dust"},
    {"mcl_technic:steel_ingot",    "mcl_technic:steel_dust"},
    {"mcl_core:iron_nugget",       "mcl_technic:lowgrade_iron_dust"},
    {"mcl_core:gold_nugget",       "mcl_technic:lowgrade_gold_dust"},
}

if minetest.get_modpath("mcl_raw_ores") then
	table.insert(recipes, {"mcl_raw_ores:raw_gold",   "mcl_technic:gold_dust 2"})
	table.insert(recipes, {"mcl_raw_ores:raw_iron",   "mcl_technic:iron_dust 2"})
end

if minetest.get_modpath("mcl_deepslate") then
	table.insert(recipes, {"mcl_deepslate:deepslate",   "mcl_deepslate:deepslate_cobbled"})
end

for _, data in pairs(recipes) do
	mcl_technic.register_grinder_recipe({input = {data[1]}, output = data[2]})
end

-- dusts
local function register_dust(name, ingot)
	local lname = string.lower(name)
	lname = string.gsub(lname, ' ', '_')
	minetest.register_craftitem("mcl_technic:"..lname.."_dust", {
		description = S("%s Dust"):format(S(name)),
		inventory_image = "mcl_technic_"..lname.."_dust.png",
	})
	if ingot then
		minetest.register_craft({
			type = "cooking",
			recipe = "mcl_technic:"..lname.."_dust",
			output = ingot,
		})
		mcl_technic.register_grinder_recipe({ input = {ingot}, output = "mcl_technic:"..lname.."_dust" })
	end
end

-- Sorted alphibeticaly
register_dust("Coal",            nil)
register_dust("Charcoal",        nil)
register_dust("Gold",            "mcl_core:gold_ingot")
register_dust("Stone",           "mcl_core:stone")
register_dust("Iron",            "mcl_core:iron_ingot")
register_dust("Diamond",         "mcl_core:diamond")
register_dust("Copper",          "mcl_copper:copper_ingot")

minetest.register_craft({
	type = "fuel",
	recipe = "mcl_technic:coal_dust",
	burntime = 50,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mcl_technic:charcoal_dust",
	burntime = 50,
})

minetest.register_craftitem("mcl_technic:lowgrade_gold_dust", {
	description = ("Lowgrade Gold Dust"),
	inventory_image = "mcl_technic_lowgrade_gold_dust.png",
})
	
minetest.register_craft({
	type = "cooking",
	recipe = "mcl_technic:lowgrade_gold_dust",
	output = "mcl_core:gold_nugget",
})

minetest.register_craftitem("mcl_technic:lowgrade_iron_dust", {
	description = ("Lowgrade Iron Dust"),
	inventory_image = "mcl_technic_lowgrade_iron_dust.png",
})

minetest.register_craftitem("mcl_technic:lowgrade_copper_dust", {
	description = ("Lowgrade Copper Dust"),
	inventory_image = "mcl_technic_lowgrade_copper_dust.png",
})
	
minetest.register_craft({
	type = "cooking",
	recipe = "mcl_technic:lowgrade_iron_dust",
	output = "mcl_core:iron_nugget",
})

minetest.register_craft({
	type = "cooking",
	recipe = "mcl_technic:lowgrade_copper_dust",
	output = "mcl_technic:copper_nugget",
})


