if settings.startup["bumble-bots-enable-wasps"].value then
    
    local defenderWasp = data.raw["combat-robot"]["defender"]
    local icon_data = {
        icon = "__bumble-bots__/graphics/icons/defender-wasp.png",
        icon_size = 64,
        icon_mipmaps = 1
    }

    for k, v in pairs(icon_data) do
        defenderWasp[k] = v
        data.raw["capsule"]["defender-capsule"][k] = v
    end

    local propertiesToChange = {
        width = 100,
        height = 100,
        scale = 0.3,
        filename = "__bumble-bots__/graphics/entity/defender-wasp/defender-wasp.png"
    }

    defenderWasp.idle.layers[1].y = 100
    defenderWasp.idle.layers[2].y=0
    defenderWasp.in_motion.layers[1].y=300
    defenderWasp.in_motion.layers[2].y=200
    
    defenderWasp.idle.layers[1].hr_version.y = 100
    defenderWasp.idle.layers[2].hr_version.y=0
    defenderWasp.in_motion.layers[1].hr_version.y=300
    defenderWasp.in_motion.layers[2].hr_version.y=200

    for k,v in pairs(propertiesToChange) do
        defenderWasp.idle.layers[1][k] = v
        defenderWasp.idle.layers[2][k] = v
        defenderWasp.in_motion.layers[1][k] = v
        defenderWasp.in_motion.layers[2][k] = v
        
        defenderWasp.idle.layers[1].hr_version[k] = v
        defenderWasp.idle.layers[2].hr_version[k] = v
        defenderWasp.in_motion.layers[1].hr_version[k] = v
        defenderWasp.in_motion.layers[2].hr_version[k] = v
    end

    defenderWasp.idle.layers[2].shift = util.by_pixel(0, 0.5)
    defenderWasp.in_motion.layers[2].shift = util.by_pixel(0, 0.5)
    defenderWasp.idle.layers[2].hr_version.shift = util.by_pixel(0, 0.5)
    defenderWasp.in_motion.layers[2].hr_version.shift = util.by_pixel(0, 0.5)


    local shadowPropertiesToChange = {
        filename = "__bumble-bots__/graphics/entity/defender-wasp/defender-wasp-shadow.png",
        width = 74,
        height = 57,
        scale = 0.3
    }

    for k,v in pairs(shadowPropertiesToChange) do
        
        defenderWasp.shadow_idle[k]=v
        defenderWasp.shadow_in_motion[k]=v
        defenderWasp.shadow_idle.hr_version[k]=v
        defenderWasp.shadow_in_motion.hr_version[k]=v
    end
    defenderWasp.shadow_in_motion.hr_version.y=57

    local capsuleAnimation = {
        layers = {
            {
            filename = "__bumble-bots__/graphics/entity/defender-wasp/defender-wasp.png",
            flags = { "no-crop" },
            frame_count = 1,
            width = 100,
            height = 100,
            x = 800,
            y = 300,
            priority = "high",
            scale = 0.3
            },
            {
            filename = "__bumble-bots__/graphics/entity/defender-wasp/defender-wasp.png",
            flags = { "no-crop" },
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
        flags = { "no-crop" },
        frame_count = 1,
        width = 74,
        height = 57,
        x = (8*74),
        y = 57,
        priority = "high",
        scale = 0.3
    }

    data.raw["projectile"]["defender-capsule"].animation = capsuleAnimation
    data.raw["projectile"]["defender-capsule"].shadow = capsuleShadow
end