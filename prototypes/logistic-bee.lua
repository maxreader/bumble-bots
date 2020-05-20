-- Changes logistic robots into Logistic Bees
---------------------------------------------------------------------------------------------------
local buzzSounds = require("__bumble-bots__/prototypes/buzz-sounds")
local mods = mods

local function set_logistic_sprites(robot, color)
    local logisticBee = data.raw["logistic-robot"][robot]
    local sprites = {
        filename = "__bumble-bots__/graphics/entity/logistic-bee/logistic-bee-"..color.."/logistic-bee-"..color..".png",
        priority = "high",
        line_length = 16,
        width = 80,
        height = 84,
        frame_count = 1,
        shift = util.by_pixel(0, -3),
        direction_count = 16,
        scale = 0.5
    }
    local shadows = {
        filename = "__bumble-bots__/graphics/entity/logistic-bee/logistic-bee-shadow.png",
        priority = "high",
        line_length = 16,
        width = 115,
        height = 57,
        frame_count = 1,
        shift = util.by_pixel(31.75, 19.75),
        direction_count = 16,
        y = 57,
        scale = 0.5,
        draw_as_shadow = true
    }

    logisticBee.idle = sprites
    logisticBee.idle_with_cargo = sprites
    logisticBee.in_motion = sprites
    logisticBee.in_motion_with_cargo = sprites

    logisticBee.idle.y = sprites.height
    logisticBee.in_motion_with_cargo.y = sprites.height * 2
    logisticBee.in_motion.y = sprites.height * 3

    logisticBee.shadow_idle = shadows
    logisticBee.shadow_idle_with_cargo = shadows
    logisticBee.shadow_in_motion = shadows
    logisticBee.shadow_in_motion_with_cargo = shadows

    logisticBee.shadow_idle.y = shadows.height
    logisticBee.shadow_in_motion_with_cargo.y = shadows.height * 2
    logisticBee.shadow_in_motion.y = shadows.height * 3


    -- Corpses
    local logisticBeeCorpse = data.raw["corpse"][robot.."-remnants"]
    if data.raw["corpse"][robot.."-remnants"] == nil then
        logisticBeeCorpse = table.deepcopy(data.raw["corpse"]["logistic-robot-remnants"])
        logisticBeeCorpse.name = robot.."-remnants"
        data:extend{logisticBeeCorpse}
    end

    logisticBeeCorpse.animation = make_rotated_animation_variations_from_sheet(4, {
        filename = "__bumble-bots__/graphics/entity/logistic-bee/logistic-bee-"..color.."/logistic-bee-corpse-"..color..".png",
        line_length = 1,
        width = 116,
        height = 114,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(1, 1),
        scale = 0.4
    })
    logisticBeeCorpse.ground_patch = {
        sheet = {
            filename = "__base__/graphics/entity/biter/hr-blood-puddle-var-main.png",
            flags = {"low-object"},
            line_length = 4,
            variation_count = 4,
            frame_count = 1,
            width = 164,
            height = 134,
            shift = {0, 0},
            tint = {r = 0.2, g = 0.8, b = 0.1, a = 1},
            scale = 0.2
        }
    }
    
    local icon_data = {
        icon = "__bumble-bots__/graphics/icons/logistic-bee-icon-"..color..".png",
        icon_size = 64,
        icon_mipmaps = 1
    }
    
    for k, v in pairs(icon_data) do
        logisticBee[k] = v
        data.raw["item"][robot][k] = v
        logisticBeeCorpse[k] = v
    end
    
    -- Sounds
    logisticBee.working_sound = buzzSounds.medium_buzz

    -- Changing cargo center
    logisticBee.cargo_centered = {0.0, -0.75}

    --Make bees show up on map
    if settings.startup["bumble-bots-show-bots-on-map"].value then
        local flags = logisticBee.flags
        for k,v in pairs(flags) do
            if v == "not-on-map" then
                table.remove(flags,k)
            end
        end
        logisticBee.map_color = {r=1,g=1,b=0.2,a=0.6}
    end

end

