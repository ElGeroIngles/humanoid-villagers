# > humvil:zzz/link/conversations/main
# @s is a human linked to an entity
# Macros:
# $(n_of_participants): Number of possible entities that could participate in the conversation

# Get how many of them will participate in the conversation:
$execute store result score $n_of_conversators humvil.conversations run random value 1..$(n_of_participants)
