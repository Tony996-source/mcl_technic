
local S = technic.getter

technic.register_recipe_type("freezing", { 
    description = S("Freezing") 
})

function technic.register_freezer_recipe(data)
	data.time = data.time or 5
	technic.register_recipe("freezing", data)
end

-- register recipes
local recipes = {
	{"mcl_buckets:bucket_water", { "mcl_core:ice", "mcl_buckets:bucket_empty" } },
	{"mcl_buckets:bucket_river_water", { "mcl_core:snowblock", "mcl_buckets:bucket_empty" } },
	{"mcl_buckets:bucket_lava", { "mcl_core:obsidian", "mcl_buckets:bucket_empty" } }
}


    
	for _, data in ipairs(recipes) do
		technic.register_freezer_recipe({input = {data[1]}, output = data[2]})
	end
