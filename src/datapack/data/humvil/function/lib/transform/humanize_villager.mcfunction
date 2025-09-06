# @s is a non-human villager!
# Output: Transform @s to a human.

# Cancel if @s is a custom entity or if already humanized:
execute if entity @s[tag=humvil.human.transformed] run return fail
execute if entity @s[tag=smithed.entity] run return fail

# Get male or female (0 for male and 1 for female):
execute store result score @s humvil.transform.gender run random value 0..1

# Get main hand (0 for right-handed and 1 for left-handed):
execute unless score $main_hand humvil.settings matches 1 unless score $main_hand humvil.settings matches 2 store result score @s humvil.transform.main_hand run random value 0..1
execute if score $main_hand humvil.settings matches 1 run scoreboard players set @s humvil.transform.main_hand 0
execute if score $main_hand humvil.settings matches 2 run scoreboard players set @s humvil.transform.main_hand 1

execute if score @s humvil.transform.main_hand matches 0 run data modify storage humvil:random mannequin.main_hand set value 'right'
execute if score @s humvil.transform.main_hand matches 1 run data modify storage humvil:random mannequin.main_hand set value 'left'

# Get if model type will be wide or slim, having more chance for one type or for another depending its the gender (wide 0 and slim 1):
execute if score @s humvil.transform.gender matches 0..1 store result score $model_type humvil.temp run random value 0..3

execute if score @s humvil.transform.gender matches 0 if score $model_type humvil.temp matches 0 run scoreboard players set @s humvil.transform.model_type 1
execute if score @s humvil.transform.gender matches 0 unless score $model_type humvil.temp matches 0 run scoreboard players set @s humvil.transform.model_type 0

execute if score @s humvil.transform.gender matches 1 if score $model_type humvil.temp matches 0 run scoreboard players set @s humvil.transform.model_type 0
execute if score @s humvil.transform.gender matches 1 unless score $model_type humvil.temp matches 0 run scoreboard players set @s humvil.transform.model_type 1

execute if score @s humvil.transform.model_type matches ..0 run data modify storage humvil:random mannequin.model_type set value 'wide'
execute if score @s humvil.transform.model_type matches 1.. run data modify storage humvil:random mannequin.model_type set value 'slim'

# Get name:
function humvil:lib/pool/name/main
data modify storage humvil:random mannequin.name set from storage humvil:lib output

# Get skin:
function humvil:lib/pool/skin/main
data modify storage humvil:random mannequin.skin set from storage humvil:lib output

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

# Make the entity's hitbox big enough so that it covers the human at all times:
attribute @s minecraft:scale modifier add humvil:cover_human_hitbox 0.2 add_multiplied_base

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
