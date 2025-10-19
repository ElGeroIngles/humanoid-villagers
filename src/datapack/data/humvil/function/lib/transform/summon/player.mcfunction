# @s is a non-human villager!
# Get which player the mannequin will be:

# Get length of array:
execute store result score $len humvil.temp run data get storage humvil:lib Global.List

# Prepare macro call:
execute store result storage humvil:temp macro.index int 1 run scoreboard players remove $len humvil.temp 1
data modify storage humvil:temp macro.array set value "humvil:lib Global.List"

# Get a random name:
function humvil:lib/pool/random/main with storage humvil:temp macro

# Format profile:
function humvil:lib/transform/summon/format_name with storage humvil:lib output