local function set_logistic_sprites_with_mask(robot, tint)
    local logisticBee = data.raw["logistic-robot"][robot]
    local sprites = {
        layers = {
        {
            filename = "__bumble-bots__/graphics/entity/logistic-bee/logistic-bee-old.png",
            priority = "high",
            line_length = 16,
            width = 80,
            height = 84,
            frame_count = 1,
            shift = util.by_pixel(0, -3),
            direction_count = 16,
            scale = 0.5,
        },{
            filename = "__bumble-bots__/graphics/entity/logistic-bee/logistic-bee-mask.png",
            priority = "high",
            line_length = 16,
            width = 80,
            height = 84,
            frame_count = 1,
            shift = util.by_pixel(0, -3),
            direction_count = 16,
            scale = 0.5,
            flags = {"mask"},
            tint = tint,
        },
    }}

    local shadows = {
        filename = "__bumble-bots__/graphics/entity/logistic-bee/logistic-bee-shadow.png",
        priority = "high",
        line_length = 16,
        width = 115,
        height = 57,
        frame_count = 1,
        shift = util.by_pixel(31.75, 19.75),
        direction_count = 16,
        y = 57,
        scale = 0.5,
        draw_as_shadow = true
    }

    logisticBee.idle = sprites
    logisticBee.idle_with_cargo = sprites
    logisticBee.in_motion = sprites
    logisticBee.in_motion_with_cargo = sprites

    logisticBee.idle.y = sprites.layers[1].height
    logisticBee.in_motion_with_cargo.y = sprites.layers[1].height * 2
    logisticBee.in_motion.y = sprites.layers[1].height * 3

    logisticBee.shadow_idle = shadows
    logisticBee.shadow_idle_with_cargo = shadows
    logisticBee.shadow_in_motion = shadows
    logisticBee.shadow_in_motion_with_cargo = shadows

    logisticBee.shadow_idle.y = shadows.height
    logisticBee.shadow_in_motion_with_cargo.y = shadows.height * 2
    logisticBee.shadow_in_motion.y = shadows.height * 3

    -- Corpses
    local logisticBeeCorpse = data.raw["corpse"][robot.."-remnants"]
    if data.raw["corpse"][robot.."-remnants"] == nil then
        logisticBeeCorpse = table.deepcopy(data.raw["corpse"]["logistic-robot-remnants"])
        logisticBeeCorpse.name = robot.."-remnants"
        data:extend{logisticBeeCorpse}
    end

    logisticBeeCorpse.animation = make_rotated_animation_variations_from_sheet(4, {
        layers = {
            {
                filename = "__bumble-bots__/graphics/entity/logistic-bee/logistic-bee-corpse.png",
                line_length = 1,
                width = 116,
                height = 114,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(1, 1),
                scale = 0.4
            },{
                filename = "__bumble-bots__/graphics/entity/logistic-bee/logistic-bee-corpse-mask.png",
                line_length = 1,
                width = 116,
                height = 114,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(1, 1),
                scale = 0.4,
                flags = {"mask"},
                tint = tint,

            }
        }     
    })
    logisticBeeCorpse.ground_patch = {
        sheet = {
            filename = "__base__/graphics/entity/biter/hr-blood-puddle-var-main.png",
            flags = {"low-object"},
            line_length = 4,
            variation_count = 4,
            frame_count = 1,
            width = 164,
            height = 134,
            shift = {0, 0},
            tint = {r = 0.2, g = 0.8, b = 0.1, a = 0.6},
            scale = 0.2
        }
    }
    
    local icons = {
            {
                icon = "__bumble-bots__/graphics/icons/logistic-bee-icon.png",
                icon_size = 64,
            },{
                icon = "__bumble-bots__/graphics/icons/logistic-bee-icon-mask.png",
                icon_size = 64,
                tint = tint
            },
    }
    
    logisticBee.icons = icons
    data.raw["item"][robot].icons = icons
    logisticBeeCorpse.icons = icons
    
    -- Sounds
    logisticBee.working_sound = buzzSounds.medium_buzz

    -- Changing cargo center
    logisticBee.cargo_centered = {0.0, -0.75}

    --Make bees show up on map
    if settings.startup["bumble-bots-show-bots-on-map"].value then
        local flags = logisticBee.flags
        for k,v in pairs(flags) do
            if v == "not-on-map" then
                table.remove(flags,k)
            end
        end
        logisticBee.map_color = {r=1,g=1,b=0.2,a=0.6}
    end

end

set_logistic_sprites_with_mask("logistic-robot", {r = 1, g = 0.72, b = 0, a = 0.85})





if mods["boblogistics"] then
    local mapping = {
        ["logistic-robot"] = {1, 0.8, 0.06, 0.9},
        ["bob-logistic-robot-2"] = {1, 0.06, 0.06, 0.9},
        ["bob-logistic-robot-3"] = {0.06, 0.2, 1, 0.9},
        ["bob-logistic-robot-4"] = {0.545, 0.06, 1, 0.9},
        ["bob-logistic-robot-5"] = {0.06, 1, 0.14, 0.9},
    }
    for robot, color in pairs(mapping) do
        set_logistic_sprites_with_mask(robot, color)
    end
end




if mods["pyindustry"] then
    set_logistic_sprites("py-logistic-robot-01", "red")
end

if mods["pyhightech"] then
    set_logistic_sprites("logistic-robot-ht", "aqua")
end


