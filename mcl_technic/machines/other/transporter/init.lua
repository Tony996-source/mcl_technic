transporter = {}

transporter.cost_mult = minetest.settings:get("transporter_multiplier") or 20
transporter.two_way_mult = minetest.settings:get("transporter_two_way_multiplier") or 2

transporter.formspec =  function(bookmarks, destination, enabled, cost, twoway, onetime)
return "size[6,4]" .. default.gui_bg .. default.gui_bg_img ..
        "box[-0.09,-0.12;2.975,1.375;#00000120]" ..
        "box[-0.09,1.335;2.975,2.91;#00000120]" ..
        "box[2.95,-0.12;2.975,4.375;#00000120]" .. 
        "textarea[0.27,-0.12;2,1;;Information:;]" ..
        "textarea[0.27,0.2;4,2;;Target: X:" .. destination.x .. " Y:" .. destination.y .. " Z:" .. destination.z .. ";]" ..
        "textarea[0.27,0.45;28,1;;Cost per second:" .. cost .. "EU;]" ..
        "textarea[0.27,0.7;28,1;;Two way: " .. tostring(twoway) .. ";]" ..
        "textarea[0.27,0.95;28,1;;One time: " .. tostring(onetime) .. ";]" ..
        "checkbox[-0.02,2;twoway;Two Way;" .. tostring(twoway) .. "]" ..
        "checkbox[1.3,2;onetime;One Time;" .. tostring(onetime) .. "]" ..
        "textarea[3.325,-0.12;2,1;;Bookmarks:;]" ..
        "field[0.28,1.825;1,1;x;X;" .. destination.x .. "]" ..
        "field[1.28,1.825;1,1;y;Y;" .. destination.y .. "]" .. 
        "field[2.28,1.825;1,1;z;Z;" .. destination.z .. "]" ..
        "field[3.295,2.9;3.05,1;name;Save position (8 char max);]" ..
        "button[3,3.4;1.5,1;add;Save]" ..
        "button[0.75,2.575;1.5,1;set;Set]" ..
        "button[4.565,3.4;1.5,1;del;Delete]" ..
        "tablecolumns[text,align=left,width=5,padding=0.5;text,align=left,width=3,padding=0.5;text,align=left,width=3,padding=0.5;text,align=left,width=3,padding=0.5]" ..
        "table[3,0.13;2.85,2.25;bookmarks;" .. bookmarks .. "]" ..
        "button_exit[0.5,3.4;2,1;accept;" .. enabled .. "]"
end

transporter.updateList = function(meta)

    local bookmarks = minetest.deserialize(meta:get_string("bookmarks"))
    local destination = minetest.deserialize(meta:get_string("destination"))
    local cost = tonumber(meta:get_int("cost"))
    local twoway = meta:get_string("twoway")
    local onetime = meta:get_string("onetime")
    local enabled = "Energize!"
    if meta:get_int("enabled") == 1 then enabled = "Disable" end
    
    local list = ""
    for k,v in pairs(bookmarks) do
        if list == "" then
            list = v.name .. "," .. v.x .. "," .. v.y .. "," .. v.z
        else
            list = list .. "," .. v.name .. "," .. v.x .. "," .. v.y .. "," .. v.z
        end
    end
    meta:set_string("formspec", transporter.formspec(list, destination, enabled, cost, twoway, onetime))
end

transporter.calculateCost = function(pos, meta)
    local twmult = 1
    local dest = minetest.deserialize(meta:get_string("destination"))
    if minetest.is_yes(meta:get_string("twoway")) then twmult = 2 end
    local tempdest = {x=tonumber(dest.x), y=tonumber(dest.y), z=tonumber(dest.z)}
    local cost = (((pos.x - tempdest.x)^2) + ((pos.y - tempdest.y)^2) + ((pos.z - tempdest.z)^2))^0.5
    cost = cost * transporter.cost_mult * twmult
    cost = math.ceil(cost)
    return cost
end

transporter.toggle = function(pos, state)
    if state == true then
        minetest.swap_node(pos, {name="transporter:transporter_active"})
    else
        minetest.swap_node(pos, {name="transporter:transporter"})
    end
end

