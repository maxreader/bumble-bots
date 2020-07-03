-- Changes roboports into beehives, fixes charging animation for personal port
---------------------------------------------------------------------------------------------------
local recharging_animation = {
    filename = "__bumble-bots__/graphics/entity/hive/bee-recharging.png",
    priority = "high",
    width = 37,
    height = 35,
    frame_count = 16,
    scale = 1.25,
    animation_speed = 0.5
}
for _, v in pairs(data.raw['roboport-equipment']) do
    v.recharging_animation = recharging_animation
end

data.raw["roboport-equipment"]["personal-roboport-equipment"].sprite.filename =
    "__bumble-bots__/graphics/equipment/personal-beehive-equipment.png"
data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].sprite
    .filename =
    "__bumble-bots__/graphics/equipment/personal-beehive-mk2-equipment.png"
data.raw["item"]["personal-roboport-equipment"].icon =
    "__bumble-bots__/graphics/icons/personal-beehive-equipment-icon.png"
data.raw["item"]["personal-roboport-equipment"].icon_size = 64
data.raw["item"]["personal-roboport-mk2-equipment"].icon =
    "__bumble-bots__/graphics/icons/personal-beehive-mk2-equipment-icon.png"
data.raw["item"]["personal-roboport-mk2-equipment"].icon_size = 64

local hiveVolume = 1.25 * settings.startup["bumble-bots-hive-volume"].value
local doorVolumeMult = 1

