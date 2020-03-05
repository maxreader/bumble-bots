require("prototypes.logistic-bee")
require("prototypes.construction-bee")
require("prototypes.hive")
require("prototypes.defender-wasp")
require("prototypes.distractor-wasp")
require("prototypes.destroyer-hornet")
require("prototypes.logistic-containers")

--[[Make bees show up on map
for k,v in pairs(data.raw["logistic-robot"]["logistic-robot"].flags) do
  if v == "not-on-map" then
    table.remove(data.raw["logistic-robot"]["logistic-robot"].flags,k)
  end
end
data.raw["logistic-robot"]["logistic-robot"].map_color = {r=1,g=1,b=0.2,a=0.6}]]
