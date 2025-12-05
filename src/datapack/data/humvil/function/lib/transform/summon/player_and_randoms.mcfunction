# > humvil:lib/transform/humanize_villager
# @s is a non-human villager!
# Get which player the mannequin will be
# or
# Get the properties for this mannequin

# Get skins:
function humvil:lib/transform/summon/get_properties

# Fusion both arrays (players and randoms):
data modify storage humvil:pool mixed set from storage humvil:lib Global.List
data modify storage humvil:pool mixed append from storage humvil:pool skins[]

# Get length of array:
execute store result score $len humvil.temp run data get storage humvil:pool mixed

# Prepare macro call:
execute store result storage humvil:temp macro.index int 1 run scoreboard players remove $len humvil.temp 1
data modify storage humvil:temp macro.array set value "humvil:pool mixed"

# Get a random value:
function humvil:lib/pool/random/main with storage humvil:temp macro

# If a player was selected, format the response:
execute if data storage humvil:lib output.Name run function humvil:lib/transform/summon/format_name with storage humvil:lib output
say abc
# If a random one was selected, format the response:
#execute unless data storage humvil:lib output.Name run function humvil:lib/transform/summon/get_properties
