# Add new players to an array of all players that have joined this world:
execute as @a[scores={humvil.players.JoinGame=1..}] run function humvil:lib/pool/players/join

# Playercount Check:
execute store result score #PlayerCount humvil.players.Dummy if entity @a
execute if score #PlayerCount humvil.players.Dummy < #PlayerCountPrev humvil.players.Dummy run function humvil:lib/pool/players/someone_left
scoreboard players operation #PlayerCountPrev humvil.players.Dummy = #PlayerCount humvil.players.Dummy

# Kill the entity if the one other one is dead:
execute as @e[tag=humvil.linked] run function humvil:zzz/link/check_kill

# Copy ai from original entity to its human:
execute as @e[tag=humvil.human] run function humvil:zzz/link/ai
