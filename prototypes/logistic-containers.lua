-- Applies new sprites to all five logistic chests
---------------------------------------------------------------------------------------------------
if settings.startup["bumble-bots-enable-flowers"].value then
    local sounds = require("__base__/prototypes/entity/demo-sounds")
    -- List of bush types
    local bushTypes = {
        "storage", "passive-provider", "active-provider",
        "requester", "buffer"
    }

    -- For circuit connections
    local empty_sheet = {
        filename = '__core__/graphics/empty.png',
        width = 1,
        height = 1,
        frame_count = 1,
        line_length = 1,
        priority = "low",
        scale = 0.5,
        shift = util.by_pixel(0, 0)
    }

    -- Circuit connection locations
    bush_connector_template = {
        connector_main = empty_sheet,
        connector_shadow = empty_sheet,
        wire_pins = empty_sheet,
        wire_pins_shadow = empty_sheet,

        led_blue = {
            filename = "__base__/graphics/entity/circuit-connector/hr-ccm-universal-04e-blue-LED-on-sequence.png",
            frame_count = 32,
            height = 60,
            line_length = 8,
            priority = "low",
            scale = 0.5,
            shift = util.by_pixel(0, 0),
            width = 60
        },

        led_blue_off = {
            filename = "__base__/graphics/entity/circuit-connector/hr-ccm-universal-04f-blue-LED-off-sequence.png",
            frame_count = 32,
            height = 44,
            line_length = 8,
            priority = "low",
            scale = 0.5,
            shift = util.by_pixel(0, 0),
            width = 46
        },

        led_green = {
            filename = "__base__/graphics/entity/circuit-connector/hr-ccm-universal-04h-green-LED-sequence.png",
            frame_count = 32,
            height = 46,
            line_length = 8,
            priority = "low",
            scale = 0.5,
            shift = util.by_pixel(0, 0),
            width = 48
        },

        led_red = {
            filename = "__base__/graphics/entity/circuit-connector/hr-ccm-universal-04i-red-LED-sequence.png",
            frame_count = 32,
            height = 46,
            line_length = 8,
            priority = "low",
            scale = 0.5,
            shift = util.by_pixel(0, 0),
            width = 48
        },
        wire_offsets = {
            {
                red = util.by_pixel(13, -3),
                green = util.by_pixel(-16, 0)
            }
        },
        wire_shadow_offsets = {
            {
                red = util.by_pixel(9, 0.5),
                green = util.by_pixel(-12, 3.5)
            }
        },
        light_offsets = {
            {
                rg = util.by_pixel(3.5, 5),
                b = util.by_pixel(-3.5, 8.5)
            }
        }
    }

    circuit_connector_definitions["bush"] = circuit_connector_definitions.create(
                                                bush_connector_template, {
            {
                variation = 0,
                main_offset = util.by_pixel(0, 0),
                shadow_offset = util.by_pixel(0, 0),
                show_shadow = false
            }
        })

    -- Animations
    local function get_animation(name)
        return {
            layers = {
                {
                    filename = "__bumble-bots__/graphics/entity/logistic-bush/" .. name .. ".png",
                    priority = "extra-high",
                    width = 111,
                    height = 99,
                    frame_count = 10,
                    shift = util.by_pixel(0, 0),
                    scale = 0.333,
                    hr_version = {
                        filename = "__bumble-bots__/graphics/entity/logistic-bush/" .. name ..
                            ".png",
                        priority = "extra-high",
                        width = 111,
                        height = 99,
                        frame_count = 10,
                        shift = util.by_pixel(0, 0),
                        scale = 0.333
                    }
                }, {
                    filename = "__bumble-bots__/graphics/entity/logistic-bush/bush-shadow.png",
                    priority = "extra-high",
                    width = 96,
                    height = 44,
                    repeat_count = 10,
                    shift = util.by_pixel(8.5, 7.5),
                    draw_as_shadow = true,
                    scale = 0.333,
                    hr_version = {
                        filename = "__bumble-bots__/graphics/entity/logistic-bush/bush-shadow.png",
                        priority = "extra-high",
                        width = 96,
                        height = 44,
                        repeat_count = 10,
                        shift = util.by_pixel(8.5, 7),
                        draw_as_shadow = true,
                        scale = 0.333
                    }
                }
            }
        }
    end

    local corpse = table.deepcopy(data.raw.corpse["passive-provider-chest-remnants"])
    corpse.name = "logistic-bush-remnants"
    corpse.animation = make_rotated_animation_variations_from_sheet(4, {
        filename = "__bumble-bots__/graphics/entity/logistic-bush/bush-corpse.png",
        priority = "extra-high",
        line_length = 1,
        width = 111,
        height = 111,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(0, 0),
        scale = 0.3,
        hr_version = {
            filename = "__bumble-bots__/graphics/entity/logistic-bush/bush-corpse.png",
            priority = "extra-high",
            line_length = 1,
            width = 111,
            height = 111,
            frame_count = 1,
            variation_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = util.by_pixel(0, 0),
            scale = 0.36
        }
    })
    data:extend({corpse})

    -- Sounds
    local animation_sound = sounds.big_bush
    for _, v in pairs(animation_sound) do
        v.volume = 0.5 * settings.startup["bumble-bots-bush-volume"].value
    end

    -- Apply changes to each type
    for _, v in pairs(bushTypes) do
        local bush = data.raw["logistic-container"]["logistic-chest-" .. v]
        bush.animation = get_animation(v)
        bush.animation_sound = animation_sound
        bush.open_sound = {
            filename = "__base__/sound/walking/plant/bush-small-01.ogg",
            volume = 1
        }
        bush.close_sound = {
            filename = "__base__/sound/walking/plant/bush-small-02.ogg",
            volume = 1
        }
        bush.vehicle_impact_sound = sounds.plant
        bush.circuit_wire_connection_point = circuit_connector_definitions["bush"].points
        bush.circuit_connector_sprites = circuit_connector_definitions["bush"].sprites
        bush.icon = "__bumble-bots__/graphics/icons/" .. v .. ".png"
        bush.icon_size = 64
        bush.icon_mipmaps = 1
        bush.corpse = "logistic-bush-remnants"

        local bush_icon = data.raw["item"]["logistic-chest-" .. v]
        bush_icon.icon = "__bumble-bots__/graphics/icons/" .. v .. ".png"
        bush_icon.icon_size = 64
        bush_icon.icon_mipmaps = 1

    end
end