transporter.on_receive_fields = function(pos, formname, fields, sender)
    
                local meta = minetest.get_meta(pos)
                local nodename = minetest.get_node(pos).name
                local enabled = meta:get_int("enabled")

                if fields.accept and enabled == 0 then
                    
                    meta:set_int("enabled", 1)
                    meta:set_int("HV_EU_demand", meta:get_int("cost"))
                    transporter.updateList(meta)

                elseif fields.accept and enabled == 1 then

                    meta:set_int("enabled", 0)
                    meta:set_int("HV_EU_demand", 0)
                    transporter.updateList(meta)

                elseif fields.add then
    
                    if not tonumber(fields.x) or not tonumber(fields.y) or not tonumber(fields.z) or fields.name == "" or string.len(fields.name) > 8 or
                    tonumber(fields.x) > 30000 or tonumber(fields.x) < -30000 or tonumber(fields.y) > 30000 or tonumber(fields.y) < -30000 or
                    tonumber(fields.z) > 30000 or tonumber(fields.z) < -30000 then return end

                    local tmp = {x=math.floor(fields.x), y=math.floor(fields.y), z=math.floor(fields.z), name=fields.name}
                    local metatemp = {}
                    if meta:get_string("bookmarks") ~= "" then 
                        metatemp = minetest.deserialize(meta:get_string("bookmarks")) 
                    end
                    table.insert(metatemp, tmp)
                    meta:set_string("bookmarks", minetest.serialize(metatemp))
                    transporter.updateList(meta)
                    
                elseif fields.set then
                    
                    if not tonumber(fields.x) or not tonumber(fields.y) or not tonumber(fields.z) or 
                    tonumber(fields.x) > 30000 or tonumber(fields.x) < -30000 or tonumber(fields.y) > 30000 or tonumber(fields.y) < -30000 or
                    tonumber(fields.z) > 30000 or tonumber(fields.z) < -30000 then return end

                    meta:set_string("destination", minetest.serialize({x=tonumber(fields.x), y=tonumber(fields.y), z=tonumber(fields.z)}))
                    local dest = minetest.deserialize(meta:get_string("destination"))
                    meta:set_int("cost", transporter.calculateCost(pos, meta))
                    transporter.updateList(meta)

                elseif fields.del then

                    local field = meta:get_int("tablefield")
                    if field ~= 1 then
                        local metatemp = minetest.deserialize(meta:get_string("bookmarks"))
                        table.remove(metatemp, field)
                        meta:set_string("bookmarks", minetest.serialize(metatemp))
                        if field > #metatemp then
                            meta:set_int("tablefield", field - 1)
                        end
                        transporter.updateList(meta)
                    end

                elseif fields.bookmarks then

                    local tablefield = tonumber(string.match(fields.bookmarks, '%d+'))
                    if tablefield ~= 1 then
                        local metatemp = minetest.deserialize(meta:get_string("bookmarks"))
                        meta:set_string("destination", minetest.serialize(metatemp[tablefield]))
                        meta:set_int("cost", transporter.calculateCost(pos, meta))
                        meta:set_int("tablefield", tablefield)
                        transporter.updateList(meta)
                    end

                elseif fields.onetime then

                    meta:set_string("onetime", fields.onetime)
                    transporter.updateList(meta)

                elseif fields.twoway then
                    
                    meta:set_string("twoway", fields.twoway)
                    meta:set_int("cost", transporter.calculateCost(pos, meta))
                    transporter.updateList(meta)

                end
end

