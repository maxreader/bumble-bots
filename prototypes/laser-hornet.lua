-- If setting enabled, change wasp sprites
---------------------------------------------------------------------------------------------------
if settings.startup["bumble-bots-enable-wasps"].value and mods["bobwarfare"] then

    local buzzSounds = require("__bumble-bots__/prototypes/buzz-sounds")
    local laserHornet = data.raw["combat-robot"]["bob-laser-robot"]
    local item = data.raw["item"]["bob-laser-robot"]
    laserHornet.working_sound = buzzSounds.medium_buzz

    -- Icons
    local icon_data = {
        icons = {
            {
                icon = "__bumble-bots__/graphics/icons/laser-hornet.png",
                icon_size = 64
            }
        },
        pictures = false
    }

    for k, v in pairs(icon_data) do
        v = v or nil
        laserHornet[k] = v
        local remnant = data.raw["corpse"]["bob-laser-robot-remnants"]
        if not remnant then
            remnant = table.deepcopy(data.raw["corpse"]["destroyer-remnants"])
            remnant.name = "bob-laser-robot-remnants"
            data:extend{remnant}
        end
        remnant[k] = v
        if item then item[k] = v end
    end

    data.raw["capsule"]["bob-laser-robot-capsule"].icons =
        {
            {
                icon = "__bumble-bots__/graphics/icons/laser-hornet.png",
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
                    scale = 0.45,
                    frame_count = 1,
                    direction_count = 16,
                    y = 116
                }, {
                    filename = "__bumble-bots__/graphics/entity/distractor-wasp/distractor-wasp.png",
                    priority = "high",
                    line_length = 16,
                    width = 132,
                    height = 116,
                    scale = 0.45,
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
            scale = 0.45,
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
                    scale = 0.45,
                    frame_count = 1,
                    direction_count = 16,
                    y = 116 * 3
                }, {
                    filename = "__bumble-bots__/graphics/entity/distractor-wasp/distractor-wasp.png",
                    priority = "high",
                    line_length = 16,
                    width = 132,
                    height = 116,
                    scale = 0.45,
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
            scale = 0.45,
            frame_count = 1,
            direction_count = 32,
            draw_as_shadow = true,
            y = 70
        }
    }
    for k, v in pairs(graphics) do laserHornet[k] = v end

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
                scale = 0.45
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
                scale = 0.45
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
        scale = 0.45
    }

    data.raw["projectile"]["bob-laser-robot-capsule"].animation = capsuleAnimation
    data.raw["projectile"]["bob-laser-robot-capsule"].shadow = capsuleShadow

    -- Corpses
    data.raw["corpse"]["bob-laser-robot-remnants"].animation =
        make_rotated_animation_variations_from_sheet(4, {
            filename = "__bumble-bots__/graphics/entity/distractor-wasp/distractor-wasp-corpse.png",
            line_length = 1,
            width = 132,
            height = 112,
            frame_count = 1,
            variation_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            scale = 0.45
        })
    data.raw["corpse"]["bob-laser-robot-remnants"].ground_patch =
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
                scale = 0.225
            }
        }

    laserHornet.attack_parameters.ammo_type.action.action_delivery.source_offset =
        {0.15, 0}

end
