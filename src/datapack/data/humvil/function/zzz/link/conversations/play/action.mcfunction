# > humvil:zzz/link/conversations/play/main
# @n[tag=humvil.conversation.participant.id.$(id)] --> Entity that participates in a conversation given an id
# @n[tag=humvil.conversation.participant.$(by).this] --> Entity that participates in a conversation given its order of participants in its conversation
# @n[tag=humvil.conversation.participant.1.this] --> Entity that stores all of the conversation's data (id, cooldowns...)
# @n[tag=humvil.conversation.participant.in_conversation] --> Entity that participates in a conversation
# @s is a player who will hear the conversation
# Play the next line of a conversation given its id
# Macros:
# $(id): Id of the conversation
# $(next): Next line of the conversation
# $(by): Number of the participant who will say the line

# Test:
# $say $(id)
# $say $(next)
# $say $(by)

# Say next line:
$tellraw @s ["<",{selector:"@n[tag=humvil.conversation.participant.$(by).this,tag=humvil.conversation.participant.id.$(id)]"},"> ",$(next)]

# Get conversation:
$data modify storage humvil:temp CurrentConversation set from storage humvil:conversations Current[{id:$(id)}]

# Remove line from conversation and setup for next line:
data remove storage humvil:temp CurrentConversation.conversation[0]
data modify storage humvil:temp CurrentConversation.by set from storage humvil:temp CurrentConversation.conversation[0].participant
data modify storage humvil:temp CurrentConversation.next set from storage humvil:temp CurrentConversation.conversation[0].text

# Update conversation:
$data modify storage humvil:conversations Current[{id:$(id)}] set from storage humvil:temp CurrentConversation

# Get length of the array:
execute store result score $len humvil.temp run data get storage humvil:temp CurrentConversation.conversation

# If it has more lines of dialog, add cooldown for the next lines:
$execute if score $len humvil.temp matches 1.. store result score @n[tag=humvil.conversation.participant.1.this,tag=humvil.conversation.participant.id.$(id)] humvil.conversations.wait_between_lines run random value 15..35
execute if score $len humvil.temp matches 1.. run return fail

# If not, reset conversation:
$tag @e[tag=humvil.conversation.participant.id.$(id)] add humvil.conversation.temp.reset_this

scoreboard players reset @e[tag=humvil.conversation.temp.reset_this] humvil.conversations.id
scoreboard players reset @n[tag=humvil.conversation.participant.1.this,tag=humvil.conversation.temp.reset_this] humvil.conversations.wait_between_lines
scoreboard players operation @n[tag=humvil.conversation.participant.1.this,tag=humvil.conversation.temp.reset_this] humvil.conversations = $humans_conversate_cooldown humvil.settings

scoreboard players reset @s humvil.conversations.id.receptor

tag @e[tag=humvil.conversation.temp.reset_this] remove humvil.conversation.in_conversation

tag @e[tag=humvil.conversation.temp.reset_this] remove humvil.conversation.participant.1.this
tag @e[tag=humvil.conversation.temp.reset_this] remove humvil.conversation.participant.2.this
tag @e[tag=humvil.conversation.temp.reset_this] remove humvil.conversation.participant.3.this
tag @e[tag=humvil.conversation.temp.reset_this] remove humvil.conversation.participant.4.this
tag @e[tag=humvil.conversation.temp.reset_this] remove humvil.conversation.participant.5.this

$tag @e[tag=humvil.conversation.temp.reset_this] remove humvil.conversation.participant.id.$(id)

tag @e[tag=humvil.conversation.temp.reset_this] remove humvil.conversation.temp.reset_this

$data remove storage humvil:conversations Current[{id:$(id)}]
