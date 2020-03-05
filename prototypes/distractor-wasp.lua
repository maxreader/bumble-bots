
-- If setting enabled, change wasp sprites
---------------------------------------------------------------------------------------------------
if settings.startup["bumble-bots-enable-wasps"].value then
    
    local distractorWasp = data.raw["combat-robot"]["distractor"]

    -- Icons
    local icon_data = {
        icon = "__bumble-bots__/graphics/icons/distractor-wasp.png",
        icon_size = 64,
        icon_mipmaps = 1
    }

    for k, v in pairs(icon_data) do
        distractorWasp[k] = v
        data.raw["capsule"]["distractor-capsule"][k] = v
    end


    -- Main Graphics
    local propertiesToChange = {
        width = 132,
        height = 116,
        scale = 0.3,
        filename = "__bumble-bots__/graphics/entity/distractor-wasp/distractor-wasp.png"
    }

    distractorWasp.idle.layers[1].y = propertiesToChange.height*1
    distractorWasp.idle.layers[2].y=0
    distractorWasp.in_motion.layers[1].y=propertiesToChange.height*3
    distractorWasp.in_motion.layers[2].y=propertiesToChange.height*2
    
    distractorWasp.idle.layers[1].hr_version.y = propertiesToChange.height*1
    distractorWasp.idle.layers[2].hr_version.y=0
    distractorWasp.in_motion.layers[1].hr_version.y=propertiesToChange.height*3
    distractorWasp.in_motion.layers[2].hr_version.y=propertiesToChange.height*2

    for k,v in pairs(propertiesToChange) do
        distractorWasp.idle.layers[1][k] = v
        distractorWasp.idle.layers[2][k] = v
        distractorWasp.in_motion.layers[1][k] = v
        distractorWasp.in_motion.layers[2][k] = v
        
        distractorWasp.idle.layers[1].hr_version[k] = v
        distractorWasp.idle.layers[2].hr_version[k] = v
        distractorWasp.in_motion.layers[1].hr_version[k] = v
        distractorWasp.in_motion.layers[2].hr_version[k] = v
    end

    distractorWasp.idle.layers[2].shift = util.by_pixel(0, -2.5)
    distractorWasp.in_motion.layers[2].shift = util.by_pixel(0, -2.5)
    distractorWasp.idle.layers[2].hr_version.shift = util.by_pixel(0, -2.5)
    distractorWasp.in_motion.layers[2].hr_version.shift = util.by_pixel(0, -2.5)


    --[[local shadowPropertiesToChange = {
        filename = "__bumble-bots__/graphics/entity/distractor-wasp/distractor-wasp-shadow.png",
        width = 74,
        height = 57,
        scale = 0.3
    }

    for k,v in pairs(shadowPropertiesToChange) do
        
        distractorWasp.shadow_idle[k]=v
        distractorWasp.shadow_in_motion[k]=v
        distractorWasp.shadow_idle.hr_version[k]=v
        distractorWasp.shadow_in_motion.hr_version[k]=v
    end
    distractorWasp.shadow_in_motion.hr_version.y=57]]


    -- Capsule
    local capsuleAnimation = {
        layers = {
            {
            filename = "__bumble-bots__/graphics/entity/distractor-wasp/distractor-wasp.png",
            flags = { "no-crop" },
            frame_count = 1,
            width = 132,
            height = 116,
            x = 132*8,
            y = 116*3,
            priority = "high",
            scale = 0.3
            },
            {
            filename = "__bumble-bots__/graphics/entity/distractor-wasp/distractor-wasp.png",
            flags = { "no-crop" },
            frame_count = 1,
            width = 132,
            height = 116,
            x = 132*8,
            y = 116*2,
            priority = "high",
            apply_runtime_tint = true,
            scale = 0.3
            }
        }
    }

    local capsuleShadow = {
        filename = "__bumble-bots__/graphics/entity/distractor-wasp/distractor-wasp-shadow.png",
        flags = { "no-crop" },
        frame_count = 1,
        width = 74,
        height = 57,
        x = (8*74),
        y = 57,
        priority = "high",
        scale = 0.3
    }

    data.raw["projectile"]["distractor-capsule"].animation = capsuleAnimation
    --data.raw["projectile"]["distractor-capsule"].shadow = capsuleShadow
end