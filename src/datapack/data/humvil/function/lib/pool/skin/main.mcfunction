# > humvil:lib/transform/humanize_villager
# @s is an entity with an already specified gender and model type.
# Output:
# humvil:lib output --> Skin of the human

# Reset previous pool:
data modify storage humvil:lib output set value ''
data modify storage humvil:pool skins set value []

# Get all skins:
execute if score @s humvil.transform.gender matches 0 if score @s humvil.transform.model_type matches 0 run function #humvil:pool/skins/male/wide
execute if score @s humvil.transform.gender matches 0 if score @s humvil.transform.model_type matches 1 run function #humvil:pool/skins/male/slim
execute if score @s humvil.transform.gender matches 1 if score @s humvil.transform.model_type matches 0 run function #humvil:pool/skins/female/wide
execute if score @s humvil.transform.gender matches 1 if score @s humvil.transform.model_type matches 1 run function #humvil:pool/skins/female/slim


execute if score @s humvil.transform.gender matches 2.. if score @s humvil.transform.model_type matches 0 run function #humvil:pool/skins/both/wide
execute if score @s humvil.transform.gender matches 2.. if score @s humvil.transform.model_type matches 1 run function #humvil:pool/skins/both/slim

# Get length of array:
execute store result score #len humvil.temp run data get storage humvil:pool skins

# Prepare macro call:
execute store result storage humvil:temp macro.index int 1 run scoreboard players remove #len humvil.temp 1
data modify storage humvil:temp macro.array set value "humvil:pool skins"

# Get a random name:
function humvil:lib/pool/random/main with storage humvil:temp macro
