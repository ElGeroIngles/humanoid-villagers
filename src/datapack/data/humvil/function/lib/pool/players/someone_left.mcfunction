# > humvil:zzz/tick
# Number of online players doesn't match the one from the previous tick

# Remove offline players from the list:
data modify storage humvil:temp List set from storage humvil:lib Players.List
execute store result score #ListSize humvil.players.Dummy if data storage humvil:temp List[]
function humvil:lib/pool/players/check_if_online
scoreboard players reset #ListSize humvil.players.Dummy
data remove storage humvil:temp List
