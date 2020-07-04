-- If option is enabled, change flying robot frame sprites to larvae
---------------------------------------------------------------------------------------------------
--[[if settings.startup["bumble-bots-enable-larvae"].value then
    local larva = data.raw["item"]["flying-robot-frame"]
    larva.icon = "__bumble-bots__/graphics/icons/larva.png"
    larva.icon_mipmaps = 1
    larva.pictures =
    {
        { size = 64, filename = "__bumble-bots__/graphics/icons/larva-0001.png", scale = 0.25, mipmap_count = 1 },
        { size = 64, filename = "__bumble-bots__/graphics/icons/larva-0002.png", scale = 0.25, mipmap_count = 1 },
        { size = 64, filename = "__bumble-bots__/graphics/icons/larva-0003.png", scale = 0.25, mipmap_count = 1 },
        { size = 64, filename = "__bumble-bots__/graphics/icons/larva-0004.png", scale = 0.25, mipmap_count = 1 },
        { size = 64, filename = "__bumble-bots__/graphics/icons/larva-0005.png", scale = 0.25, mipmap_count = 1 },
        { size = 64, filename = "__bumble-bots__/graphics/icons/larva-0006.png", scale = 0.25, mipmap_count = 1 },
        { size = 64, filename = "__bumble-bots__/graphics/icons/larva-0007.png", scale = 0.25, mipmap_count = 1 },
        { size = 64, filename = "__bumble-bots__/graphics/icons/larva-0008.png", scale = 0.25, mipmap_count = 1 },
    }
end--]]

local function set_larva_sprites_with_mask(name, tint)
    local larva = data.raw["item"][name]
    larva.icons = {
        {
            icon = "__bumble-bots__/graphics/icons/larva/larva.png",
            icon_size = 64
        },{
            icon = "__bumble-bots__/graphics/icons/larva/larva-mask.png",
            icon_size = 64,
            tint = tint
        }
    }
    local pictures = {}
    for n = 1, 8 do
        table.insert(pictures,{layers = {
            {
                filename = "__bumble-bots__/graphics/icons/larva/larva-000"..n..".png",
                size = 64,
                scale = 0.25 * bumble_bots.bot_size_multiplier^0.5
            },{
                filename = "__bumble-bots__/graphics/icons/larva/larva-000"..n.."-mask.png",
                size = 64,
                scale = 0.25 * bumble_bots.bot_size_multiplier^0.5,
                tint = tint
            }
        }})
    end
    larva.pictures = pictures
end

if settings.startup["bumble-bots-enable-larvae"].value then
    set_larva_sprites_with_mask("flying-robot-frame")
    if mods["boblogistics"] then
        local mapping = {
        ["flying-robot-frame"] = {255, 207, 15, 179},
        ["flying-robot-frame-2"] = {255, 15, 15, 179},
        ["flying-robot-frame-3"] = {15, 19, 255, 179},
        ["flying-robot-frame-4"] = {143, 15, 255, 179},
        }
        for larva, tint in pairs(mapping) do
            set_larva_sprites_with_mask(larva, tint)
        end
    end
end
return set_larva_sprites_with_mask