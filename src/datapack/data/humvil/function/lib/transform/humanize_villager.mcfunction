# @s is a non-human villager!
# Output: Transform @s to a human.

# Cancel if @s is a custom entity:
execute if entity @s[tag=smithed.entity] run return fail

# Get male, female (0 for male and 1 for female):
execute store result score @s humvil.transform.gender run random value 0..1

# Get if model type will be wide or slim, having more chance for one type or for another depending its the gender (wide 0 and slim 1):
execute if score @s humvil.transform.gender matches 0..1 store result score #model_type humvil.temp run random value 0..3

execute if score @s humvil.transform.gender matches 0 if score #model_type humvil.temp matches 0 run scoreboard players set @s humvil.transform.model_type 0
execute if score @s humvil.transform.gender matches 0 unless score #model_type humvil.temp matches 0 run scoreboard players set @s humvil.transform.model_type 1

execute if score @s humvil.transform.gender matches 1 if score #model_type humvil.temp matches 0 run scoreboard players set @s humvil.transform.model_type 1
execute if score @s humvil.transform.gender matches 1 unless score #model_type humvil.temp matches 0 run scoreboard players set @s humvil.transform.model_type 0

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
