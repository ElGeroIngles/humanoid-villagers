# > humvil:lib/transform/humanize_villager
# @s is an entity with an already specified gender.
# Output:
# humvil:lib output --> Name of the human

# Reset previous pool:
data modify storage humvil:lib output set value ''
data modify storage humvil:pool names set value []

# Get all names:
execute if score @s humvil.transform.gender matches 0 run function #humvil:pool/names/male
execute if score @s humvil.transform.gender matches 1 run function #humvil:pool/names/female
execute if score @s humvil.transform.gender matches 2.. run function #humvil:pool/names/all

# Get length of array:
execute store result score $len humvil.temp run data get storage humvil:pool names

# Prepare macro call:
execute store result storage humvil:temp macro.index int 1 run scoreboard players remove $len humvil.temp 1
data modify storage humvil:temp macro.array set value "humvil:pool names"

# Get a random name:
function humvil:lib/pool/random/main with storage humvil:temp macro
