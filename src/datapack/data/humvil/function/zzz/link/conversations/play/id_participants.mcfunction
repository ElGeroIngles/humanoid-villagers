# > humvil:zzz/link/conversations/play/main
# @n[tag=humvil.conversation.participant.id.$(id)] --> Entity that participates in a conversation given an id
# @n[tag=humvil.conversation.participant.$(by).this] --> Entity that participates in a conversation given its order of participants in its conversation
# @n[tag=humvil.conversation.participant.1.this] --> Entity that stores all of the conversation's data (id, cooldowns...)
# @n[tag=humvil.conversation.participant.in_conversation] --> Entity that participates in a conversation
# Macros:
# $(id): Id of the conversation

# Test:
#tellraw @a "humvil:zzz/link/conversations/play/id_participants"
#$tellraw @a "$(id)"
#say @s
#tellraw @a ["",{color:"light_purple",nbt:"temp.play",storage:"humvil:temp"}]

# Give id:
scoreboard players operation @e[tag=humvil.conversation.participant] humvil.conversations.id = $id humvil.conversations

# Change tags:
$tag @n[tag=humvil.conversation.participant,limit=5] add humvil.conversation.participant.id.$(id)

tag @n[tag=humvil.conversation.participant.1] add humvil.conversation.participant.1.this
tag @n[tag=humvil.conversation.participant.2] add humvil.conversation.participant.2.this
tag @n[tag=humvil.conversation.participant.3] add humvil.conversation.participant.3.this
tag @n[tag=humvil.conversation.participant.4] add humvil.conversation.participant.4.this
tag @n[tag=humvil.conversation.participant.5] add humvil.conversation.participant.5.this

tag @n[tag=humvil.conversation.participant,limit=5] add humvil.conversation.in_conversation

tag @n[tag=humvil.conversation.participant,limit=5] remove humvil.conversation.participant
tag @e remove humvil.conversation.participant.1
tag @e remove humvil.conversation.participant.2
tag @e remove humvil.conversation.participant.3
tag @e remove humvil.conversation.participant.4
tag @e remove humvil.conversation.participant.5

# Test:
#tellraw @a "A new play is going to be played with the following arguments:"
#tellraw @a ["Id: ",{score:{name:"$id",objective:"humvil.conversations.id"}}]
#$tellraw @a ["Participants: ",{selector:"@e[tag=humvil.conversation.in_conversation,tag=humvil.conversation.participant.id.$(id)]"}]
#$tellraw @a ["Participant 1: ",{selector:"@n[tag=humvil.conversation.participant.1.this,tag=humvil.conversation.participant.id.$(id)]"}]
#$tellraw @a ["Participant 2: ",{selector:"@n[tag=humvil.conversation.participant.2.this,tag=humvil.conversation.participant.id.$(id)]"}]
#$tellraw @a ["Participant 3: ",{selector:"@n[tag=humvil.conversation.participant.3.this,tag=humvil.conversation.participant.id.$(id)]"}]
#$tellraw @a ["Participant 4: ",{selector:"@n[tag=humvil.conversation.participant.4.this,tag=humvil.conversation.participant.id.$(id)]"}]
#$tellraw @a ["Participant 5: ",{selector:"@n[tag=humvil.conversation.participant.5.this,tag=humvil.conversation.participant.id.$(id)]"}]
#tellraw @a ["It will be heared by: ",{selector:"@a[tag=humvil.conversation.receptor]"}]

#$tellraw @a ["Data of: ",{selector:"@n[tag=humvil.conversation.participant.1.this,tag=humvil.conversation.participant.id.$(id)]"}]
#$tellraw @a ["    Tags: ",{nbt:"Tags",entity:"@n[tag=humvil.conversation.participant.1.this,tag=humvil.conversation.participant.id.$(id)]"}]
#$tellraw @a ["    humvil.conversations.id: ",{score:{objective:"humvil.conversations.id",name:"@n[tag=humvil.conversation.participant.1.this,tag=humvil.conversation.participant.id.$(id)]"}}]
#$tellraw @a ["    humvil.conversations: ",{score:{objective:"humvil.conversations",name:"@n[tag=humvil.conversation.participant.1.this,tag=humvil.conversation.participant.id.$(id)]"}}]
#$tellraw @a ["    humvil.conversations.wait_between_lines: ",{score:{objective:"humvil.conversations.wait_between_lines",name:"@n[tag=humvil.conversation.participant.1.this,tag=humvil.conversation.participant.id.$(id)]"}}]

