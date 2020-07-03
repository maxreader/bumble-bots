local set_logistic_sprites_with_mask = require('prototypes.logistic-bee')
local set_construction_sprites_with_mask = require('prototypes.construction-bee')

if mods["angelsindustries"] then
    set_logistic_sprites_with_mask("cargo-robot", {161, 129, 0, 179}, 0.75)
    set_logistic_sprites_with_mask("cargo-robot-2", {0, 0, 0, 179}, 0.85)
    set_construction_sprites_with_mask("angels-construction-robot", {161, 129, 0, 179}, 0.75)
end