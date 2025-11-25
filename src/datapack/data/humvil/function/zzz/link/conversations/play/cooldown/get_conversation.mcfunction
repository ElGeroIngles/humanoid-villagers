# > humvil:zzz/link/conversations/play/cooldown/main
# Macros:
# $(id): Id of the conversation

# Get conversation:
$data modify storage humvil:temp ThisConversation set from storage humvil:conversations Current[{id:$(id)}]

# Play next:
$execute as @a[tag=humvil.conversation.receptor.$(id)] run function humvil:zzz/link/conversations/play/action with storage humvil:temp ThisConversation
