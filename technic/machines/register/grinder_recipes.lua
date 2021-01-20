
local S = technic.getter

technic.register_recipe_type("grinding", { description = S("Grinding") })

function technic.register_grinder_recipe(data)
	data.time = data.time or 3
	technic.register_recipe("grinding", data)
end

local recipes = {
	-- Dusts
	{"mcl_core:coal_lump",         "technic:coal_dust 2"},
	{"mcl_core:stone_with_iron",   "technic:iron_dust 2"},
	{"mcl_core:stone_with_gold",   "technic:gold_dust 2"},
	{"mcl_core:gold_ingot",        "technic:gold_dust"},
	{"mcl_core:iron_ingot",        "technic:iron_dust"},
	
-- Trees
    {"mcl_core:tree",              "technic:sawdust 4"},
    {"mcl_core:jungletree",        "technic:sawdust 4"},
    {"mcl_core:birchtree",         "technic:sawdust 4"},
    {"mcl_core:sprucetree",        "technic:sawdust 4"},
    {"mcl_core:acaciatree",        "technic:sawdust 4"},
    {"mcl_core:darktree",          "technic:sawdust 4"},
    {"mcl_core:wood",              "technic:sawdust 2"},
    {"mcl_core:junglewood",        "technic:sawdust 2"},
    {"mcl_core:sprucewood",        "technic:sawdust 2"},
    {"mcl_core:birchwood",         "technic:sawdust 2"},
    {"mcl_core:darkwood",          "technic:sawdust 2"},
    {"mcl_core:acaciawood",        "technic:sawdust 2"},
    
	-- Other
	{"mcl_mobitems:bone",          "mcl_dye:white 2"},
	{"mcl_core:cobble",            "mcl_core:gravel"},
	{"mcl_core:gravel",            "mcl_core:sand"},
	{"mcl_core:sandstone",         "mcl_core:sand 2"},
	{"mcl_core:redsandstone",      "mcl_core:redsand 2"},
    {"mcl_core:stone",             "technic:stone_dust"},
    {"technic:steel_ingot",        "technic:steel_dust"},
    {"technic:copper_ingot",       "technic:copper_dust"},
    {"technic:mineral_copper",     "technic:copper_dust 2"},
    {"mcl_core:iron_nugget",       "technic:lowgrade_iron_dust"},
    {"mcl_core:gold_nugget",       "technic:lowgrade_gold_dust"},
    {"technic:iron_nugget",        "technic:lowgrade_copper_dust"},
}

for _, data in pairs(recipes) do
	technic.register_grinder_recipe({input = {data[1]}, output = data[2]})
end

-- dusts
local function register_dust(name, ingot)
	local lname = string.lower(name)
	lname = string.gsub(lname, ' ', '_')
	minetest.register_craftitem("technic:"..lname.."_dust", {
		description = S("%s Dust"):format(S(name)),
		inventory_image = "technic_"..lname.."_dust.png",
	})
	if ingot then
		minetest.register_craft({
			type = "cooking",
			recipe = "technic:"..lname.."_dust",
			output = ingot,
		})
		technic.register_grinder_recipe({ input = {ingot}, output = "technic:"..lname.."_dust" })
	end
end

-- Sorted alphibeticaly
register_dust("Coal",            nil)
register_dust("Gold",            "mcl_core:gold_ingot")
register_dust("Stone",           "mcl_core:stone")
register_dust("Iron",            "mcl_core:iron_ingot")

minetest.register_craft({
	type = "fuel",
	recipe = "technic:coal_dust",
	burntime = 50,
})

minetest.register_craftitem("technic:lowgrade_gold_dust", {
	description = ("Lowgrade Gold Dust"),
	inventory_image = "technic_lowgrade_gold_dust.png",
})
	
minetest.register_craft({
	type = "cooking",
	recipe = "technic:lowgrade_gold_dust",
	output = "mcl_core:gold_nugget",
})

minetest.register_craftitem("technic:lowgrade_iron_dust", {
	description = ("Lowgrade Iron Dust"),
	inventory_image = "technic_lowgrade_iron_dust.png",
})

minetest.register_craftitem("technic:lowgrade_copper_dust", {
	description = ("Lowgrade Copper Dust"),
	inventory_image = "technic_lowgrade_copper_dust.png",
})
	
minetest.register_craft({
	type = "cooking",
	recipe = "technic:lowgrade_iron_dust",
	output = "mcl_core:iron_nugget",
})

minetest.register_craft({
	type = "cooking",
	output = "technic:copper_nugget",
	recipe = "technic:lowgrade_copper_dust",
	cooktime = 10,
})
