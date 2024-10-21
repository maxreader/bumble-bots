if settings.startup["bumble-bots-enable-wasps"].value then

    local buzzSounds = require("__bumble-bots__/prototypes/buzz-sounds")
    local defenderWasp = data.raw["combat-robot"]["defender"]
    local item = data.raw["item"]["defender-robot"]

    defenderWasp.working_sound = buzzSounds.high_buzz

    local icon_data = {
        icons = {
            {
                icon = "__bumble-bots__/graphics/icons/defender-wasp.png",
                icon_size = 64
            }
        },
        pictures = false
    }

    for k, v in pairs(icon_data) do
        v = v or nil
        defenderWasp[k] = v
        data.raw["corpse"]["defender-remnants"][k] = v
        if item then item[k] = v end
    end

    data.raw["capsule"]["defender-capsule"].icons =
        {
            {
                icon = "__bumble-bots__/graphics/icons/defender-wasp.png",
                icon_size = 64
            }, {
                icon = "__core__/graphics/icons/tooltips/tooltip-category-thrown.png",
                icon_size = 40,
                scale = 0.5,
                shift = bumble_bots.capsule_icon_shift
            }
        }

    local graphics = {
        idle = {
            layers = {
                {
                    filename = "__bumble-bots__/graphics/entity/defender-wasp/defender-wasp.png",
                    priority = "high",
                    line_length = 16,
                    width = 100,
                    height = 100,
                    frame_count = 1,
                    direction_count = 16,
                    scale = 0.3,
                    y = 100
                }, {
                    filename = "__bumble-bots__/graphics/entity/defender-wasp/defender-wasp.png",
                    priority = "high",
                    line_length = 16,
                    width = 100,
                    height = 100,
                    frame_count = 1,
                    direction_count = 16,
                    scale = 0.3,
                    apply_runtime_tint = true
                }
            }
        },
        shadow_idle = {
            filename = "__bumble-bots__/graphics/entity/defender-wasp/defender-wasp-shadow.png",
            priority = "high",
            line_length = 16,
            width = 74,
            height = 57,
            frame_count = 1,
            direction_count = 16,
            scale = 0.3,
            draw_as_shadow = true
        },
        in_motion = {
            layers = {
                {
                    filename = "__bumble-bots__/graphics/entity/defender-wasp/defender-wasp.png",
                    priority = "high",
                    line_length = 16,
                    width = 100,
                    height = 100,
                    frame_count = 1,
                    animation_speed = 1,
                    direction_count = 16,
                    scale = 0.3,
                    y = 300
                }, {
                    filename = "__bumble-bots__/graphics/entity/defender-wasp/defender-wasp.png",
                    priority = "high",
                    line_length = 16,
                    width = 100,
                    height = 100,
                    frame_count = 1,
                    animation_speed = 1,
                    direction_count = 16,
                    scale = 0.3,
                    apply_runtime_tint = true,
                    y = 200
                }
            }
        },
        shadow_in_motion = {
            filename = "__bumble-bots__/graphics/entity/defender-wasp/defender-wasp-shadow.png",
            priority = "high",
            line_length = 16,
            width = 74,
            height = 57,
            frame_count = 1,
            animation_speed = 1,
            direction_count = 16,
            scale = 0.3,
            draw_as_shadow = true
        }
    }
    for k, v in pairs(graphics) do defenderWasp[k] = v end

    local capsuleAnimation = {
        layers = {
            {
                filename = "__bumble-bots__/graphics/entity/defender-wasp/defender-wasp.png",
                flags = {"no-crop"},
                frame_count = 1,
                width = 100,
                height = 100,
                x = 800,
                y = 300,
                priority = "high",
                scale = 0.3
            }, {
                filename = "__bumble-bots__/graphics/entity/defender-wasp/defender-wasp.png",
                flags = {"no-crop"},
                frame_count = 1,
                width = 100,
                height = 100,
                x = 800,
                y = 200,
                priority = "high",
                apply_runtime_tint = true,
                scale = 0.3
            }
        }
    }

    local capsuleShadow = {
        filename = "__bumble-bots__/graphics/entity/defender-wasp/defender-wasp-shadow.png",
        flags = {"no-crop"},
        frame_count = 1,
        width = 74,
        height = 57,
        x = (8 * 74),
        y = 57,
        priority = "high",
        scale = 0.3
    }

    data.raw["projectile"]["defender-capsule"].animation = capsuleAnimation
    data.raw["projectile"]["defender-capsule"].shadow = capsuleShadow

    -- Corpses
    data.raw["corpse"]["defender-remnants"].animation =
        make_rotated_animation_variations_from_sheet(4, {
            filename = "__bumble-bots__/graphics/entity/defender-wasp/defender-wasp-corpse.png",
            line_length = 1,
            width = 125,
            height = 98,
            frame_count = 1,
            variation_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            scale = 0.25
        })
    data.raw["corpse"]["defender-remnants"].ground_patch =
        {
            sheet = {
                filename = "__base__/graphics/entity/biter/blood-puddle-var-main.png",
                flags = {"low-object"},
                line_length = 4,
                variation_count = 4,
                frame_count = 1,
                width = 164,
                height = 134,
                shift = {0, 0},
                tint = {r = 0.2, g = 0.8, b = 0.1, a = 1},
                scale = 0.125
            }
        }
end
