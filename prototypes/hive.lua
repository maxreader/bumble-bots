-- Changes roboports into beehives, fixes charging animation for personal port
---------------------------------------------------------------------------------------------------


-- Icons
local icon_data = {
    icon = "__bumble-bots__/graphics/icons/beehive.png",
    icon_size = 64,
    icon_mipmaps = 1
}

for k, v in pairs(icon_data) do
    data.raw["roboport"]["roboport"][k] = v
    data.raw["item"]["roboport"][k] = v
end


-- Graphics
local base = {
    layers = {
        {
            filename = "__bumble-bots__/graphics/entity/hive/hive-base.png",
            width  = 228,
            height = 277,
            scale = 0.495,
            shift = {0,-0.5},
            hr_version = {
                filename = "__bumble-bots__/graphics/entity/hive/hive-base.png",
                width  = 228,
                height = 277,
                shift = {0,-0.5},
                scale = 0.495
            }
        },
        {
            filename = "__bumble-bots__/graphics/entity/hive/hive-base-shadow.png",
            width  = 150,
            height = 90,
            draw_as_shadow = true,
            shift = {0.75,0.375},
            scale = 1,
            hr_version = {
                filename = "__bumble-bots__/graphics/entity/hive/hive-base-shadow.png",
                width  = 150,
                height = 90,
                draw_as_shadow = true,
                force_hr_shadow = true,
                shift = {0.75,0.375},
                scale = 1
            }
        }
    }
}
local base_animation = {}
if settings.startup["bumble-bots-enable-hive-animation"].value then
    base_animation = {
        layers = {
            {
                filename = "__bumble-bots__/graphics/entity/hive/hive-animated.png",
                width  = 228,
                height = 277,
                frame_count = 32,
                line_length = 8,
                animation_speed = 0.2,
                scale = 0.5,
                shift = {0,-0.5},
                hr_version = {
                    filename = "__bumble-bots__/graphics/entity/hive/hive-animated.png",
                    width  = 228,
                    height = 277,
                    frame_count = 32,
                    line_length = 8,
                    animation_speed = 0.2,
                    shift = {0,-0.5},
                    scale = 0.5
                },
            },
            {
                filename = "__bumble-bots__/graphics/entity/hive/hive-animated-shadow.png",
                width  = 40,
                height = 90,
                frame_count = 32,
                line_length = 16,
                draw_as_shadow = true,
                animation_speed = 0.25,
                scale = 1,
                shift = {3.125,0.375},
                hr_version = {
                    filename = "__bumble-bots__/graphics/entity/hive/hive-animated-shadow.png",
                    width  = 40,
                    height = 90,
                    frame_count = 32,
                    line_length = 16,
                    draw_as_shadow = true,
                    force_hr_shadow = true,
                    animation_speed = 0.25,
                    shift = {3.125,0.375},
                    scale = 1

                }
            }
        }
    }
else
    base_animation = {
        layers = {
            {
                filename = "__bumble-bots__/graphics/entity/hive/hive-still.png",
                width  = 228,
                height = 277,
                frame_count = 1,
                line_length = 1,
                animation_speed = 0.2,
                scale = 0.5,
                shift = {0,-0.5},
                hr_version = {
                    filename = "__bumble-bots__/graphics/entity/hive/hive-still.png",
                    width  = 228,
                    height = 277,
                    frame_count = 1,
                    line_length = 1,
                    animation_speed = 0.2,
                    shift = {0,-0.5},
                    scale = 0.5
                },
            },
            {
                filename = "__bumble-bots__/graphics/entity/hive/hive-still-shadow.png",
                width  = 40,
                height = 90,
                frame_count = 1,
                line_length = 1,
                draw_as_shadow = true,
                animation_speed = 0.25,
                scale = 1,
                shift = {3.125,-0.25},
                hr_version = {
                    filename = "__bumble-bots__/graphics/entity/hive/hive-still-shadow.png",
                    width  = 40,
                    height = 90,
                    frame_count = 1,
                    line_length = 1,
                    draw_as_shadow = true,
                    force_hr_shadow = true,
                    animation_speed = 0.25,
                    shift = {3.125,0.625},
                    scale = 1

                }
            }
        }
    }
end

