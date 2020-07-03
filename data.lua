if not bumble_bots then bumble_bots = {} end

local botSizeDict = {
    ["large"]= 1.25,
    ["normal"] = 1,
    ["small"] = 0.625,
    ["tiny"] = 0.25

}
bumble_bots.bot_size_multiplier = botSizeDict[settings.startup["bumble-bots-bee-size"].value]

require("prototypes.logistic-bee")
require("prototypes.construction-bee")
require("prototypes.hive")
require("prototypes.defender-wasp")
require("prototypes.distractor-wasp")
require("prototypes.destroyer-hornet")
require("prototypes.logistic-containers")


data.raw["utility-constants"].default.main_menu_background_image_location = "__bumble-bots__/graphics/title_screen.png"
