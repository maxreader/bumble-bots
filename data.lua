if not bumble_bots then bumble_bots = {} end

local botSizeDict = {
    ["large"]= 1.25,
    ["normal"] = 1,
    ["small"] = 0.625,
    ["tiny"] = 0.25

}
bumble_bots.bot_size_multiplier = botSizeDict[settings.startup["bumble-bots-bee-size"].value]
local animated = settings.startup["bumble-bots-enable-hive-animation"].value
local set_logistic_sprites_with_mask = require('prototypes.logistic-bee')
local set_construction_sprites_with_mask = require('prototypes.construction-bee')
local set_hive_sprites_with_mask = require('prototypes.hive')

require("prototypes.defender-wasp")
require("prototypes.distractor-wasp")
require("prototypes.destroyer-hornet")
require("prototypes.logistic-containers")


set_logistic_sprites_with_mask("logistic-robot", {r = 1, g = 0.72, b = 0.1, a = 0.7})
set_construction_sprites_with_mask("construction-robot", {255, 200, 80, 155})
set_hive_sprites_with_mask("roboport", {255, 200, 80, 155}, animated)

-- get rid of mask for vanilla port to let the base graphics shine through
local vanillaRoboport = data.raw["roboport"]["roboport"]

for k,v in pairs({"base", "base_animation", "door_animation_up", "door_animation_down"}) do
    table.remove(vanillaRoboport[v].layers, 2)
end

if mods["boblogistics"] then
    local logisticMapping = {
        ["logistic-robot"] = {255, 207, 15, 179},
        ["bob-logistic-robot-2"] = {255, 15, 15, 179},
        ["bob-logistic-robot-3"] = {15, 19, 255, 179},
        ["bob-logistic-robot-4"] = {143, 15, 255, 179},
        ["bob-logistic-robot-5"] = {15, 255, 31, 179},
    }
    for robot, color in pairs(logisticMapping) do
        set_logistic_sprites_with_mask(robot, color)
    end
    local constructionMapping = {
        ["construction-robot"] = {255, 200, 80, 155},
        ["bob-construction-robot-2"] = {255, 79, 79, 155},
        ["bob-construction-robot-3"] = {79, 82, 255, 155},
        ["bob-construction-robot-4"] = {173, 79, 255, 155},
        ["bob-construction-robot-5"] = {79, 255, 91, 155}
    }
    for robot, color in pairs(constructionMapping) do
        set_construction_sprites_with_mask(robot, color)
    end
    local hiveMapping = {
        ["roboport"] = {255, 200, 80, 155},
        ["bob-roboport-2"] = {255, 79, 79, 240},
        ["bob-roboport-3"] = {79, 82, 255, 240},
        ["bob-roboport-4"] = {173, 79, 255, 240}
    }
    for robot, color in pairs(hiveMapping) do
        set_hive_sprites_with_mask(robot, color)
    end
end

if mods["pyindustry"] then
    set_logistic_sprites_with_mask("py-logistic-robot-01", {171, 19, 19, 179})
    set_construction_sprites_with_mask("py-construction-robot-01", {197, 69, 9, 155})
    set_hive_sprites_with_mask("py-roboport-mk01", {255, 169, 10, 240}, animated,
                              0.75)
end

if mods["pyhightech"] then
    set_logistic_sprites_with_mask("logistic-robot-ht", {46, 203, 255, 179}, 1.25)
    set_construction_sprites_with_mask("construction-robot-ht", {3, 17, 67, 179}, 1.25)
end

if mods["FactorioExtended-Plus-Logistics"] then
    set_logistic_sprites_with_mask("logistic-robot-mk2", {3, 252, 173, 179})
    set_logistic_sprites_with_mask("logistic-robot-mk3", {0, 52, 255, 179})
    set_construction_sprites_with_mask("construction-robot-mk2", {3, 252, 173, 179})
    set_construction_sprites_with_mask("construction-robot-mk3", {0, 52, 255, 179})
    set_hive_sprites_with_mask("roboport-mk2", {3, 252, 173, 240})
    set_hive_sprites_with_mask("roboport-mk3", {0, 52, 255, 240})
end

if mods["skan-fusion-robots"] then
    set_logistic_sprites_with_mask("skan-logistic-robot-fusion", {0, 81, 255, 179})
    set_construction_sprites_with_mask("skan-construction-robot-fusion", {0, 81, 255, 179})
end

data.raw["utility-constants"].default.main_menu_background_image_location = "__bumble-bots__/graphics/title_screen.png"
