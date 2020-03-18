local constructionBee = data.raw["construction-robot"]["construction-robot"]

local icon_data = {
    icon = "__bumble-bots__/graphics/icons/construction-bee.png",
    icon_size = 64,
    icon_mipmaps = 1
}

for k, v in pairs(icon_data) do
    constructionBee[k] = v
    data.raw["item"]["construction-robot"][k] = v
end


local propertiesToChange = {
    filename = "__bumble-bots__/graphics/entity/construction-bee/construction-bee.png",
    width = 66,
    height = 76,
    scale = 0.5
}

for k,v in pairs(propertiesToChange) do
    constructionBee.idle[k] = v
    constructionBee.in_motion[k] = v
    constructionBee.idle.hr_version[k] = v
    constructionBee.in_motion.hr_version[k] = v
end

constructionBee.in_motion.y = 76

local shadowPropertiesToChange = {
    filename = "__bumble-bots__/graphics/entity/construction-bee/construction-bee-shadow.png",
    width = 104,
    height = 49,
    scale = 0.5
}

for k,v in pairs(shadowPropertiesToChange) do
    constructionBee.shadow_idle[k] = v
    constructionBee.shadow_in_motion[k] = v
    constructionBee.shadow_idle.hr_version[k] = v
    constructionBee.shadow_in_motion.hr_version[k] = v
end

constructionBee.shadow_in_motion.y = 49

local workingPropertiesToChange = {
    filename = "__bumble-bots__/graphics/entity/construction-bee/construction-bee-working.png",
    width = 66,
    height = 76,
    scale = 0.5
}

for k,v in pairs(workingPropertiesToChange) do 
    constructionBee.working[k] = v
    constructionBee.working.hr_version[k] = v
end

for _,spark in pairs(data.raw["construction-robot"]["construction-robot"].sparks) do
    spark.tint = {r=232,g=172,b=19}
end


local beeVolume = 0.375 * settings.startup["bumble-bots-bee-volume"].value

constructionBee.working_sound =
{
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
    max_sounds_per_type = 6,
}