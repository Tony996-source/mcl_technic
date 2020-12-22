if pipeworks.enable_sand_tube then
	pipeworks.register_tube("pipeworks:sand_tube", {
		description = "Vacuuming Pneumatic Tube Segment",
		inventory_image = "pipeworks_sand_tube_inv.png",
		short = "pipeworks_sand_tube_short.png",
		noctr = {"pipeworks_sand_tube_noctr.png"},
		plain = {"pipeworks_sand_tube_plain.png"},
		ends  = {"pipeworks_sand_tube_end.png"},
		_mcl_blast_resistance = 0.3,
	    _mcl_hardness = 0.3,
		node_def = {groups = {vacuum_tube = 1}},
	})

	minetest.register_craft( {
		output = "pipeworks:sand_tube_1 2",
		recipe = {
			{"pipeworks:plastic_sheet", "pipeworks:plastic_sheet", "pipeworks:plastic_sheet"},
			{"group:sand",                 "group:sand",                 "group:sand"},
			{"pipeworks:plastic_sheet", "pipeworks:plastic_sheet", "pipeworks:plastic_sheet"}
		},
	})

	minetest.register_craft( {
		output = "pipeworks:sand_tube_1",
		recipe = {
			{"group:sand", "pipeworks:tube_1", "group:sand"},
		},
	})
end

if pipeworks.enable_mese_sand_tube then
	pipeworks.register_tube("pipeworks:mese_sand_tube", {
			description = "Adjustable Vacuuming Pneumatic Tube Segment",
			inventory_image = "pipeworks_mese_sand_tube_inv.png",
			short = "pipeworks_mese_sand_tube_short.png",
			noctr = {"pipeworks_mese_sand_tube_noctr.png"},
			plain = {"pipeworks_mese_sand_tube_plain.png"},
			ends  = {"pipeworks_mese_sand_tube_end.png"},
			_mcl_blast_resistance = 0.3,
	    _mcl_hardness = 0.3,
			node_def = {
				groups = {vacuum_tube = 1},
				on_construct = function(pos)
					local meta = minetest.get_meta(pos)
					meta:set_int("dist", 0)
					meta:set_string("formspec", "size[2.1,0.8]"..
							"image[0,0;1,1;pipeworks_mese_sand_tube_inv.png]"..
							"field[1.3,0.4;1,1;dist;radius;${dist}]"
							)
					meta:set_string("infotext", "Adjustable Vacuuming Pneumatic Tube Segment")
				
				end,
				
				on_receive_fields = function(pos,formname,fields,sender)
					if not pipeworks.may_configure(pos, sender) then return end
					local meta = minetest.get_meta(pos)
					local dist = tonumber(fields.dist)
					if dist then
						dist = math.max(0, dist)
						dist = math.min(8, dist)
						meta:set_int("dist", dist)
						meta:set_string("infotext", ("Adjustable Vacuuming Pneumatic Tube Segment (%dm)"):format(dist))
					end
				end,
			},
	})

	minetest.register_craft( {
		output = "pipeworks:mese_sand_tube_1 2",
		recipe = {
			{"pipeworks:plastic_sheet", "pipeworks:plastic_sheet", "pipeworks:plastic_sheet" },
			{"group:sand",                 "mesecons:redstone",       "group:sand" },
			{"pipeworks:plastic_sheet", "pipeworks:plastic_sheet", "pipeworks:plastic_sheet" }
		},
	})

	minetest.register_craft( {
		type = "shapeless",
		output = "pipeworks:mese_sand_tube_1",
		recipe = {
			"pipeworks:sand_tube_1",
			"mesecons:redstone",
			"mesecons:redstone",
			"mesecons:redstone",
			"mesecons:redstone"
		},
	})
end

local function vacuum(pos, radius)
	radius = radius + 0.5
	for _, object in pairs(minetest.get_objects_inside_radius(pos, math.sqrt(3) * radius)) do
		local lua_entity = object:get_luaentity()
		if not object:is_player() and lua_entity and lua_entity.name == "__builtin:item" then
			local obj_pos = object:get_pos()
			local minpos = vector.subtract(pos, radius)
			local maxpos = vector.add(pos, radius)
			if  obj_pos.x >= minpos.x and obj_pos.x <= maxpos.x
			and obj_pos.y >= minpos.y and obj_pos.y <= maxpos.y
			and obj_pos.z >= minpos.z and obj_pos.z <= maxpos.z then
				if lua_entity.itemstring ~= "" then
					pipeworks.tube_inject_item(pos, pos, vector.new(0, 0, 0), lua_entity.itemstring)
					lua_entity.itemstring = ""
				end
				object:remove()
			end
		end
	end
end

minetest.register_abm({nodenames = {"group:vacuum_tube"},
	interval = 1,
	chance = 1,
	label = "Vacuum tubes",
	action = function(pos, node, active_object_count, active_object_count_wider)
		if node.name:find("pipeworks:sand_tube") then
			vacuum(pos, 2)
		else
			local radius = minetest.get_meta(pos):get_int("dist")
			vacuum(pos, radius)
		end
	end
})
