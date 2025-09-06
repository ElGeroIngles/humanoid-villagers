# > humvil:zzz/tick
# @s is a human linked to an entity

# Get the entity that the human is linked to:
function humvil:api/get/original_entity

# Copy position and rotation:
tp @s @n[tag=humvil.api.output.this_entity]
execute rotated as @n[tag=humvil.api.output.this_entity] run rotate @s ~ ~

# Offset the human by a little bit so its hitbox is always covered:
execute at @s rotated as @s run tp ^ ^ ^0.005

# Reset:
tag @n[tag=humvil.api.output.this_entity] remove humvil.api.output.this_entity