transporter.technic_run = function(pos, node)

    local meta = minetest.get_meta(pos)
    local eu_input = meta:get_int("HV_EU_input")
    local demand = meta:get_int("HV_EU_demand")
    local enabled = meta:get_int("enabled")
    local dest = minetest.deserialize(meta:get_string("destination"))

    if enabled == 1 and eu_input >= demand then

        if node.name == "transporter:transporter" then
            transporter.toggle(pos, true)
        end

        meta:set_string("infotext", "HV Transporter active (" .. eu_input .. "EU)")


        local objs = minetest.get_objects_inside_radius({x=pos.x, y=pos.y + 1.5, z=pos.z}, 1.5)
        
        transporter.effectsEntrance({x=pos.x, y=pos.y+1, z=pos.z})

        for k,v in pairs(objs) do
            if v:is_player() and v:get_player_name() ~= meta:get_string("last_user") then
                v:set_pos(dest)
                transporter.effectsTeleport(dest)
                meta:set_string("last_user", v:get_player_name())
                if minetest.is_yes(meta:get_string("onetime")) then meta:set_int("enabled", 0) meta:set_int("HV_EU_demand", 0) end
            else
                if meta:get_string("last_user") ~= "" then
                    meta:set_string("last_user", "")
                end
            end
        end
        
        if not minetest.is_yes(meta:get_string("twoway")) then return end
        

        local objs_dest = minetest.get_objects_inside_radius({x=dest.x, y=dest.y, z=dest.z}, 1.5)

        transporter.effectsExit(dest)

        for k,v in pairs(objs_dest) do
            if v:is_player() and v:get_player_name() ~= meta:get_string("last_user") then
                v:set_pos({x=pos.x, y=pos.y + 1, z=pos.z})
                transporter.effectsTeleport({x=pos.x, y=pos.y + 1, z=pos.z})
                meta:set_string("last_user", v:get_player_name())
                if minetest.is_yes(meta:get_string("onetime")) then meta:set_int("enabled", 0) meta:set_int("HV_EU_demand", 0) end
            else
                if meta:get_string("last_user") ~= "" then
                    meta:set_string("last_user", "")
                end
            end
        end

    elseif enabled == 1 and eu_input < demand then

        if node.name == "transporter:transporter_active" then
            transporter.toggle(pos, false)
        end
        meta:set_string("infotext", "HV Transporter inactive (" .. demand .. "EU required)")

    else

        if node.name == "transporter:transporter_active" then
            transporter.toggle(pos, false)
        end
        meta:set_string("infotext", "HV Transporter disabled")

    end

end

transporter.effectsEntrance = function(pos)
    minetest.add_particlespawner({
        amount = 32,
        time = 4,
        minpos = {x=pos.x-0.5, y=pos.y-0.5, z=pos.z-0.5},
        maxpos = {x=pos.x+0.5, y=pos.y-0.5, z=pos.z+0.5},
        minvel = {x=0, y=1, z=0},
        maxvel = {x=0, y=4, z=0},
        minacc = {x=0, y=0.1, z=0},
        maxacc = {x=0, y=0.5, z=0},
        minexptime = 1,
        maxexptime = 1,
        minsize = 3,
        maxsize = 4,
        collisiondetection = false,
        collision_removal = false,
        glow = 14,
        vertical = true,
        texture = "transporter_particle_idle.png",
     })
end

transporter.effectsExit = function(pos)
    minetest.add_particlespawner({
        amount = 32,
        time = 4,
        minpos = {x=pos.x-0.5, y=pos.y+5, z=pos.z-0.5},
        maxpos = {x=pos.x+0.5, y=pos.y+4, z=pos.z+0.5},
        minvel = {x=0, y=-1, z=0},
        maxvel = {x=0, y=-4, z=0},
        minacc = {x=0, y=-0.1, z=0},
        maxacc = {x=0, y=-0.5, z=0},
        minexptime = 1,
        maxexptime = 1,
        minsize = 3,
        maxsize = 4,
        collisiondetection = false,
        collision_removal = false,
        glow = 14,
        vertical = true,
        texture = "transporter_particle_idle.png",
     })
end

transporter.effectsTeleport = function(pos)
    minetest.sound_play("transporter_transport", {pos=pos, gain=0.3, max_hear_distance=16})
    minetest.add_particlespawner({
        amount = 64,
        time = 0.5,
        minpos = {x=pos.x-0.5, y=pos.y, z=pos.z-0.5},
        maxpos = {x=pos.x+0.5, y=pos.y+2, z=pos.z+0.5},
        minvel = {x=-5, y=-2, z=-5},
        maxvel = {x=5, y=2, z=5},
        minacc = {x=0, y=9.8, z=0},
        maxacc = {x=0, y=9.8, z=0},
        minexptime = 1,
        maxexptime = 3,
        minsize = 3,
        maxsize = 8,
        collisiondetection = false,
        collision_removal = false,
        glow = 14,
        vertical = true,
        texture = "transporter_particle_idle.png",
     })

