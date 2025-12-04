# > humvil:zzz/tick
# @s is a human linked to an entity

# Get the entity that the human is linked to (it will be "@n[tag=humvil.api.output.this_entity]"):
function humvil:api/get/original_entity

# Adjust hitbox if baby or adult:
execute if entity @n[tag=humvil.api.output.this_entity,predicate=humvil:flags/is_baby] run attribute @s minecraft:scale modifier add humvil:cover_human_hitbox_baby -0.5 add_multiplied_base
execute if entity @n[tag=humvil.api.output.this_entity,predicate=!humvil:flags/is_baby] run attribute @s minecraft:scale modifier remove humvil:cover_human_hitbox_baby

# Copy ai:
tp @s @n[tag=humvil.api.output.this_entity]
execute rotated as @n[tag=humvil.api.output.this_entity] run rotate @s ~ ~

# Animations:
data modify entity @s pose set value "standing"
execute unless score $animated_humans humvil.settings matches 0 run function humvil:zzz/link/animations/main

execute if score @s humvil.animations.double_crouching matches 1.. run function humvil:zzz/link/animations/double_crouching/control

# Set sleeping pose:
execute if data entity @n[tag=humvil.api.output.this_entity] sleeping_pos unless data entity @s {pose:"sleeping"} run data modify entity @s sleeping_pos set from entity @n[tag=humvil.api.output.this_entity] sleeping_pos
execute if data entity @n[tag=humvil.api.output.this_entity] sleeping_pos unless data entity @s {pose:"sleeping"} run data modify entity @s pose set value "sleeping"
execute if data entity @s {pose:"sleeping"} unless data entity @n[tag=humvil.api.output.this_entity] sleeping_pos run data remove entity @s sleeping_pos
execute if data entity @s {pose:"sleeping"} unless data entity @n[tag=humvil.api.output.this_entity] sleeping_pos run data modify entity @s pose set value "standing"
execute unless data entity @s {pose:"sleeping"} run tag @s remove humvil.human.sleeping_adjusted

# Adjust the "NPC" tag below the mannequin's name in case it changed:
execute if score $npc_tag humvil.settings matches 1 unless data entity @s hide_description run data modify entity @s hide_description set value 1b
execute if score $npc_tag humvil.settings matches 0 if data entity @s hide_description run data remove entity @s hide_description

# Override the "NPC" tag below the mannequin's name in case it changed:
execute if score $npc_tag humvil.settings matches 0 if score $custom_npc_tag humvil.settings matches 1 run data modify entity @s description set from storage humvil:lib Settings.CustomTag

# Hide the specified layers as in the settings:
data modify entity @s hidden_layers set from storage humvil:lib Settings.HiddenLayers

# Offset the human by a little bit so its hitbox is always covered:
execute at @s rotated as @s run tp ^ ^ ^0.005

# Try a conversation if possible:
execute if score $humans_can_conversate humvil.settings matches 1 unless score @s humvil.conversations matches 1.. run function humvil:zzz/link/conversations/main

# Reset:
tag @n[tag=humvil.api.output.this_entity] remove humvil.api.output.this_entity
