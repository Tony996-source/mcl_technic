--
-- Item Overrides
--

minetest.override_item("mcl_flowers:tallgrass", {
groups = {handy=1, shearsy=1, flammable=3, fire_encouragement=60, fire_flammability=100, attached_node=1,plant=1, place_flowerlike=2, non_mycelium_plant=1, dig_by_water=1, destroy_by_lava_flow=1, deco_block=1, flora=1},
})

minetest.override_item("mcl_flowers:fern", {
groups = {handy=1, shearsy=1, flammable=3, fire_encouragement=60, fire_flammability=100, attached_node=1,plant=1, place_flowerlike=2, non_mycelium_plant=1, dig_by_water=1, destroy_by_lava_flow=1, deco_block=1, flora=1},
})

minetest.override_item("mcl_flowers:peony", {
groups = {flower = 1, place_flowerlike = 1, dig_immediate = 3, flora=1},
})

minetest.override_item("mcl_flowers:rose_bush", {
groups = {flower = 1, place_flowerlike = 1, dig_immediate = 3, flora=1},
})

minetest.override_item("mcl_flowers:lilac", {
groups = {flower = 1, place_flowerlike = 1, dig_immediate = 3, flora=1},
})

minetest.override_item("mcl_flowers:sunflower", {
groups = {flower = 1, place_flowerlike = 1, dig_immediate = 3, flora=1},
})

minetest.override_item("mcl_flowers:double_grass", {
groups = {flower = 1, place_flowerlike = 1, dig_immediate = 3, flora=1},
})

minetest.override_item("mcl_flowers:double_fern", {
groups = {flower = 1, place_flowerlike = 1, dig_immediate = 3, flora=1},
})

---------------------------------------------------
---------------- Berry Bush -----------------------
---------------------------------------------------

minetest.override_item("mcl_farming:sweet_berry_bush_0", {
    tiles = {"sweet_berry_bush_stage0.png"},
})
minetest.override_item("mcl_farming:sweet_berry_bush_1", {
    tiles = {"sweet_berry_bush_stage1.png"},
})
minetest.override_item("mcl_farming:sweet_berry_bush_2", {
    tiles = {"sweet_berry_bush_stage2.png"},
})
minetest.override_item("mcl_farming:sweet_berry_bush_3", {
    tiles = {"sweet_berry_bush_stage3.png"},
})
minetest.override_item("mcl_farming:sweet_berry", {
    inventory_image = "sweet_berries.png",
})

