
local S = mcl_technic.getter

mcl_technic.register_recipe_type("extracting", { description = S("Extracting") })

function mcl_technic.register_extractor_recipe(data)
	data.time = data.time or 4
	mcl_technic.register_recipe("extracting", data)
end

	-- register recipes with the same crafting ratios as `dye` provides
	local dye_recipes = {
	{"mcl_technic:coal_dust",       "mcl_dye:black 4"},
	{"mcl_core:cactus",             "mcl_dye:dark_green 4"},
	{"mcl_core:reeds",              "mcl_dye:dark_green 4"},
	{"mcl_flowers:blue_orchid",     "mcl_dye:blue 4"},
	{"mcl_flowers:oxeye_daisy",     "mcl_dye:white 4"},
	{"mcl_flowers:dandelion",       "mcl_dye:yellow 4"},
	{"mcl_flowers:tulip",           "mcl_dye:orange 4"},
	{"mcl_flowers:poppy",           "mcl_dye:red 4"},
	{"mcl_flowers:allium",          "mcl_dye:magenta 4"},
	{"mcl_flowers:tulip_pink",      "mcl_dye:pink 4"},
	{"mcl_flowers:tulip_red",       "mcl_dye:red 4"},
	{"mcl_flowers:tulip_white",     "mcl_dye:white 4"},
	{"mcl_flowers:tulip_orange",    "mcl_dye:orange 4"},
	{"mcl_end:chorus_fruit_popped", "mcl_dye:purple 6"},
	{"mcl_technic:oil",             "mcl_pipeworks:oil_extract 6"},
	{"mcl_technic:sawdust 2",       "mcl_technic:oil"},
	{"mcl_technic:stone_dust 5",    "mcl_technic:lowgrade_iron_dust"},
	{"mcl_core:sand 5",             "mcl_technic:lowgrade_gold_dust"},
	{"mcl_core:redsand 5",          "mcl_technic:lowgrade_copper_dust"},
	{"mcl_core:dirt 4",             "mcl_mobitems:bone"},
	{"mcl_farming:beetroot_item",   "mcl_dye:red 4"},
	{"mcl_flowers:rose_bush",       "mcl_dye:red 8"},
	{"mcl_flowers:peony",           "mcl_dye:pink 8"},
	{"mcl_flowers:lilac",           "mcl_dye:magenta 8"},
	{"mcl_flowers:sunflower",       "mcl_dye:yellow 8"},
}
    
	for _, data in ipairs(dye_recipes) do
		mcl_technic.register_extractor_recipe({input = {data[1]}, output = data[2]})
	end
