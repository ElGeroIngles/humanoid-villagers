# > humvil:zzz/tick
# @s is a entity linked to another one

# Get the entity that the human is linked to:
tag @s add humvil.temp
scoreboard players operation $id humvil.id = @s humvil.id
execute unless entity @e[tag=humvil.linked,tag=!humvil.temp,type=#humvil:human,predicate=humvil:lib/check_id] run function humvil:zzz/link/kill
tag @s remove humvil.temp
