# > humvil:zzz/tick
# @s is a linked entity
# Check if @s has been damaged, if so, then mark the mannequin as damaged too so it appears as red

# Check if health matches last tick:
execute store result score @s humvil.health run data get entity @s Health 100
execute if score @s humvil.health = @s humvil.health_check run return fail

# If not, update it and damage it's mannequin:
scoreboard players operation @s humvil.health_check = @s humvil.health
function humvil:api/get/linked_entity
damage @n[tag=humvil.api.output.this_entity] 0 minecraft:player_attack
tag @n[tag=humvil.api.output.this_entity] remove humvil.api.output.this_entity
