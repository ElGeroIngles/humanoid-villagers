# @s is a human that will do the "double crouching" animation

# Change pose:
execute if score @s humvil.animations.double_crouching matches 8..10 run data modify entity @s pose set value "crouching"
execute if score @s humvil.animations.double_crouching matches 3..5 run data modify entity @s pose set value "crouching"

# Reset:
scoreboard players remove @s humvil.animations.double_crouching 1
