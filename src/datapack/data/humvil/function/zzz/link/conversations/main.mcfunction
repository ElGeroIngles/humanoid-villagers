# > humvil:zzz/link/ai
# @s is a human linked to an entity
# Try to do a conversation

# Exit if on cooldown:
execute if score @s humvil.conversations matches 1.. run return fail

# Random chance:
execute store result score $conversation_chance humvil.temp run random value 0..10000
# execute store result score $conversation_chance humvil.temp run random value 0..1

# Exit if failed:
execute if score $conversation_chance humvil.temp > $humans_conversate_frequency humvil.settings run return fail

# Get number of possible entities that could participate in the conversation:
scoreboard players set $possible_conversators humvil.conversations 0
execute at @s as @e[distance=..10,type=#humvil:can_conversate_with,limit=5,tag=!humvil.conversation.in_conversation] unless score @s humvil.conversations matches 1.. run scoreboard players add $possible_conversators humvil.conversations 1

# Exit if no entities can conversate:
execute if score $possible_conversators humvil.conversations matches ..0 run return fail

# Get how many of them will participate in the conversation:
execute store result storage humvil:temp Conversation.n_of_participants int 1 run scoreboard players get $possible_conversators humvil.conversations
function humvil:zzz/link/conversations/n_of_participants with storage humvil:temp Conversation

# Get which entities will participate:
execute store result storage humvil:temp Conversation.participants int 1 run scoreboard players get $n_of_conversators humvil.conversations
function humvil:zzz/link/conversations/get_participants with storage humvil:temp Conversation

# Set the order of participants:
tag @s add humvil.conversation.participant.1
tag @n[tag=humvil.conversation.participant,tag=!humvil.conversation.participant.1] add humvil.conversation.participant.2
tag @n[tag=humvil.conversation.participant,tag=!humvil.conversation.participant.1,tag=!humvil.conversation.participant.2] add humvil.conversation.participant.3
tag @n[tag=humvil.conversation.participant,tag=!humvil.conversation.participant.1,tag=!humvil.conversation.participant.2,tag=!humvil.conversation.participant.3] add humvil.conversation.participant.4
tag @n[tag=humvil.conversation.participant,tag=!humvil.conversation.participant.1,tag=!humvil.conversation.participant.2,tag=!humvil.conversation.participant.3,tag=!humvil.conversation.participant.4] add humvil.conversation.participant.5

# Get a random conversation based on the conditions:
function humvil:lib/pool/conversation/main

# Get which players will hear this conversation:
execute at @s run tag @a[distance=..10] add humvil.conversation.receptor

# Play the conversation:
data modify storage humvil:temp Conversation.conversation set from storage humvil:lib output
function humvil:zzz/link/conversations/play/main
