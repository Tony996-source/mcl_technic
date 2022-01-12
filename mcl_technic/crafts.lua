-- check if we have the necessary dependencies to allow actually using these materials in the crafts
local mesecons_materials = minetest.get_modpath("mesecons_materials")

-- tubes crafting recipes

minetest.register_craft({
	output = 'mcl_technic:diamond_drill_head',
	recipe = {
		{'mcl_core:iron_ingot', 'mcl_core:diamond', 'mcl_core:iron_ingot'},
		{'mcl_core:diamond',               '',                'mcl_core:diamond'},
		{'mcl_core:iron_ingot', 'mcl_core:diamond', 'mcl_core:iron_ingot'},
	}
})

minetest.register_craft({
	output = 'mcl_technic:diamond_drill_head',
	recipe = {
		{'mcl_core:diamond', 'mcl_core:iron_ingot', 'mcl_core:diamond'},
		{'mcl_core:iron_ingot',               '',                'mcl_core:iron_ingot'},
		{'mcl_core:diamond', 'mcl_core:iron_ingot', 'mcl_core:diamond'},
	}
})

local isolation = mesecons_materials and "mesecons_materials:fiber" or "mcl_technic:rubber"


minetest.register_craft({
	output = 'mcl_technic:carbon_cloth',
	recipe = {
		{'mcl_technic:graphite', 'mcl_technic:graphite', 'mcl_technic:graphite'}
	}
})

minetest.register_craft({
	output = 'mcl_technic:steel_block',
	recipe = {
		{'mcl_technic:steel_ingot', 'mcl_technic:steel_ingot', 'mcl_technic:steel_ingot'},
		{'mcl_technic:steel_ingot', 'mcl_technic:steel_ingot', 'mcl_technic:steel_ingot'},
		{'mcl_technic:steel_ingot', 'mcl_technic:steel_ingot', 'mcl_technic:steel_ingot'},
	}
})

minetest.register_craft({
    type = 'shapeless',
	output = 'mcl_technic:steel_ingot 9',
	recipe = {'mcl_technic:steel_block'},
})

minetest.register_craft({
	type = "fuel",
	recipe = "mcl_technic:oil",
	burntime = 400,
})

minetest.register_craft({
	type = "cooking",
	output = "mcl_technic:rubber 2",
	recipe = "mcl_technic:oil",
})

minetest.clear_craft({output = "mcl_core:charcoal_lump"})

minetest.register_craft({
	type = "cooking",
	output = "mcl_core:charcoal_lump 4",
	recipe = "group:tree",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "mcl_core:charcoal_lump",
	recipe = "group:wood",
	cooktime = 10,
})

minetest.register_craft({
	output = "mcl_technic:charcoalblock",
	recipe = {
		{"mcl_core:charcoal_lump", "mcl_core:charcoal_lump", "mcl_core:charcoal_lump"},
		{"mcl_core:charcoal_lump", "mcl_core:charcoal_lump", "mcl_core:charcoal_lump"},
		{"mcl_core:charcoal_lump", "mcl_core:charcoal_lump", "mcl_core:charcoal_lump"},
	}
})

minetest.register_craft({
    type = 'shapeless',
	output = 'mcl_core:charcoal_lump 9',
	recipe = {'mcl_technic:charcoalblock'},
})

minetest.register_craft({
	type = "fuel",
	recipe = "mcl_technic:charcoalblock",
	burntime = 800,
})

local saplings = {
	{"sapling", ""},
	{"darksapling",  ""},
	{"junglesapling",  ""},
	{"acaciasapling",  ""},
	{"sprucesapling",  ""},
	{"birchsapling",  ""},
}

for _, saplings in pairs(saplings) do

minetest.register_craft({
    type = "cooking",
    output = "mcl_mobitems:slimeball",
    recipe = "mcl_core:"..saplings[1],
})
end

minetest.register_craft({
	output = 'mcl_mobitems:leather',
	recipe = {
		{'mcl_mobitems:rotten_flesh', 'mcl_mobitems:rotten_flesh', 'mcl_mobitems:rotten_flesh'},
		{'mcl_mobitems:rotten_flesh', 'mcl_mobitems:rotten_flesh', 'mcl_mobitems:rotten_flesh'},
		{'mcl_mobitems:rotten_flesh', 'mcl_mobitems:rotten_flesh', 'mcl_mobitems:rotten_flesh'},
	}
})

-- Copper
if minetest.get_modpath("mcl_copper") then

minetest.register_craft({
    type = 'shapeless',
	output = 'mcl_copper:copper_ingot 9',
	recipe = {'mcl_technic:copper_block'},
})

minetest.register_craft({
	output = 'mcl_copper:copper_ingot',
	recipe = {
		{'mcl_technic:copper_nugget', 'mcl_technic:copper_nugget', 'mcl_technic:copper_nugget'},
		{'mcl_technic:copper_nugget', 'mcl_technic:copper_nugget', 'mcl_technic:copper_nugget'},
		{'mcl_technic:copper_nugget', 'mcl_technic:copper_nugget', 'mcl_technic:copper_nugget'},
	}
})

minetest.register_craft({
    type = 'shapeless',
	output = 'mcl_technic:copper_nugget 9',
	recipe = {'mcl_copper:copper_ingot'},
})


minetest.register_craft({
	type = "cooking",
	output = "mcl_copper:copper_ingot",
	recipe = "mcl_technic:copper_dust",
	cooktime = 10,
})
end

local colour = {
--     Node          dye       Description    Glass Colour
	{"white",      "white",      "White",      "white"},
	{"silver",     "grey",       "Silver",     "silver"},
	{"grey",       "dark_grey",  "Grey",       "gray"},
	{"black",      "black",      "Black",      "black"},
	{"purple",     "violet",     "Purple",     "purple"},
	{"blue",       "blue",       "Blue",       "blue"},
	{"cyan",       "cyan",       "Cyan",       "cyan"},
	{"green",      "dark_green", "Green",      "green"},
	{"lime",       "green",      "Lime",       "lime"},
	{"yellow",     "yellow",     "Yellow",     "yellow"},
	{"brown",      "brown",      "Brown",      "brown"},
	{"orange",     "orange",     "Orange",     "orange"},
	{"red",        "red",        "Red",        "red"},
	{"magenta",    "magenta",    "Magenta",    "magenta"},
	{"pink",       "pink",       "Pink",       "pink"},
    {"light_blue", "lightblue",  "Light Blue", "light_blue"},
}

for _, colour in pairs(colour) do

  minetest.register_craft({
	output = 'mcl_colorblocks:concrete_'..colour[1].." 8",
	recipe = {
		{'mcl_colorblocks:concrete_powder_'..colour[1], 'mcl_colorblocks:concrete_powder_'..colour[1], 'mcl_colorblocks:concrete_powder_'..colour[1]},
		{'mcl_colorblocks:concrete_powder_'..colour[1], 'mcl_buckets:bucket_water', 'mcl_colorblocks:concrete_powder_'..colour[1]},
		{'mcl_colorblocks:concrete_powder_'..colour[1], 'mcl_colorblocks:concrete_powder_'..colour[1], 'mcl_colorblocks:concrete_powder_'..colour[1]},
	},
	replacements = {{"mcl_buckets:bucket_water", "mcl_buckets:bucket_water"}, },
})
end
