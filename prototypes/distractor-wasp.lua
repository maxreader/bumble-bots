-- If setting enabled, change wasp sprites
---------------------------------------------------------------------------------------------------
if settings.startup["bumble-bots-enable-wasps"].value then

    local buzzSounds = require("__bumble-bots__/prototypes/buzz-sounds")
    local distractorWasp = data.raw["combat-robot"]["distractor"]
    local item = data.raw["item"]["distractor-robot"]
    distractorWasp.working_sound = buzzSounds.medium_buzz

    -- Icons
    local icon_data = {
        icons = {
            {
                icon = "__bumble-bots__/graphics/icons/distractor-wasp.png",
                icon_size = 64
            }
        },
        pictures = false
    }

    for k, v in pairs(icon_data) do
        v = v or nil
        distractorWasp[k] = v
        data.raw["corpse"]["distractor-remnants"][k] = v
        if item then item[k] = v end
    end

    data.raw["capsule"]["distractor-capsule"].icons =
        {
            {
                icon = "__bumble-bots__/graphics/icons/distractor-wasp.png",
                icon_size = 64
            }, {
                icon = "__core__/graphics/icons/tooltips/tooltip-category-thrown.png",
                icon_size = 40,
                scale = 0.5,
                shift = bumble_bots.capsule_icon_shift
            }
        }

    -- Main Graphics
    local graphics = {
        idle = {
            layers = {
                {
                    filename = "__bumble-bots__/graphics/entity/distractor-wasp/distractor-wasp.png",
                    priority = "high",
                    line_length = 16,
                    width = 132,
                    height = 116,
                    scale = 0.3,
                    frame_count = 1,
                    direction_count = 16,
                    y = 116
                }, {
                    filename = "__bumble-bots__/graphics/entity/distractor-wasp/distractor-wasp.png",
                    priority = "high",
                    line_length = 16,
                    width = 132,
                    height = 116,
                    scale = 0.3,
                    frame_count = 1,
                    direction_count = 16,
                    apply_runtime_tint = true
                }
            }
        },
        shadow_idle = {
            filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet-shadow.png",
            priority = "high",
            line_length = 32,
            width = 90,
            height = 70,
            scale = 0.3,
            frame_count = 1,
            direction_count = 32,
            draw_as_shadow = true
        },
        in_motion = {
            layers = {
                {
                    filename = "__bumble-bots__/graphics/entity/distractor-wasp/distractor-wasp.png",
                    priority = "high",
                    line_length = 16,
                    width = 132,
                    height = 116,
                    scale = 0.3,
                    frame_count = 1,
                    direction_count = 16,
                    y = 116 * 3
                }, {
                    filename = "__bumble-bots__/graphics/entity/distractor-wasp/distractor-wasp.png",
                    priority = "high",
                    line_length = 16,
                    width = 132,
                    height = 116,
                    scale = 0.3,
                    frame_count = 1,
                    direction_count = 16,
                    apply_runtime_tint = true,
                    y = 116 * 2
                }
            }
        },
        shadow_in_motion = {
            filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet-shadow.png",
            priority = "high",
            line_length = 32,
            width = 90,
            height = 70,
            scale = 0.3,
            frame_count = 1,
            direction_count = 32,
            draw_as_shadow = true,
            y = 70
        }
    }
    for k, v in pairs(graphics) do distractorWasp[k] = v end

    -- Capsule
    local capsuleAnimation = {
        layers = {
            {
                filename = "__bumble-bots__/graphics/entity/distractor-wasp/distractor-wasp.png",
                flags = {"no-crop"},
                frame_count = 1,
                width = 132,
                height = 116,
                x = 132 * 8,
                y = 116 * 3,
                priority = "high",
                scale = 0.3
            }, {
                filename = "__bumble-bots__/graphics/entity/distractor-wasp/distractor-wasp.png",
                flags = {"no-crop"},
                frame_count = 1,
                width = 132,
                height = 116,
                x = 132 * 8,
                y = 116 * 2,
                priority = "high",
                apply_runtime_tint = true,
                scale = 0.3
            }
        }
    }

    local capsuleShadow = {
        filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet-shadow.png",
        flags = {"no-crop"},
        frame_count = 1,
        width = 74,
        height = 57,
        x = (8 * 74),
        y = 57,
        priority = "high",
        scale = 0.3
    }

    data.raw["projectile"]["distractor-capsule"].animation = capsuleAnimation
    data.raw["projectile"]["distractor-capsule"].shadow = capsuleShadow

    -- Corpses
    data.raw["corpse"]["distractor-remnants"].animation =
        make_rotated_animation_variations_from_sheet(4, {
            filename = "__bumble-bots__/graphics/entity/distractor-wasp/distractor-wasp-corpse.png",
            line_length = 1,
            width = 132,
            height = 112,
            frame_count = 1,
            variation_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            scale = 0.3
        })
    data.raw["corpse"]["distractor-remnants"].ground_patch =
        {
            sheet = {
                filename = "__base__/graphics/entity/biter/blood-puddle-var-main.png",
                flags = {"low-object"},
                line_length = 4,
                variation_count = 4,
                frame_count = 1,
                width = 164,
                height = 134,
                shift = {0, 0.125},
                tint = {r = 0.2, g = 0.8, b = 0.1, a = 1},
                scale = 0.15
            }
        }

end
