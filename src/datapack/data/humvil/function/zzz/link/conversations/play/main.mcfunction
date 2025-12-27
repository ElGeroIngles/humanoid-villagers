# > humvil:zzz/link/conversations/main & Anywhere
# Play a given conversation

# Test:
#tellraw @a "humvil:zzz/link/conversations/play/main"
#tellraw @a ["",{color:"aqua",text:"Hello, I'm: "},{color:"blue",selector:"@s"},"\n",{color:"aqua",text:"My tags are: "},{color:"blue",nbt:"Tags",entity:"@s"}]

# Add it to the list of ongoing conversations:
data modify storage humvil:temp temp.play.conversation set from storage humvil:temp Conversation.conversation
execute store result storage humvil:temp temp.play.id int 1 run scoreboard players get $id humvil.conversations
data modify storage humvil:temp temp.play.next set from storage humvil:temp Conversation.conversation[0].text
data modify storage humvil:temp temp.play.by set from storage humvil:temp Conversation.conversation[0].participant

data modify storage humvil:conversations Current append from storage humvil:temp temp.play

# Add ids to the participants and play the conversation:
function humvil:zzz/link/conversations/play/id_participants with storage humvil:temp temp.play
scoreboard players add $id humvil.conversations 1

# Example of a conversation layout:
# {
#     "id": 1234,
#     "conversation": [
#         {
#             "participant": 1,
#             "text": "'Hello World!'"
#         },
#         {
#             "participant": 2,
#             "text": "'Bye World!'"
#         }
#     ],
#     "by": 1,
#     "next": "'Hello World!'"
# }
# id: Id of the conversation
# conversation: Array containing every line of the dialog
# |-> participant: Who will say that line
# \-> test: The actual line to say
# next: The next line that the dialog needs to play
# by: Who will say the next line of the dialog
