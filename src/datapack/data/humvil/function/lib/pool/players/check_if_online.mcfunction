# > humvil:lib/pool/players/someone_left & humvil:lib/pool/players/check_if_online

# Check player by player if they are online, if not, remove it from the list of online players:
function humvil:lib/pool/players/check_if_online_2 with storage humvil:temp List[-1]
scoreboard players remove #ListSize humvil.players.Dummy 1
execute if score #ListSize humvil.players.Dummy matches 1.. run data remove storage humvil:temp List[-1]
execute if score #ListSize humvil.players.Dummy matches 1.. run function humvil:lib/pool/players/check_if_online
