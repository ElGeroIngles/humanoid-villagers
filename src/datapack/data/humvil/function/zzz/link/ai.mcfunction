# > humvil:zzz/tick
# @s is a human linked to an entity

# Get the entity that the human is linked to (it will be "@n[tag=humvil.api.output.this_entity]"):
function humvil:api/get/original_entity

# Copy ai:
tp @s @n[tag=humvil.api.output.this_entity]
execute rotated as @n[tag=humvil.api.output.this_entity] run rotate @s ~ ~

execute if data entity @n[tag=humvil.api.output.this_entity] sleeping_pos run data modify entity @s sleeping_pos set from entity @n[tag=humvil.api.output.this_entity] sleeping_pos
execute if data entity @s sleeping_pos unless data entity @n[tag=humvil.api.output.this_entity] sleeping_pos run data modify entity @s sleeping_pos set from entity @n[tag=humvil.api.output.this_entity] Pos

# Offset the human by a little bit so its hitbox is always covered:
execute at @s rotated as @s run tp ^ ^ ^0.005

# Reset:
tag @n[tag=humvil.api.output.this_entity] remove humvil.api.output.this_entity
