if settings.startup["bobmods-logistics-robotparts"].value and
    settings.startup["bumble-bots-enable-bob-bot-part-reskin"].value then
    local items = data.raw["item"]
    local levels = {
        {{255, 240, 179}, {179, 179, 179}}, -- steel
        {{255, 179, 179}, {207, 207, 112}}, -- brass
        {{179, 209, 255}, {245, 245, 245}}, -- titanium
        {{219, 179, 255}, {201, 173, 131}} -- ceramic
    }

    if mods["angelsindustries"] then levels[3][2] =
        {211, 165, 210} end

    local types = {
        construction = {{77, 153, 87}, {57, 255, 86}}, -- mint
        logistic = {{77, 126, 153}, {57, 187, 255}}, -- ice blue
        combat = {{152, 77, 153}, {252, 59, 255}} -- violet
    }
    for level, levelColors in pairs(levels) do
        for type, typeColor in pairs(types) do
            local brainName = "robot-brain-" .. type
            local toolName = "robot-tool-" .. type
            if level ~= 1 then
                brainName = brainName .. "-" .. level
                toolName = toolName .. "-" .. level
            end
            if items[brainName] then
                items[brainName].icons = {
                    {
                        icon = "__bumble-bots__/graphics/icons/bee-parts/implant-base.png",
                        size = 64
                    }, {
                        icon = "__bumble-bots__/graphics/icons/bee-parts/implant-backpack.png",
                        size = 64,
                        tint = typeColor[1]
                    }, {
                        icon = "__bumble-bots__/graphics/icons/bee-parts/implant-electrodes.png",
                        size = 64,
                        tint = levelColors[1]
                    }
                }
                items[brainName].icon_size = 64
            end
            if items[toolName] then
                items[toolName].icons = {
                    {
                        icon = "__bumble-bots__/graphics/icons/bee-parts/mandible-translucent.png",
                        size = 64
                    }, {
                        icon = "__bumble-bots__/graphics/icons/bee-parts/prosthetic-base.png",
                        size = 64,
                        tint = levelColors[2]
                    }, {
                        icon = "__bumble-bots__/graphics/icons/bee-parts/prosthetic-detail.png",
                        size = 64,
                        tint = typeColor[2]
                    }
                }
                items[toolName].icon_size = 64
            end
        end
    end
end