#$tellraw @a ["Data of: ",{selector:"@n[tag=humvil.conversation.participant.2.this,tag=humvil.conversation.participant.id.$(id)]"}]
#$tellraw @a ["    Tags: ",{nbt:"Tags",entity:"@n[tag=humvil.conversation.participant.2.this,tag=humvil.conversation.participant.id.$(id)]"}]
#$tellraw @a ["    humvil.conversations.id: ",{score:{objective:"humvil.conversations.id",name:"@n[tag=humvil.conversation.participant.2.this,tag=humvil.conversation.participant.id.$(id)]"}}]
#$tellraw @a ["    humvil.conversations: ",{score:{objective:"humvil.conversations",name:"@n[tag=humvil.conversation.participant.2.this,tag=humvil.conversation.participant.id.$(id)]"}}]
#$tellraw @a ["    humvil.conversations.wait_between_lines: ",{score:{objective:"humvil.conversations.wait_between_lines",name:"@n[tag=humvil.conversation.participant.2.this,tag=humvil.conversation.participant.id.$(id)]"}}]

#$tellraw @a ["Data of: ",{selector:"@n[tag=humvil.conversation.participant.3.this,tag=humvil.conversation.participant.id.$(id)]"}]
#$tellraw @a ["    Tags: ",{nbt:"Tags",entity:"@n[tag=humvil.conversation.participant.3.this,tag=humvil.conversation.participant.id.$(id)]"}]
#$tellraw @a ["    humvil.conversations.id: ",{score:{objective:"humvil.conversations.id",name:"@n[tag=humvil.conversation.participant.3.this,tag=humvil.conversation.participant.id.$(id)]"}}]
#$tellraw @a ["    humvil.conversations: ",{score:{objective:"humvil.conversations",name:"@n[tag=humvil.conversation.participant.3.this,tag=humvil.conversation.participant.id.$(id)]"}}]
#$tellraw @a ["    humvil.conversations.wait_between_lines: ",{score:{objective:"humvil.conversations.wait_between_lines",name:"@n[tag=humvil.conversation.participant.3.this,tag=humvil.conversation.participant.id.$(id)]"}}]

#$tellraw @a ["Data of: ",{selector:"@n[tag=humvil.conversation.participant.4.this,tag=humvil.conversation.participant.id.$(id)]"}]
#$tellraw @a ["    Tags: ",{nbt:"Tags",entity:"@n[tag=humvil.conversation.participant.4.this,tag=humvil.conversation.participant.id.$(id)]"}]
#$tellraw @a ["    humvil.conversations.id: ",{score:{objective:"humvil.conversations.id",name:"@n[tag=humvil.conversation.participant.4.this,tag=humvil.conversation.participant.id.$(id)]"}}]
#$tellraw @a ["    humvil.conversations: ",{score:{objective:"humvil.conversations",name:"@n[tag=humvil.conversation.participant.4.this,tag=humvil.conversation.participant.id.$(id)]"}}]
#$tellraw @a ["    humvil.conversations.wait_between_lines: ",{score:{objective:"humvil.conversations.wait_between_lines",name:"@n[tag=humvil.conversation.participant.4.this,tag=humvil.conversation.participant.id.$(id)]"}}]

#$tellraw @a ["Data of: ",{selector:"@n[tag=humvil.conversation.participant.5.this,tag=humvil.conversation.participant.id.$(id)]"}]
#$tellraw @a ["    Tags: ",{nbt:"Tags",entity:"@n[tag=humvil.conversation.participant.5.this,tag=humvil.conversation.participant.id.$(id)]"}]
#$tellraw @a ["    humvil.conversations.id: ",{score:{objective:"humvil.conversations.id",name:"@n[tag=humvil.conversation.participant.5.this,tag=humvil.conversation.participant.id.$(id)]"}}]
#$tellraw @a ["    humvil.conversations: ",{score:{objective:"humvil.conversations",name:"@n[tag=humvil.conversation.participant.5.this,tag=humvil.conversation.participant.id.$(id)]"}}]
#$tellraw @a ["    humvil.conversations.wait_between_lines: ",{score:{objective:"humvil.conversations.wait_between_lines",name:"@n[tag=humvil.conversation.participant.5.this,tag=humvil.conversation.participant.id.$(id)]"}}]

# Cancel if something went wrong:
$execute unless entity @n[tag=humvil.conversation.participant.1.this,tag=humvil.conversation.participant.id.$(id)] run function humvil:zzz/link/conversations/play/cancel {id:$(id)}

# Add id to player:
$scoreboard players set @a[tag=humvil.conversation.receptor] humvil.conversations.id.receptor $(id)

# Play:
execute if data storage humvil:conversations Current[0] as @a[tag=humvil.conversation.receptor] run function humvil:zzz/link/conversations/play/action with storage humvil:temp temp.play

# Change tags to players:
tag @a[tag=humvil.conversation.receptor] remove humvil.conversation.receptor
