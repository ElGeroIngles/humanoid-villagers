# > humvil:zzz/link/conversations/play/cooldown/main
# @s is the entity participant one of the conversation with the id in its scoreboard
# Macros:
# $(id): Id of the conversation

# Test:
#tellraw @a "humvil:zzz/link/conversations/play/cooldown/get_conversation"

# Get conversation:
$data modify storage humvil:temp ThisConversation set from storage humvil:conversations Current[{id:$(id)}]

# Play next:
tag @s add humvil.temp.conversation.one
execute as @a if score @s humvil.conversations.id.receptor = @n[tag=humvil.temp.conversation.one] humvil.conversations.id run function humvil:zzz/link/conversations/play/action with storage humvil:temp ThisConversation
tag @s remove humvil.temp.conversation.one
