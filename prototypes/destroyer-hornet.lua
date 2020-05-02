if settings.startup["bumble-bots-enable-wasps"].value then

    local buzzSounds = require("__bumble-bots__/prototypes/buzz-sounds")
    local destroyerHornet = data.raw["combat-robot"]["destroyer"]
    destroyerHornet.working_sound = buzzSounds.low_buzz

    local icon_data = {
        icon = "__bumble-bots__/graphics/icons/destroyer-hornet.png",
        icon_size = 64,
        icon_mipmaps = 1
    }

    for k, v in pairs(icon_data) do
        destroyerHornet[k] = v
        data.raw["capsule"]["destroyer-capsule"][k] = v
        data.raw["corpse"]["destroyer-remnants"][k] = v
    end

    local graphics = {

        idle = {
            layers = {
                {
                    filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet.png",
                    priority = "high",
                    line_length = 32,
                    width = 132,
                    height = 116,
                    scale = 0.5,
                    y = 116,
                    frame_count = 1,
                    direction_count = 32,
                }, {
                    filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet.png",
                    priority = "high",
                    line_length = 32,
                    width = 132,
                    height = 116,
                    scale = 0.5,
                    frame_count = 1,
                    direction_count = 32,
                    apply_runtime_tint = true,
                }
            }
        },
        shadow_idle = {
            filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet-shadow.png",
            priority = "high",
            line_length = 32,
            width = 90,
            height = 70,
            scale = 0.5,
            frame_count = 1,
            direction_count = 32,
            draw_as_shadow = true,
        },
        in_motion = {
            layers = {
                {
                    filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet.png",
                    priority = "high",
                    line_length = 32,
                    width = 132,
                    height = 116,
                    scale = 0.5,
                    y = 348,
                    frame_count = 1,
                    direction_count = 32,
                }, {
                    filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet.png",
                    priority = "high",
                    line_length = 32,
                    width = 132,
                    height = 116,
                    scale = 0.5,
                    y = 232,
                    frame_count = 1,
                    direction_count = 32,
                    apply_runtime_tint = true,
                }
            }
        },
        shadow_in_motion = {
            filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet-shadow.png",
            priority = "high",
            line_length = 32,
            width = 90,
            height = 70,
            scale = 0.5,
            frame_count = 1,
            direction_count = 32,
            draw_as_shadow = true,
            y = 70,
        }
    }
    for k, v in pairs(graphics) do
        destroyerHornet[k] = v
    end

    local capsuleAnimation = {
        layers = {
            {
                filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet.png",
                flags = {"no-crop"},
                frame_count = 1,
                width = 132,
                height = 116,
                x = 2112,
                y = 348,
                priority = "high",
                scale = 0.7
            }, {
                filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet.png",
                flags = {"no-crop"},
                frame_count = 1,
                width = 132,
                height = 116,
                x = 2112,
                y = 232,
                priority = "high",
                apply_runtime_tint = true,
                scale = 0.7,
                shift = util.by_pixel(2.5, -17)
            }
        }
    }
    local capsuleShadow = {
        filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet-shadow.png",
        flags = {"no-crop"},
        frame_count = 1,
        width = 90,
        height = 70,
        x = 1440,
        y = 70,
        priority = "high",
        scale = 0.7
    }
    data.raw["projectile"]["destroyer-capsule"].animation = capsuleAnimation
    data.raw["projectile"]["destroyer-capsule"].shadow = capsuleShadow

    -- Corpses
    data.raw["corpse"]["destroyer-remnants"].animation =
        make_rotated_animation_variations_from_sheet(4, {
            filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet-corpse.png",
            line_length = 1,
            width = 132,
            height = 100,
            frame_count = 1,
            variation_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            scale = 0.5
        })
        data.raw["corpse"]["destroyer-remnants"].ground_patch = 
            {
                sheet =
                {
                    filename = "__base__/graphics/entity/biter/hr-blood-puddle-var-main.png",
                    flags = { "low-object" },
                    line_length = 4,
                    variation_count = 4,
                    frame_count = 1,
                    width = 164,
                    height = 134,
                    shift = {0, 0.125},
                    tint = {r = 0.2, g = 0.8, b = 0.1, a = 1},
                    scale = 0.3
                }
            }

end
return
