# > humvil:zzz/link/conversations/play/id_participants
# Macros:
# $(id): Id of the conversation
# Something went wrong during this conversation, so cancel it

# Test:
#tellraw @a "CANCEL"

# Reset:
$tag @e[tag=humvil.conversation.participant.id.$(id)] add humvil.conversation.temp.reset_this

scoreboard players reset @e[tag=humvil.conversation.temp.reset_this] humvil.conversations.id
scoreboard players reset @n[tag=humvil.conversation.participant.1.this,tag=humvil.conversation.temp.reset_this] humvil.conversations.wait_between_lines
scoreboard players operation @n[tag=humvil.conversation.participant.1.this,tag=humvil.conversation.temp.reset_this] humvil.conversations = $humans_conversate_cooldown humvil.settings

scoreboard players reset @s humvil.conversations.id.receptor

tag @e[tag=humvil.conversation.temp.reset_this] remove humvil.conversation.in_conversation

#tag @e[tag=humvil.conversation.temp.reset_this] remove humvil.conversation.participant.1.this
tag @e remove humvil.conversation.participant.1.this
tag @e[tag=humvil.conversation.temp.reset_this] remove humvil.conversation.participant.2.this
tag @e[tag=humvil.conversation.temp.reset_this] remove humvil.conversation.participant.3.this
tag @e[tag=humvil.conversation.temp.reset_this] remove humvil.conversation.participant.4.this
tag @e[tag=humvil.conversation.temp.reset_this] remove humvil.conversation.participant.5.this

$tag @e[tag=humvil.conversation.temp.reset_this] remove humvil.conversation.participant.id.$(id)

tag @e[tag=humvil.conversation.temp.reset_this] remove humvil.conversation.temp.reset_this

$data remove storage humvil:conversations Current[{id:$(id)}]
