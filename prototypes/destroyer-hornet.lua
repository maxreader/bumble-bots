if settings.startup["bumble-bots-enable-wasps"].value then
    
    local destroyerHornet = data.raw["combat-robot"]["destroyer"]
    local icon_data = {
        icon = "__bumble-bots__/graphics/icons/destroyer-hornet.png",
        icon_size = 64,
        icon_mipmaps = 1
    }

    for k, v in pairs(icon_data) do
        destroyerHornet[k] = v
        data.raw["capsule"]["destroyer-capsule"][k] = v
    end

    local propertiesToChange = {
        width = 132,
        height = 116,
        scale = 0.5,
        filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet.png"
    }
    destroyerHornet.idle.layers[1].y = 116
    destroyerHornet.idle.layers[2].y = 0
    destroyerHornet.in_motion.layers[1].y = 348
    destroyerHornet.in_motion.layers[2].y = 232

    destroyerHornet.idle.layers[1].hr_version.y = 116
    destroyerHornet.idle.layers[2].hr_version.y = 0
    destroyerHornet.in_motion.layers[1].hr_version.y = 348
    destroyerHornet.in_motion.layers[2].hr_version.y = 232

    for k,v in pairs(propertiesToChange) do
        
        destroyerHornet.idle.layers[1][k] = v
        destroyerHornet.idle.layers[2][k] = v
        destroyerHornet.in_motion.layers[1][k] = v
        destroyerHornet.in_motion.layers[2][k] = v
        
        destroyerHornet.idle.layers[1].hr_version[k] = v
        destroyerHornet.idle.layers[2].hr_version[k] = v
        destroyerHornet.in_motion.layers[1].hr_version[k] = v
        destroyerHornet.in_motion.layers[2].hr_version[k] = v
    end
    
    destroyerHornet.idle.layers[2].shift = util.by_pixel(2.5, -17)
    destroyerHornet.in_motion.layers[2].shift = util.by_pixel(2.5, -17)
    destroyerHornet.idle.layers[2].hr_version.shift = util.by_pixel(2.5, -17)
    destroyerHornet.in_motion.layers[2].hr_version.shift = util.by_pixel(2.5, -17)


    local shadowPropertiesToChange = {
        filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet-shadow.png",
        width = 90,
        height = 70,
        scale = 0.7
    }

    for k,v in pairs(shadowPropertiesToChange) do
        
        destroyerHornet.shadow_idle[k]=v
        destroyerHornet.shadow_in_motion[k]=v
        destroyerHornet.shadow_idle.hr_version[k]=v
        destroyerHornet.shadow_in_motion.hr_version[k]=v
    end
    destroyerHornet.shadow_in_motion.hr_version.y=shadowPropertiesToChange.height

    local capsuleAnimation = {
        layers = {
            {
            filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet.png",
            flags = { "no-crop" },
            frame_count = 1,
            width = 132,
            height = 116,
            x=2112,
            y=348,
            priority = "high",
            scale = 0.7
            },
            {
            filename = "__bumble-bots__/graphics/entity/destroyer-hornet/destroyer-hornet.png",
            flags = { "no-crop" },
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
        flags = { "no-crop" },
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

end
return