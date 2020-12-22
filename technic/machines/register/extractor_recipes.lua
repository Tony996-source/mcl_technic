
local S = technic.getter

technic.register_recipe_type("extracting", { description = S("Extracting") })

function technic.register_extractor_recipe(data)
	data.time = data.time or 4
	technic.register_recipe("extracting", data)
end

	-- register recipes with the same crafting ratios as `dye` provides
	local dye_recipes = {
	{"technic:coal_dust", "mcl_dye:black 4"},
	{"mcl_core:cactus", "mcl_dye:green 4"},
	{"mcl_flowers:blue_orchid", "mcl_dye:blue 4"},
	{"mcl_flowers:oxeye_daisy", "mcl_dye:white 4"},
	{"mcl_flowers:dandelion", "mcl_dye:yellow 4"},
	{"mcl_flowers:tulip", "mcl_dye:orange 4"},
	{"mcl_flowers:poppy", "mcl_dye:red 4"},
	{"mcl_flowers:allium", "mcl_dye:purple 4"},
	{"mcl_flowers:tulip_pink", "mcl_dye:pink 4"},
	{"mcl_flowers:tulip_red", "mcl_dye:red 4"},
	{"mcl_flowers:tulip_white", "mcl_dye:white 4"},
	{"mcl_flowers:tulip_orange", "mcl_dye:orange 4"},
	{"mcl_end:chorus_fruit_popped", "mcl_dye:purple 6"},
	{"technic:oil", "pipeworks:oil_extract 6"},
	{"technic:sawdust", "technic:oil 2"},
	{"technic:stone_dust 5", "technic:lowgrade_iron_dust"},
	{"mcl_core:gravel 5", "technic:lowgrade_gold_dust"},
}
    
	for _, data in ipairs(dye_recipes) do
		technic.register_extractor_recipe({input = {data[1]}, output = data[2]})
	end
