# @s is a human which is linked to an entity
# Expected:
# @n[tag=humvil.api.output.this_entity] --> Is the mannequin which the human is linked to
# The tag "humvil.api.output.this_entity" is only a temp tag and should be removed for another one as soon as possible

# Get entity:
tag @s add humvil.temp
scoreboard players operation $id humvil.id = @s humvil.id
tag @e[tag=humvil.linked,tag=!humvil.temp,type=minecraft:mannequin,predicate=humvil:lib/check_id] add humvil.api.output.this_entity
tag @s remove humvil.temp