end

minetest.register_node("transporter:transporter", {
    description = "HV Transporter",
    tiles = {"transporter_top.png", "transporter_bottom.png", "transporter_side.png"},
    is_ground_content = false,
    groups = {oddly_breakable_by_hand=3, technic_machine=1, technic_hv=1},
    connect_sides = {"bottom"},

    on_construct = function(pos)
                local meta = minetest.get_meta(pos)
                meta:set_string("bookmarks", minetest.serialize({{name="Name", x="X", y="Y", z="Z"}}))
                meta:set_string("destination", minetest.serialize({x=0, y=0, z=0}))
                meta:set_int("enabled", 0)
                meta:set_string("twoway", "false")
                meta:set_string("onetime", "false")
                meta:set_int("cost", transporter.calculateCost(pos, meta))
                transporter.updateList(meta)
    end,

    on_destruct = transporter.on_destruct,
    technic_run = transporter.technic_run,
    on_receive_fields = transporter.on_receive_fields,
})

minetest.register_node("transporter:transporter_active", {
    description = "HV Transporter active",
    tiles = {"transporter_top_active.png", "transporter_bottom.png", "transporter_side.png"},
    light_source = 14,
    is_ground_content = false,
    groups = {oddly_breakable_by_hand=3, technic_machine=1, technic_hv=1, not_in_creative_inventory=1},
    connect_sides = {"bottom"},
    drop = "transporter:transporter",
    on_destruct = transporter.on_destruct,
    technic_run = transporter.technic_run,
    on_receive_fields = transporter.on_receive_fields,
})

minetest.register_craftitem("transporter:floppy", 
    {
        description = "Transporter Storage",
        inventory_image = "transporter_floppy.png",
        stack_max = 1,
        range = 2.0,

        on_use = function(itemstack, user, pointed_thing)
            if pointed_thing.type == "node" and minetest.get_node(pointed_thing.under).name == "transporter:transporter" then
                local meta = minetest.get_meta(pointed_thing.under)
                itemstack:replace("transporter:floppy_filled")
                local itemmeta = itemstack:get_meta()
                itemmeta:set_string("bookmarks", meta:get_string("bookmarks"))
                return itemstack
            end
        end,
})

minetest.register_craftitem("transporter:floppy_filled", 
    {
        description = "Filled Transporter Storage",
        inventory_image = "transporter_floppy_filled.png",
        groups = {not_in_creative_inventory = 1},
        stack_max = 1,
        range = 2.0,

         on_use = function(itemstack, user, pointed_thing)
             if pointed_thing.type == "node" and minetest.get_node(pointed_thing.under).name == "transporter:transporter" then
                local meta = minetest.get_meta(pointed_thing.under)
                local itemmeta = itemstack:get_meta()
                local nodebooks = minetest.deserialize(meta:get_string("bookmarks"))
                local itembooks = minetest.deserialize(itemmeta:get_string("bookmarks"))
                table.remove(itembooks, 1)
                for k,v in pairs(itembooks) do
                    table.insert(nodebooks, v)
                end
                meta:set_string("bookmarks", minetest.serialize(nodebooks))
                transporter.updateList(meta)
             end
         end,

})

minetest.register_craft({
	output = "transporter:transporter",
	recipe = {
		{"technic:copper_coil","technic:blue_energy_crystal","technic:copper_coil"},
		{"technic:control_logic_unit", "technic:machine_casing", "technic:control_logic_unit"},
		{"technic:composite_plate","technic:hv_cable","technic:composite_plate"},
	}
})

minetest.register_craft({
	output = "transporter:floppy",
	recipe = {
		{"technic:stainless_steel_ingot"},
		{"homedecor:plastic_sheeting"},
		{"default:paper"},
	}
})

if minetest.get_modpath("technic") then
	technic.register_machine("HV", "transporter:transporter", technic.receiver)
end

if minetest.get_modpath("technic") then
	technic.register_machine("HV", "transporter:transporter_active", technic.receiver)
end
