# @s is a non-human villager!
# Output: Transform @s to a human.

# Cancel if @s is a custom entity or if already humanized:
execute if entity @s[tag=humvil.human.transformed] run return fail
execute if entity @s[tag=smithed.entity] run return fail

# Get male or female (0 for male and 1 for female):
execute store result score @s humvil.transform.gender run random value 0..1

# Get main hand (0 for right-handed and 1 for left-handed):
execute if score $main_hand humvil.settings matches 1 run scoreboard players set @s humvil.transform.main_hand 0
execute if score $main_hand humvil.settings matches 2 run scoreboard players set @s humvil.transform.main_hand 1

execute unless score $main_hand humvil.settings matches 1 unless score $main_hand humvil.settings matches 2 store result score $main_hand_percentage humvil.temp run random value 0..100
execute unless score $main_hand humvil.settings matches 1 unless score $main_hand humvil.settings matches 2 if score $main_hand_percentage humvil.temp <= $right-handed_percentage humvil.settings run scoreboard players set @s humvil.transform.main_hand 0
execute unless score $main_hand humvil.settings matches 1 unless score $main_hand humvil.settings matches 2 if score $main_hand_percentage humvil.temp > $right-handed_percentage humvil.settings run scoreboard players set @s humvil.transform.main_hand 1

execute if score @s humvil.transform.main_hand matches 0 run data modify storage humvil:random mannequin.main_hand set value 'right'
execute if score @s humvil.transform.main_hand matches 1 run data modify storage humvil:random mannequin.main_hand set value 'left'

# Get name:
function humvil:lib/pool/name/main
data modify storage humvil:random mannequin.name set from storage humvil:lib output

# Get the properties for the mannequin (male, female, right-handed, name, skin...):
# If selected "Players that have joined this world and random ones", then randomize between the players and the random ones
execute if score $human_pool humvil.settings matches ..0 store result score $human_pool humvil.temp run random value 0..1

execute if score $human_pool humvil.settings matches 1 run function humvil:lib/transform/summon/player
execute if score $human_pool humvil.settings matches ..0 if score $human_pool humvil.temp matches 0 run function humvil:lib/transform/summon/player

execute if score $human_pool humvil.settings matches 2.. run function humvil:lib/transform/summon/get_properties
execute if score $human_pool humvil.settings matches ..0 if score $human_pool humvil.temp matches 1 run function humvil:lib/transform/summon/get_properties

# Summon:
function humvil:lib/transform/summon/main with storage humvil:random mannequin

# Link entities:
scoreboard players operation @s humvil.id = $global humvil.id
scoreboard players operation @n[tag=humvil.human.needs_config] humvil.id = $global humvil.id
scoreboard players add $global humvil.id 1

# Make them not have collision between each other:
execute store result storage humvil:temp temp.id int 1 run scoreboard players get @s humvil.id
function humvil:zzz/link/team with storage humvil:temp temp

# Make @s invisible:
effect give @s minecraft:invisibility infinite 255 true

# Set name as its human:
data modify entity @s CustomName set from entity @n[tag=humvil.human.needs_config] CustomName

# Set up cooldown for conversations:
scoreboard players set @s humvil.conversations 0

# Make the entity's hitbox big enough so that it covers the human at all times:
attribute @s minecraft:scale modifier add humvil:cover_human_hitbox 0.2 add_multiplied_base
execute if predicate humvil:flags/is_baby run attribute @n[tag=humvil.human.needs_config] minecraft:scale modifier add humvil:cover_human_hitbox_baby -0.5 add_multiplied_base

# Inherit equipment to human:
execute unless score $inherit_equipment humvil.settings matches 0 run item replace entity @n[tag=humvil.human.needs_config] armor.head from entity @s armor.head
execute unless score $inherit_equipment humvil.settings matches 0 run item replace entity @n[tag=humvil.human.needs_config] armor.chest from entity @s armor.chest
execute unless score $inherit_equipment humvil.settings matches 0 run item replace entity @n[tag=humvil.human.needs_config] armor.legs from entity @s armor.legs
execute unless score $inherit_equipment humvil.settings matches 0 run item replace entity @n[tag=humvil.human.needs_config] armor.feet from entity @s armor.feet

execute unless score $inherit_equipment humvil.settings matches 0 run item replace entity @n[tag=humvil.human.needs_config] weapon.mainhand from entity @s weapon.mainhand
execute unless score $inherit_equipment humvil.settings matches 0 run item replace entity @n[tag=humvil.human.needs_config] weapon.offhand from entity @s weapon.offhand

execute unless score $inherit_equipment humvil.settings matches 0 run item replace entity @s armor.head with minecraft:air
execute unless score $inherit_equipment humvil.settings matches 0 run item replace entity @s armor.chest with minecraft:air
execute unless score $inherit_equipment humvil.settings matches 0 run item replace entity @s armor.legs with minecraft:air
execute unless score $inherit_equipment humvil.settings matches 0 run item replace entity @s armor.feet with minecraft:air

execute unless score $inherit_equipment humvil.settings matches 0 run item replace entity @s weapon.mainhand with minecraft:air
execute unless score $inherit_equipment humvil.settings matches 0 run item replace entity @s weapon.offhand with minecraft:air

# Set tags:
tag @s add humvil.human.transformed
tag @s add humvil.linked

tag @n[tag=humvil.human.needs_config] add humvil.human
tag @n[tag=humvil.human.needs_config] add humvil.linked
tag @n[tag=humvil.human.needs_config] remove humvil.human.needs_config
