# > humvil:zzz/link/conversations/main
# @s is a human linked to an entity
# Macros:
# $(participants): Number of entities that will participate in the conversation

# Randomize which entities will participate:
execute at @s as @e[distance=..10,type=#humvil:can_conversate_with,limit=5,tag=!humvil.conversation.in_conversation] unless score @s humvil.conversations matches 1.. run tag @s add humvil.conversation.temp
$tag @e[tag=humvil.conversation.temp,limit=$(participants)] add humvil.conversation.participant
tag @e[tag=humvil.conversation.temp] remove humvil.conversation.temp

# @s must participate, so if it doesn't have the tag give it the tag and remove it from someone else:
execute if entity @s[tag=humvil.conversation.participant] run return fail
tag @e[sort=random,limit=1,tag=humvil.conversation.participant] remove humvil.conversation.participant
tag @s add humvil.conversation.participant
