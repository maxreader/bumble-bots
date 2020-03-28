-- Changes logistic robots into Logistic Bees
---------------------------------------------------------------------------------------------------
local logisticBee = data.raw["logistic-robot"]["logistic-robot"]
local logisticBeeCorpse = data.raw["corpse"]["logistic-robot-remnants"]

-- Icons
local icon_data = {
    icon = "__bumble-bots__/graphics/icons/logistic-bee.png",
    icon_size = 64,
    icon_mipmaps = 1
}

for k, v in pairs(icon_data) do
    logisticBee[k] = v
    data.raw["item"]["logistic-robot"][k] = v
    logisticBeeCorpse[k] = v
end

-- Main Sprites
local sprites = {
    filename = "__bumble-bots__/graphics/entity/logistic-bee/logistic-bee.png",
    priority = "high",
    line_length = 16,
    width = 80,
    height = 84,
    frame_count = 1,
    shift = util.by_pixel(0, -3),
    direction_count = 16,
    y = 84,
    scale = 0.5
}

logisticBee.idle = sprites
logisticBee.idle_with_cargo = sprites
logisticBee.in_motion = sprites
logisticBee.in_motion_with_cargo = sprites

logisticBee.idle.y = sprites.height
logisticBee.in_motion_with_cargo.y = sprites.height * 2
logisticBee.in_motion.y = sprites.height * 3

-- Shadows
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

logisticBee.shadow_idle = shadows
logisticBee.shadow_idle_with_cargo = shadows
logisticBee.shadow_in_motion = shadows
logisticBee.shadow_in_motion_with_cargo = shadows

logisticBee.shadow_idle.y = shadows.height
logisticBee.shadow_in_motion_with_cargo.y = shadows.height * 2
logisticBee.shadow_in_motion.y = shadows.height * 3



-- Sounds
local beeVolume = 0.375 * settings.startup["bumble-bots-bee-volume"].value

logisticBee.working_sound = {
    sound = {
        {
            filename = "__bumble-bots__/sounds/bees/buzz-1.ogg",
            volume = beeVolume
        },
        {
            filename = "__bumble-bots__/sounds/bees/buzz-2.ogg",
            volume = beeVolume
        },
        {
            filename = "__bumble-bots__/sounds/bees/buzz-4.ogg",
            volume = beeVolume
        },
        {
            filename = "__bumble-bots__/sounds/bees/buzz-5.ogg",
            volume = beeVolume
        },
        {
            filename = "__bumble-bots__/sounds/bees/buzz-6.ogg",
            volume = beeVolume
        },
        {
            filename = "__bumble-bots__/sounds/bees/buzz-7.ogg",
            volume = beeVolume
        }
    }
}

-- Corpses

logisticBeeCorpse.animation = make_rotated_animation_variations_from_sheet(4, {
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

-- Changing cargo center
logisticBee.cargo_centered = {0.0, -0.75}
