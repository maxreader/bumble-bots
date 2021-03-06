data:extend({
    {
        type = "bool-setting",
        name = "bumble-bots-enable-wasps",
        setting_type = "startup",
        default_value = true,
        order = "1"
    }, {
        type = "bool-setting",
        name = "bumble-bots-enable-larvae",
        setting_type = "startup",
        default_value = true,
        order = "2"
    }, {
        type = "bool-setting",
        name = "bumble-bots-enable-hive-animation",
        setting_type = "startup",
        default_value = true,
        order = "3"
    }, {
        type = "bool-setting",
        name = "bumble-bots-enable-flowers",
        setting_type = "startup",
        default_value = true,
        order = "4"
    }, {
        type = "bool-setting",
        name = "bumble-bots-show-bots-on-map",
        setting_type = "startup",
        default_value = true,
        order = "5"
    }, {
        type = "string-setting",
        name = "bumble-bots-bee-size",
        setting_type = "startup",
        default_value = "normal",
        allowed_values = {
            "large", "normal", "small", "tiny"
        },
        order = "6"
    }, {
        type = "double-setting",
        name = "bumble-bots-hive-volume",
        setting_type = "startup",
        default_value = 1,
        maximum_value = 10.0,
        minimum_value = 0.0,
        order = "a"
    }, {
        type = "double-setting",
        name = "bumble-bots-bee-volume",
        setting_type = "startup",
        default_value = 1,
        maximum_value = 10.0,
        minimum_value = 0.0,
        order = "b"
    }, {
        type = "double-setting",
        name = "bumble-bots-bush-volume",
        setting_type = "startup",
        default_value = 1,
        maximum_value = 10.0,
        minimum_value = 0.0,
        order = "b"
    }

})
if mods["boblogistics"] or mods["bobwarfare"] then
    data:extend{
        {
            type = "bool-setting",
            name = "bumble-bots-enable-bob-bot-part-reskin",
            setting_type = "startup",
            default_value = true,
            order = "1"
        }
    }
end
