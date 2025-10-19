# > humvil:zzz/tick
# @s is a player that has joined the world
# Output:
# Add @s to a pool of players that have entered this world

# Reset:
scoreboard players reset @s humvil.players.JoinGame

# Playercount Update:
scoreboard players add #PlayerCount humvil.players.Dummy 1
scoreboard players add #PlayerCountPrev humvil.players.Dummy 1

# Add player to the list:
execute at @s run summon minecraft:chest_minecart ~ 500 ~ {Tags:["humvil.temp"]}
loot replace entity @n[tag=humvil.temp] container.0 loot humvil:fill_player_head
function humvil:lib/pool/players/check_if_already_exists with entity @n[tag=humvil.temp] Items[0].components."minecraft:profile"

# Reset:
item replace entity @n[tag=humvil.temp] container.0 with minecraft:air
tp @n[tag=humvil.temp] ~ -500 ~
kill @n[tag=humvil.temp]
