-- get rid of mask for vanilla port to let the base graphics shine through
local vanillaRoboport = data.raw["roboport"]["roboport"]

for k, v in pairs({
    "base", "base_animation", "door_animation_up",
    "door_animation_down"
}) do table.remove(vanillaRoboport[v].layers, 2) end