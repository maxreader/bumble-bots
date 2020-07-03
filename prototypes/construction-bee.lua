local buzzSounds = require("__bumble-bots__/prototypes/buzz-sounds")

local function set_construction_sprites_with_mask(robot, tint, scale)
    local constructionBee = data.raw["construction-robot"][robot]
    if not constructionBee then log("Error: Construction robot \""..robot.."\" not found.") return end
    scale = scale or 0.5
    scale = scale * bumble_bots.bot_size_multiplier

-- Main sprites
---------------------------------------------------------------------------------------------------
    local sprites = {
        layers = {
            {
                filename = "__bumble-bots__/graphics/entity/construction-bee/construction-bee.png",
                priority = "high",
                line_length = 16,
                width = 66,
                height = 76,
                frame_count = 1,
                shift = util.by_pixel(0, -4.5),
                direction_count = 16,
                scale = scale
            }, {
                filename = "__bumble-bots__/graphics/entity/construction-bee/construction-bee-mask.png",
                priority = "high",
                line_length = 16,
                width = 66,
                height = 76,
                frame_count = 1,
                shift = util.by_pixel(0, -4.5),
                direction_count = 16,
                scale = scale,
                flags = {"mask"},
                tint = tint
            }
        }
    }

    constructionBee.idle = sprites
    constructionBee.in_motion = sprites
    constructionBee.in_motion.y = 76

-- Shadows
---------------------------------------------------------------------------------------------------
    local shadows = {
        filename = "__bumble-bots__/graphics/entity/construction-bee/construction-bee-shadow.png",
        priority = "high",
        line_length = 16,
        width = 104,
        height = 49,
        frame_count = 1,
        shift = util.by_pixel(33.5, 18.75),
        direction_count = 16,
        scale = scale,
        draw_as_shadow = true
    }

    constructionBee.shadow_in_motion = shadows
    constructionBee.shadow_idle = shadows
    constructionBee.shadow_working = shadows
    constructionBee.shadow_in_motion.y = 49
    constructionBee.shadow_working.repeat_count = 2

-- Working Animation
---------------------------------------------------------------------------------------------------
    constructionBee.working = {
        layers = {
            {
                filename = "__bumble-bots__/graphics/entity/construction-bee/construction-bee-working.png",
                priority = "high",
                line_length = 2,
                width = 66,
                height = 76,
                frame_count = 2,
                shift = util.by_pixel(-0.25, -5),
                direction_count = 16,
                animation_speed = 0.3,
                scale = scale
            }, {
                filename = "__bumble-bots__/graphics/entity/construction-bee/construction-bee-working-mask.png",
                priority = "high",
                line_length = 2,
                width = 66,
                height = 76,
                frame_count = 2,
                shift = util.by_pixel(-0.25, -5),
                direction_count = 16,
                animation_speed = 0.3,
                scale = scale,
                flags = {"mask"},
                tint = tint
            }
        }
    }

-- Corpse
---------------------------------------------------------------------------------------------------
    local constructionBeeCorpse = data.raw["corpse"][robot .. "-remnants"]
    if data.raw["corpse"][robot .. "-remnants"] == nil then
        constructionBeeCorpse = table.deepcopy(
                                    data.raw["corpse"]["construction-robot-remnants"])
        constructionBeeCorpse.name = robot .. "-remnants"
        data:extend{constructionBeeCorpse}
    end

    constructionBeeCorpse.animation =
        make_rotated_animation_variations_from_sheet(4, {
            layers = {
                {
                    filename = "__bumble-bots__/graphics/entity/construction-bee/construction-bee-corpse.png",
                    line_length = 1,
                    width = 120,
                    height = 114,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    shift = util.by_pixel(1, 1),
                    scale = 0.333
                }, {
                    filename = "__bumble-bots__/graphics/entity/construction-bee/construction-bee-corpse-mask.png",
                    line_length = 1,
                    width = 120,
                    height = 114,
                    frame_count = 1,
                    variation_count = 1,
                    axially_symmetrical = false,
                    direction_count = 1,
                    shift = util.by_pixel(1, 1),
                    scale = 0.333,
                    flags = {"mask"},
                    tint = tint

                }
            }
        })

    constructionBeeCorpse.ground_patch =
        {
            sheet = {
                filename = "__base__/graphics/entity/biter/hr-blood-puddle-var-main.png",
                flags = {"low-object"},
                line_length = 4,
                variation_count = 4,
                frame_count = 1,
                width = 164,
                height = 134,
                shift = {0, 0.125},
                tint = {r = 0.2, g = 0.8, b = 0.1, a = 1},
                scale = 0.2
            }
        }

-- icons
---------------------------------------------------------------------------------------------------

    local icons = {
        {
            icon = "__bumble-bots__/graphics/icons/construction-bee.png",
            icon_size = 64
        }, {
            icon = "__bumble-bots__/graphics/icons/construction-bee-mask.png",
            icon_size = 64,
            tint = tint
        }
    }

    constructionBee.icons = icons
    data.raw["item"][robot].icons = icons
    constructionBeeCorpse.icons = icons


-- Misc.
---------------------------------------------------------------------------------------------------
    -- Sparks
    for _, spark in pairs(constructionBee.sparks) do
        spark.tint = {r = 232, g = 172, b = 19}
    end

    -- Sounds
    constructionBee.working_sound = buzzSounds.low_buzz

    -- Make bees show up on map
    if settings.startup["bumble-bots-show-bots-on-map"].value then
        local flags = constructionBee.flags
        for k, v in pairs(flags) do
            if v == "not-on-map" then table.remove(flags, k) end
        end
        constructionBee.map_color = {r = 255, g = 213, b = 25, a = 153}
    end
end

return set_construction_sprites_with_mask