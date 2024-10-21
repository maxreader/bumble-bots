-- Changes logistic robots into Logistic Bees
---------------------------------------------------------------------------------------------------
local buzzSounds = require("__bumble-bots__/prototypes/buzz-sounds")

local function set_logistic_sprites_with_mask(robot, tint, scale)
    local logisticBee = data.raw["logistic-robot"][robot]
    if not logisticBee then
        log("Error: Logistic robot \"" .. robot .. "\" not found.")
        return
    end

    scale = scale or 0.5
    scale = scale * bumble_bots.bot_size_multiplier

    -- Main sprites
    ---------------------------------------------------------------------------------------------------
    local sprites = {
        layers = {
            {
                filename = "__bumble-bots__/graphics/entity/logistic-bee/logistic-bee.png",
                priority = "high",
                line_length = 16,
                width = 80,
                height = 84,
                frame_count = 1,
                shift = util.by_pixel(0, -3),
                direction_count = 16,
                scale = scale
            }, {
                filename = "__bumble-bots__/graphics/entity/logistic-bee/logistic-bee-mask.png",
                priority = "high",
                line_length = 16,
                width = 80,
                height = 84,
                frame_count = 1,
                shift = util.by_pixel(0, -3),
                direction_count = 16,
                scale = scale,
                flags = {"mask"},
                tint = tint
            }
        }
    }

    -- Shadows
    ---------------------------------------------------------------------------------------------------
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
        scale = scale,
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

    -- Corpse
    ---------------------------------------------------------------------------------------------------
    local logisticBeeCorpse = data.raw["corpse"][robot .. "-remnants"]
    if data.raw["corpse"][robot .. "-remnants"] == nil then
        logisticBeeCorpse = table.deepcopy(data.raw["corpse"]["logistic-robot-remnants"])
        logisticBeeCorpse.name = robot .. "-remnants"
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
                scale = 0.8 * scale
            }, {
                filename = "__bumble-bots__/graphics/entity/logistic-bee/logistic-bee-corpse-mask.png",
                line_length = 1,
                width = 116,
                height = 114,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(1, 1),
                scale = 0.8 * scale,
                flags = {"mask"},
                tint = tint

            }
        }
    })
    logisticBeeCorpse.ground_patch = {
        sheet = {
            filename = "__base__/graphics/entity/biter/blood-puddle-var-main.png",
            flags = {"low-object"},
            line_length = 4,
            variation_count = 4,
            frame_count = 1,
            width = 164,
            height = 134,
            shift = {0, 0},
            tint = {r = 0.2, g = 0.8, b = 0.1, a = 0.6},
            scale = 0.4 * scale
        }
    }

    -- icons
    ---------------------------------------------------------------------------------------------------
    local icons = {
        {
            icon = "__bumble-bots__/graphics/icons/logistic-bee-icon.png",
            icon_size = 64
        }, {
            icon = "__bumble-bots__/graphics/icons/logistic-bee-icon-mask.png",
            icon_size = 64,
            tint = tint
        }
    }

    logisticBee.icons = icons
    data.raw["item"][robot].icons = icons
    data.raw["item"][robot].pictures = nil
    logisticBeeCorpse.icons = icons

    -- Misc.
    ---------------------------------------------------------------------------------------------------
    -- Sounds
    logisticBee.working_sound = buzzSounds.medium_buzz

    -- Changing cargo center
    logisticBee.cargo_centered = {0.0, -0.75}

    -- Make bees show up on map
    if settings.startup["bumble-bots-show-bots-on-map"].value then
        local flags = logisticBee.flags
        for k, v in pairs(flags) do if v == "not-on-map" then table.remove(flags, k) end end
        logisticBee.map_color = {
            r = 1,
            g = 1,
            b = 0.2,
            a = 0.6
        }
    end

end

return set_logistic_sprites_with_mask
