
local function add_hive(entity)
    rendering.draw_light{
    sprite = "utility/light_small",
    oriented = false,
    target = entity,
    target_offset = {0,1},
    surface = entity.surface,
    minimum_darkness = 0.0,
    intensity = 0.35,
    scale = 3,
    color = {r=1,g=1,b=0.5}  }
    entity.backer_name = 'is full of bees'
    return
end

local function regenerate_beehives()
    rendering.clear("bumble-bots")
    for _, surface in pairs(game.surfaces) do
        for _, roboport in pairs(surface.find_entities_filtered{name = "roboport"}) do
            add_hive(roboport)
        end
    end
end

local filters = {{filter = "name", name = "roboport"}}

script.on_event(defines.events.on_built_entity,
    function(event)
        add_hive(event.created_entity)
    end
    ,filters)

script.on_event(defines.events.on_robot_built_entity,
    function(event)
        add_hive(event.created_entity)
    end
,filters)   

--[[script.on_event(
    {
        defines.events.script_raised_built,
        defines.events.script_raised_revive
    },
    function(event)
        if event.entity.name == "roboport" then
            add_hive(event.entity)
        end
    end
)
script.on_event(defines.events.on_entity_cloned,
    function(event)
        if event.destination.name == "roboport" then
            add_hive(event.destination)
        end
    end
)]]
script.on_event(
    {
        defines.events.script_raised_built,
        defines.events.script_raised_revive,
        defines.events.on_entity_cloned
    },
    function(event)
        local entity = event.entity or event.destination
        if (entity.name) == "roboport" then
            add_hive(event.entity)
        end
    end
)

script.on_init(
    function()
        regenerate_beehives()
    end
)

script.on_configuration_changed(
    function()
        regenerate_beehives()
    end
)

script.on_load(
    function()
        commands.add_command("redoHiveLights","redo-hive-lights",regenerate_beehives)
    end
)