-- If option is enabled, change flying robot frame sprites to larvae
---------------------------------------------------------------------------------------------------
if settings.startup["bumble-bots-enable-larvae"].value then
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
end