data:extend({
    {
        type = "bool-setting",
        name = "bumble-bots-enable-wasps",
        setting_type = "startup",
        default_value = true,
        order = "1"
    },
    {
        type = "bool-setting",
        name = "bumble-bots-enable-larvae",
        setting_type = "startup",
        default_value = true,
        order = "2"
    },
    {
        type = "bool-setting",
        name = "bumble-bots-enable-hive-animation",
        setting_type = "startup",
        default_value = true,
        order = "3"
    },
    {
        type = "double-setting",
        name = "bumble-bots-hive-volume",
        setting_type = "startup",
        default_value = 1,
        maximum_value = 10.0,
        minimum_value = 0.0,
        order = "a"
    },
    {
        type = "double-setting",
        name = "bumble-bots-bee-volume",
        setting_type = "startup",
        default_value = 1,
        maximum_value = 10.0,
        minimum_value = 0.0,
        order = "b"
    },


})