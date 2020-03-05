-- Changes logistic robots into Logistic Bees
---------------------------------------------------------------------------------------------------
local logisticBee = data.raw["logistic-robot"]["logistic-robot"]

-- Icons
local icon_data = 
{
    icon = "__bumble-bots__/graphics/icons/logistic-bee.png",
    icon_size = 64,
    icon_mipmaps = 1
}

for k, v in pairs(icon_data) do
    logisticBee[k] = v
    data.raw["item"]["logistic-robot"][k] = v
end

-- Main Sprites
local propertiesToChange = 
{
    filename = "__bumble-bots__/graphics/entity/logistic-bee/logistic-bee.png",
    width = 80,
    height = 84,
    scale = 0.5
}

for k,v in pairs(propertiesToChange) do
    logisticBee.idle[k] = v
    logisticBee.idle_with_cargo[k]=v
    logisticBee.in_motion[k] = v
    logisticBee.in_motion_with_cargo[k] = v
    logisticBee.idle.hr_version[k] = v
    logisticBee.idle_with_cargo.hr_version[k]=v
    logisticBee.in_motion.hr_version[k] = v
    logisticBee.in_motion_with_cargo.hr_version[k] = v
end

logisticBee.idle.y = propertiesToChange.height
logisticBee.in_motion_with_cargo.y = propertiesToChange.height * 2
logisticBee.in_motion.y = propertiesToChange.height * 3

-- Shadows
local shadowPropertiesToChange = 
{
    filename = "__bumble-bots__/graphics/entity/logistic-bee/logistic-bee-shadow.png",
    width = 115,
    height = 57,
    scale = 0.5
}

for k,v in pairs(shadowPropertiesToChange) do
    logisticBee.shadow_idle[k] = v
    logisticBee.shadow_idle_with_cargo[k]=v
    logisticBee.shadow_in_motion[k] = v
    logisticBee.shadow_in_motion_with_cargo[k] = v
    logisticBee.shadow_idle.hr_version[k] = v
    logisticBee.shadow_idle_with_cargo.hr_version[k]=v
    logisticBee.shadow_in_motion.hr_version[k] = v
    logisticBee.shadow_in_motion_with_cargo.hr_version[k] = v
end

logisticBee.shadow_idle.y = shadowPropertiesToChange.height
logisticBee.shadow_in_motion_with_cargo.y = shadowPropertiesToChange.height * 2
logisticBee.shadow_in_motion.y = shadowPropertiesToChange.height * 3

-- Changing cargo center
logisticBee.cargo_centered = {0.0, -1}