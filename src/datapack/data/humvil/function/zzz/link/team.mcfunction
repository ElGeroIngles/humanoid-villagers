# > humvil:lib/transform/humanize_villager
# Create a custom team with no collisions and join both entities to it
# Macros:
# $(id) --> The id that both entities have

# Create team:
$team add humvil.$(id)
$team modify humvil.$(id) collisionRule pushOwnTeam

# Join the team:
$execute as @e if score @s humvil.id matches $(id) run team join humvil.$(id)
