# > humvil:zzz/link/ai
# @s is a human linked to an entity

# Double crouching:
execute rotated as @p rotated as @n[tag=humvil.api.output.this_entity] if predicate humvil:animations/looking_at_an_entity run say KJBSKFJHDS

# Water animations:
execute if predicate humvil:flags/is_on_fuild run data modify entity @s pose set value "swimming"

# Reset animations:
execute unless predicate humvil:flags/is_on_fuild run data modify entity @s pose set value "standing"
