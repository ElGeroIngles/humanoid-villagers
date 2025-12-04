# > humvil:zzz/link/ai
# @s is a human linked to an entity

# Double crouching:
tag @s add humvil.temp.this_entity_animation
execute as @n[tag=humvil.api.output.this_entity] at @s rotated as @s anchored eyes positioned ^ ^ ^ if function humvil:lib/looking_at/possible_interaction if predicate humvil:random/very_rare run scoreboard players set @n[tag=humvil.temp.this_entity_animation] humvil.animations.double_crouching 10
tag @e remove humvil.ignore_itself

# Water animation:
execute if predicate humvil:flags/is_on_fuild run data modify entity @s pose set value "swimming"
execute unless predicate humvil:flags/is_on_fuild if data entity @s {pose:"swimming"} run data modify entity @s pose set value "standing"

# Falling animations:
execute as @n[tag=humvil.api.output.this_entity] at @s if predicate humvil:animations/fall run data modify entity @n[tag=humvil.temp.this_entity_animation] pose set value "fall_flying"

# In-doors:
execute if data entity @s {pose:"sleeping"} run tag @s add humvil.temp.animations_sleeping

execute if entity @s[tag=!humvil.temp.animations_sleeping] as @n[tag=humvil.api.output.this_entity] if predicate humvil:flags/is_night unless predicate humvil:flags/can_see_sky run scoreboard players add @n[tag=humvil.temp.this_entity_animation] humvil.animations.in_doors 1
execute if entity @s[tag=!humvil.temp.animations_sleeping] as @n[tag=humvil.api.output.this_entity] unless predicate humvil:flags/is_night run scoreboard players set @n[tag=humvil.temp.this_entity_animation] humvil.animations.in_doors 0
execute if entity @s[tag=!humvil.temp.animations_sleeping] as @n[tag=humvil.api.output.this_entity] if predicate humvil:flags/can_see_sky run scoreboard players set @n[tag=humvil.temp.this_entity_animation] humvil.animations.in_doors 0

scoreboard players set @s[tag=humvil.temp.animations_sleeping] humvil.animations.in_doors 0

execute if score @s[tag=!humvil.temp.animations_sleeping] humvil.animations.in_doors matches 200.. run data modify entity @s pose set value "crouching"

# Reset:
tag @s remove humvil.temp.animations_sleeping
tag @s remove humvil.temp.this_entity_animation