local door_animation_up = {
    filename = "__bumble-bots__/graphics/entity/hive/hatch-top.png",
    width = 97,
    height = 79,
    frame_count = 17,
    shift = util.by_pixel(0,-44.5),
    scale = 0.48,
    hr_version = {
        filename = "__bumble-bots__/graphics/entity/hive/hatch-top.png",
        width = 97,
        height = 79,
        frame_count = 17,
        shift = util.by_pixel(0,-44.5),
        scale = 0.48
    }
}
local door_animation_down = {
    filename = "__bumble-bots__/graphics/entity/hive/hatch-bottom.png",
    width = 97,
    height = 79,
    frame_count = 17,
    shift = util.by_pixel(0,-44.5),
    scale = 0.48,
    hr_version = {
        filename = "__bumble-bots__/graphics/entity/hive/hatch-bottom.png",
        width = 97,
        height = 79,
        frame_count = 17,
        shift = util.by_pixel(0,-44.5),
        scale = 0.48
    }
}


--Thank you for the idea, Raiguard
local empty_sheet = {
    filename = '__core__/graphics/empty.png',
    width = 1,
    height = 1
}


-- Bot interaction locations
local charging_offsets =
{
  {-1.2, -1.6}, {1.2, -1.6}, {1.2, 0.1}, {-1.2, 0.1}
}

local stationing_offset = {0, -0.8}

local recharging_animation =
{
  filename = "__bumble-bots__/graphics/entity/hive/bee-recharging.png",
  priority = "high",
  width = 37,
  height = 35,
  frame_count = 16,
  scale = 1.25,
  animation_speed = 0.5
}


-- Sounds
local hiveVolume = 0.35 * settings.startup["bumble-bots-hive-volume"].value
local doorVolumeMult = 0.45

local working_sound =
{
    sound = { filename = "__bumble-bots__/sounds/hive-drone.ogg", volume = hiveVolume  },
    max_sounds_per_type = 3,
    audible_distance_modifier = 0.7,
    probability = 1
}

local open_door_trigger_effect =
{
  {
    type = "play-sound",
    sound =
    {
        {
            filename = "__bumble-bots__/sounds/hatch-open-1.ogg", volume = doorVolumeMult * hiveVolume
        },
        {
            filename = "__bumble-bots__/sounds/hatch-open-2.ogg", volume = doorVolumeMult * hiveVolume
        },

    },
    audible_distance_modifier = 0.5,
  }
}

local close_door_trigger_effect =
{
  {
    type = "play-sound",
    sound = 
    { 
        {
            filename = "__bumble-bots__/sounds/hatch-close-1.ogg", volume = doorVolumeMult * hiveVolume
        },
        {
            filename = "__bumble-bots__/sounds/hatch-close-2.ogg", volume = doorVolumeMult * hiveVolume
        },

    },
    audible_distance_modifier = 0.5
  }
}
local vehicle_impact_sound =  { filename = "__bumble-bots__/sounds/bee-hive-impact.ogg", volume = 0.85 }

-- Apply changes
properties = 
{
    base = base,
    base_animation = base_animation,
    base_patch = empty_sheet,
    door_animation_up = door_animation_up,
    door_animation_down = door_animation_down,
    charging_offsets = charging_offsets,
    stationing_offset = stationing_offset,
    working_sound = working_sound,
    open_door_trigger_effect = open_door_trigger_effect,
    close_door_trigger_effect = close_door_trigger_effect,
    vehicle_impact_sound = vehicle_impact_sound,
    recharging_animation = recharging_animation
}


for k,v in pairs(properties) do
    data.raw["roboport"]["roboport"][k] = v
end

for _,v in pairs(data.raw['roboport-equipment']) do
    v.recharging_animation = recharging_animation
end


-- Corpses
data.raw["corpse"]["roboport-remnants"].animation = make_rotated_animation_variations_from_sheet(4,
{
  filename = "__bumble-bots__/graphics/entity/hive/hive-remnants.png",
  line_length = 1,
  width = 364,
  height = 364,
  frame_count = 1,
  variation_count = 1,
  axially_symmetrical = false,
  direction_count = 1,
  shift = util.by_pixel(2, 8),
  scale = 0.4,
  hr_version =
  {
    filename = "__bumble-bots__/graphics/entity/hive/hive-remnants.png",
    line_length = 1,
    width = 364,
    height = 364,
    frame_count = 1,
    variation_count = 1,
    axially_symmetrical = false,
    direction_count = 1,
    shift = util.by_pixel(2, 8),
    scale = 0.4,
  },
})

return