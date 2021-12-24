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

minetest.register_craft({
	type = "cooking",
	output = "mcl_core:charcoal_lump",
	recipe = "group:wood",
	cooktime = 10,
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
