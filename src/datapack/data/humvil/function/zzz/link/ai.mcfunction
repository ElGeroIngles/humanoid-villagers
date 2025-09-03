# > humvil:zzz/tick
# @s is a human linked to an entity

# Get the entity that the human is linked to:
function humvil:api/get/original_entity

# Copy ai:
data modify storage humvil:temp temp set from entity @n[tag=humvil.api.output.this_entity]
data modify entity @s Pos set from storage humvil:temp temp.Pos
data modify entity @s Rotation set from storage humvil:temp temp.Rotation

# Offset the human by a little bit so its hitbox is always covered:
execute at @s rotated as @s run tp ^ ^ ^0.005

# Reset:
tag @n[tag=humvil.api.output.this_entity] remove humvil.api.output.this_entity
