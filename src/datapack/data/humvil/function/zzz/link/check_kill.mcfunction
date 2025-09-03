# > humvil:zzz/tick
# @s is a entity linked to another one

# Get the entity that the human is linked to:
tag @s add humvil.temp
scoreboard players set $is_not_alone humvil.temp 0
execute as @e[tag=humvil.linked,tag=!humvil.temp] if score @s humvil.id = @n[tag=humvil.temp] humvil.id store success score $is_not_alone humvil.temp if entity @s
tag @s remove humvil.temp

# Kill if it's alone:
execute if score $is_not_alone humvil.temp matches 0 run kill @s
