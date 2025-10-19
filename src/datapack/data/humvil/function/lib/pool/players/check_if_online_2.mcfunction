# > humvil:lib/pool/players/check_if_online
# Macros:
# $(Name): Name of the player to check.

# If player is not online, remove it from the list:
$execute unless entity $(Name) run function humvil:lib/pool/players/leave {Name:"$(Name)"}
