# > humvil:zzz/tick
# @s is the entity participant one of the conversation with the id in its scoreboard
# Wait until cooldown and play the following line of the conversation

# Test:
#tellraw @a "humvil:zzz/link/conversations/play/cooldown/main"

# Wait:
scoreboard players remove @s humvil.conversations.wait_between_lines 1
execute if score @s humvil.conversations.wait_between_lines matches 1.. run return fail

# Get conversation and play it:
execute store result storage humvil:temp ConversationId.id int 1 run scoreboard players get @s humvil.conversations.id
function humvil:zzz/link/conversations/play/cooldown/get_conversation with storage humvil:temp ConversationId
