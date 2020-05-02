local constructionBee = data.raw["construction-robot"]["construction-robot"]
local constructionBeeCorpse = data.raw["corpse"]["construction-robot-remnants"]
local buzzSounds = require("__bumble-bots__/prototypes/buzz-sounds")

local icon_data = {
    icon = "__bumble-bots__/graphics/icons/construction-bee.png",
    icon_size = 64,
    icon_mipmaps = 1
}

for k, v in pairs(icon_data) do
    constructionBee[k] = v
    data.raw["item"]["construction-robot"][k] = v
    constructionBeeCorpse[k] = v
end


-- Entity Sprites
local sprites = 
{
  filename = "__bumble-bots__/graphics/entity/construction-bee/construction-bee.png",
  priority = "high",
  line_length = 16,
  width = 66,
  height = 76,
  frame_count = 1,
  shift = util.by_pixel(0,-4.5),
  direction_count = 16,
  scale = 0.5
}

constructionBee.idle = sprites
constructionBee.in_motion = sprites
constructionBee.in_motion.y = 76

-- Shadows
local shadows = 
{
  filename = "__bumble-bots__/graphics/entity/construction-bee/construction-bee-shadow.png",
  priority = "high",
  line_length = 16,
  width = 104,
  height = 49,
  frame_count = 1,
  shift = util.by_pixel(33.5, 18.75),
  direction_count = 16,
  scale = 0.5,
  draw_as_shadow = true
}

constructionBee.shadow_in_motion = shadows
constructionBee.shadow_idle = shadows
constructionBee.shadow_working = shadows
constructionBee.shadow_in_motion.y = 49

-- Working Animation
constructionBee.working =
{
  filename = "__bumble-bots__/graphics/entity/construction-bee/construction-bee-working.png",
  priority = "high",
  line_length = 2,
  width = 66,
  height = 76,
  frame_count = 2,
  shift = util.by_pixel(-0.25, -5),
  direction_count = 16,
  animation_speed = 0.3,
  scale = 0.5
}
constructionBee.shadow_working = 
{
  filename = "__bumble-bots__/graphics/entity/construction-bee/construction-bee-shadow.png",
  priority = "high",
  line_length = 16,
  width = 104,
  height = 49,
  frame_count = 1,
  repeat_count = 2,
  shift = util.by_pixel(33.5, 18.75),
  direction_count = 16,
  scale = 0.5,
  draw_as_shadow = true
}

for _,spark in pairs(data.raw["construction-robot"]["construction-robot"].sparks) do
    spark.tint = {r=232,g=172,b=19}
end

-- Sounds
constructionBee.working_sound = buzzSounds.low_buzz

-- Corpses
constructionBeeCorpse.animation = make_rotated_animation_variations_from_sheet (4,
{
  filename = "__bumble-bots__/graphics/entity/construction-bee/construction-bee-corpse.png",
  line_length = 1,
  width = 120,
  height = 114,
  frame_count = 1,
  variation_count = 1,
  axially_symmetrical = false,
  direction_count = 1,
  shift = util.by_pixel(1, 1),
  scale = 0.333
})


constructionBeeCorpse.ground_patch = 
{
    sheet =
    {
        filename = "__base__/graphics/entity/biter/hr-blood-puddle-var-main.png",
        flags = { "low-object" },
        line_length = 4,
        variation_count = 4,
        frame_count = 1,
        width = 164,
        height = 134,
        shift = {0, 0.125},
        tint = {r = 0.2, g = 0.8, b = 0.1, a = 1},
        scale = 0.2
    }
}

--Make bees show up on map
if settings.startup["bumble-bots-show-bots-on-map"].value then
    flags = constructionBee.flags
    for k,v in pairs(flags) do
        if v == "not-on-map" then
            table.remove(flags,k)
        end
    end
    constructionBee.map_color = {r = 255, g = 213, b = 25, a = 0.6}
end