local function set_hive_sprites_with_mask(level, tint, animated, scale)
    tint = tint or {255, 0, 255,}
    scale = scale or 1
    animated = animated or true
    local hive = data.raw["roboport"][level]
    if not hive then log("Error: Roboport \""..level"\" not found.") return end
    local mainShift = {0, -0.5 * scale}

    -- Main sprites
    ---------------------------------------------------------------------------------------------------
    hive.base = {
        layers = {
            {
                filename = "__bumble-bots__/graphics/entity/hive/hive-base.png",
                width = 228,
                height = 277,
                scale = 0.495 * scale,
                shift = mainShift
            }, {
                filename = "__bumble-bots__/graphics/entity/hive/hive-base-mask.png",
                width = 228,
                height = 277,
                scale = 0.495 * scale,
                shift = mainShift,
                flags = {"mask"},
                tint = tint,
                apply_runtime_tint = true
            }, {
                filename = "__bumble-bots__/graphics/entity/hive/hive-base-shadow.png",
                width = 150,
                height = 90,
                draw_as_shadow = true,
                shift = {0.75, 0.375},
                scale = scale
            }
        }
    }

    hive.base_animation = {
        layers = {
            {
                filename = "__bumble-bots__/graphics/entity/hive/hive-animated.png",
                width = 228,
                height = 277,
                frame_count = 32,
                line_length = 8,
                animation_speed = 0.2,
                scale = 0.5 * scale,
                shift = mainShift
            }, {
                filename = "__bumble-bots__/graphics/entity/hive/hive-animated-mask.png",
                width = 228,
                height = 277,
                frame_count = 32,
                line_length = 8,
                animation_speed = 0.2,
                scale = 0.5 * scale,
                shift = mainShift,
                flags = {"mask"},
                tint = tint,
                apply_runtime_tint = true
            }, {
                filename = "__bumble-bots__/graphics/entity/hive/hive-animated-shadow.png",
                width = 40,
                height = 90,
                frame_count = 32,
                line_length = 16,
                draw_as_shadow = true,
                animation_speed = 0.25,
                scale = 1 * scale,
                shift = {3.125, 0.375}
            }
        }
    }
    if not animated then
        for _, layer in pairs(hive.base_animation.layers) do
            layer.frame_count = 1
            layer.line_length = 1
        end
    end
    local hatchShift = util.by_pixel(0, -44.5)
    hatchShift[2] = hatchShift[2]*scale + (1-scale) / 64

    hive.door_animation_up = {
        layers = {
            {
                filename = "__bumble-bots__/graphics/entity/hive/hatch-top.png",
                width = 97,
                height = 79,
                frame_count = 17,
                shift = hatchShift,
                scale = 0.475 * scale
            }, {
                filename = "__bumble-bots__/graphics/entity/hive/hatch-top-mask.png",
                width = 97,
                height = 79,
                frame_count = 17,
                shift = hatchShift,
                scale = 0.475 * scale,
                flags = {"mask"},
                tint = tint,
                apply_runtime_tint = true
            }
        }
    }
    hive.door_animation_down = {
        layers = {
            {
                filename = "__bumble-bots__/graphics/entity/hive/hatch-bottom.png",
                width = 97,
                height = 79,
                frame_count = 17,
                shift = hatchShift,
                scale = 0.475 * scale
            }, {
                filename = "__bumble-bots__/graphics/entity/hive/hatch-bottom-mask.png",
                width = 97,
                height = 79,
                frame_count = 17,
                shift = hatchShift,
                scale = 0.475 * scale,
                flags = {"mask"},
                tint = tint,
                apply_runtime_tint = true
            }
        }
    }
    hive.base_patch = {
        filename = '__core__/graphics/empty.png',
        width = 1,
        height = 1
    }

    -- Robot Interactions
    ---------------------------------------------------------------------------------------------------
    hive.charging_offsets = {{-1.2, -1.6}, {1.2, -1.6}, {1.2, 0.1}, {-1.2, 0.1}}

    hive.stationing_offset = {0, -0.8}

    hive.recharging_animation = recharging_animation

    -- Sounds
    ---------------------------------------------------------------------------------------------------
    hive.working_sound = {
        sound = {
            filename = "__bumble-bots__/sounds/hive/hive-drone.ogg",
            volume = hiveVolume
        },
        max_sounds_per_type = 3
        -- audible_distance_modifier = 0.7,
    }

    hive.open_door_trigger_effect = {
        {
            type = "play-sound",
            sound = {
                {
                    filename = "__bumble-bots__/sounds/hive/hatch-open-1.ogg",
                    volume = doorVolumeMult * hiveVolume
                }, {
                    filename = "__bumble-bots__/sounds/hive/hatch-open-2.ogg",
                    volume = doorVolumeMult * hiveVolume
                }

            },
            audible_distance_modifier = 0.5
        }
    }

    hive.close_door_trigger_effect = {
        {
            type = "play-sound",
            sound = {
                {
                    filename = "__bumble-bots__/sounds/hive/hatch-close-1.ogg",
                    volume = doorVolumeMult * hiveVolume
                }, {
                    filename = "__bumble-bots__/sounds/hive/hatch-close-2.ogg",
                    volume = doorVolumeMult * hiveVolume
                }

            },
            audible_distance_modifier = 0.5
        }
    }
    hive.vehicle_impact_sound = {
        filename = "__bumble-bots__/sounds/hive/bee-hive-impact.ogg",
        volume = 0.85
    }

    -- Corpse
    ---------------------------------------------------------------------------------------------------
    local hiveRemnant = data.raw["corpse"][level .. "-remnants"]
    if data.raw["corpse"][level .. "-remnants"] == nil then
        hiveRemnant = table.deepcopy(data.raw["corpse"]["roboport-remnants"])
        hiveRemnant.name = level .. "-remnants"
        data:extend{hiveRemnant}
    end
    hiveRemnant.animation = make_rotated_animation_variations_from_sheet(4, {
        layers = {
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
                scale = 0.4 * scale
            }, {
                filename = "__bumble-bots__/graphics/entity/hive/hive-remnants-mask.png",
                line_length = 1,
                width = 364,
                height = 364,
                frame_count = 1,
                variation_count = 1,
                axially_symmetrical = false,
                direction_count = 1,
                shift = util.by_pixel(2, 8),
                scale = 0.4 * scale,
                flags = {"mask"},
                tint = tint
            }
        }
    })

    -- Icons
    ---------------------------------------------------------------------------------------------------
    local icons = {
        {icon = "__bumble-bots__/graphics/icons/beehive.png", icon_size = 64}, {
            icon = "__bumble-bots__/graphics/icons/beehive-icon-mask.png",
            icon_size = 64,
            tint = tint
        }
    }

    hive.icons = icons
    data.raw["item"][level].icons = icons
    hiveRemnant.icons = icons

end

local animated = settings.startup["bumble-bots-enable-hive-animation"].value
set_hive_sprites_with_mask("roboport", {255, 200, 80, 155}, animated)

-- get rid of mask for vanilla port to let the base graphics shine through
local graphicsLevels = {
    "base", "base_animation", "door_animation_up", "door_animation_down"
}
local vanillaRoboport = data.raw["roboport"]["roboport"]
for k,v in pairs(graphicsLevels) do
    table.remove(vanillaRoboport[v].layers, 2)
end




if mods["boblogistics"] then
    local mapping = {
        ["roboport"] = {255, 200, 80, 155},
        ["bob-roboport-2"] = {255, 79, 79, 240},
        ["bob-roboport-3"] = {79, 82, 255, 240},
        ["bob-roboport-4"] = {173, 79, 255, 240}
    }
    for robot, color in pairs(mapping) do
        set_hive_sprites_with_mask(robot, color)
    end
end

if mods["pyindustry"] then
    set_hive_sprites_with_mask("py-roboport-mk01", {255, 169, 10, 240}, animated,
                              0.75)
end

if mods["FactorioExtended-Plus-Logistics"] then
    set_hive_sprites_with_mask("roboport-mk2", {3, 252, 173, 240})
    set_hive_sprites_with_mask("roboport-mk3", {103, 52, 235, 240})
end
return
