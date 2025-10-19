# Check if a given player already exists in the list of online players
# Macros:
# $(name): Name of the player to check
# Output:
# 1 --> Doesn't exists
# 0 --> Exists

# Check:
$execute if data storage humvil:lib Players.List[{Name:"$(name)"}] run return 0

# Add it if it doesn't exists:
data modify storage humvil:lib Players.List append value {Name:"PLACEHOLDER"}
data modify storage humvil:lib Players.List[-1].Name set from entity @n[tag=humvil.temp] Items[0].components."minecraft:profile".name

# Also add it to the list of players that have joined at least once:
execute if entity @s[tag=!humvil.player_registered] run data modify storage humvil:lib Global.List append from storage humvil:lib Players.List[-1]
tag @s[tag=!humvil.player_registered] add humvil.player_registered
