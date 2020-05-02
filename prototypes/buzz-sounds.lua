
local beeVolume = 0.375 * settings.startup["bumble-bots-bee-volume"].value
return {
    low_buzz = {
        sound =
        {
            {
            filename = "__bumble-bots__/sounds/bees/low-buzz-1.ogg", volume = beeVolume
            },
            {
            filename = "__bumble-bots__/sounds/bees/low-buzz-2.ogg", volume = beeVolume
            },
            {
            filename = "__bumble-bots__/sounds/bees/low-buzz-4.ogg", volume = beeVolume
            },
            {
            filename = "__bumble-bots__/sounds/bees/low-buzz-5.ogg", volume = beeVolume
            },
            {
            filename = "__bumble-bots__/sounds/bees/low-buzz-6.ogg", volume = beeVolume
            },
            {
            filename = "__bumble-bots__/sounds/bees/low-buzz-7.ogg", volume = beeVolume
            },
        },
        max_sounds_per_type = 10,
        fade_in_ticks = 10,
        fade_out_ticks = 30,
        audible_distance_modifier = 1,
    },
    medium_buzz = {
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
        },
        fade_in_ticks = 10,
        fade_out_ticks = 30,
        audible_distance_modifier = 0.5,
        max_sounds_per_type = 10,
    },
    high_buzz = {
        sound =
        {
            {
            filename = "__bumble-bots__/sounds/bees/bee-buzz-high-01.ogg", volume = beeVolume
            },
            {
            filename = "__bumble-bots__/sounds/bees/bee-buzz-high-02.ogg", volume = beeVolume
            },
            {
            filename = "__bumble-bots__/sounds/bees/bee-buzz-high-04.ogg", volume = beeVolume
            },
            {
            filename = "__bumble-bots__/sounds/bees/bee-buzz-high-05.ogg", volume = beeVolume
            },
            {
            filename = "__bumble-bots__/sounds/bees/bee-buzz-high-06.ogg", volume = beeVolume
            },
            {
            filename = "__bumble-bots__/sounds/bees/bee-buzz-high-07.ogg", volume = beeVolume
            },
        },
        max_sounds_per_type = 6,
        fade_in_ticks = 10,
        fade_out_ticks = 30,
        audible_distance_modifier = 0.5,
    },
}