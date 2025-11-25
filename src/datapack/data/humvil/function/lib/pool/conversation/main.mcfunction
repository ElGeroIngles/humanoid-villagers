# > humvil:zzz/link/conversations/main
# @s is an entity with an already specified gender.
# Output:
# humvil:lib output --> Conversation to play

# Reset previous pool:
data modify storage humvil:lib output set value ''
data modify storage humvil:pool conversations set value []

# Get all conversations:
execute unless score $n_of_conversators humvil.conversations matches 2..5 run function #humvil:pool/conversations/1_participant
execute if score $n_of_conversators humvil.conversations matches 2 run function #humvil:pool/conversations/2_participants
execute if score $n_of_conversators humvil.conversations matches 3 run function #humvil:pool/conversations/3_participants
execute if score $n_of_conversators humvil.conversations matches 4 run function #humvil:pool/conversations/4_participants
execute if score $n_of_conversators humvil.conversations matches 5 run function #humvil:pool/conversations/5_participants

# Get length of array:
execute store result score $len humvil.temp run data get storage humvil:pool conversations

# Prepare macro call:
execute store result storage humvil:temp macro.index int 1 run scoreboard players remove $len humvil.temp 1
data modify storage humvil:temp macro.array set value "humvil:pool conversations"

# Get a random conversation:
function humvil:lib/pool/random/main with storage humvil:temp macro
