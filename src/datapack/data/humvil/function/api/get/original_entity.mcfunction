# @s is a human which is linked to an entity
# Expected:
# @n[tag=humvil.api.output.this_entity] --> Is the original entity which the human is linked to
# The tag "humvil.api.output.this_entity" is only a temp tag and should be removed for another one as soon as possible

# Get entity:
tag @s add humvil.temp
execute as @e[tag=humvil.human.transformed,tag=!humvil.temp] if score @s humvil.id = @n[tag=humvil.temp] humvil.id run tag @s add humvil.api.output.this_entity
tag @s remove humvil.temp
