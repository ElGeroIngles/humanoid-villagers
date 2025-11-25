# > humvil:lib/pool/players/check_if_online_2
# Macros:
# $(Name): Name of the player to remove from the list, as it is offline.

# Test:
# tellraw @a ["The player who left is: ",{"nbt":"List[-1].Name","storage":"humvil:temp"}]

# Remove offline player from list:
$data remove storage humvil:lib Players.List[{Name:"$(Name)"}]
