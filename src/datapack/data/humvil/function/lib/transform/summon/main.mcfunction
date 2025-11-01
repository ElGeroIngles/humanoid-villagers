# Summon the with the randomized name and such:
# Macros:
# $(name) --> Its name
# $(profile) --> The profile for the mannequin
# $(main_hand) --> Main hand of the human

# Debug:
# tellraw @a "################"
# $tellraw @a ["My name is: ",$(name)]
# tellraw @a ["My score was: ",{score:{name:"@s",objective:"humvil.transform.gender"}}]
# $tellraw @a "My profile is: $(profile)"
# tellraw @a ["My score was: ",{score:{name:"@s",objective:"humvil.transform.model_type"}}]
# tellraw @a ["My skin is: ",{nbt:"mannequin.skin",storage:"humvil:random"}]

# Summon:
$execute at @s run summon minecraft:mannequin ~ ~ ~ {CustomNameVisible:1b,CustomName:$(name),profile:{$(profile)},Tags:["smithed.entity","humvil.human.needs_config"],main_hand:'$(main_hand)'}

# Hide or unhide the "NPC" tag:
execute store result entity @n[tag=humvil.human.needs_config] hide_description byte 1 run scoreboard players get $npc_tag humvil.settings

# Add the custom "NPC" tag:
execute if score $custom_npc_tag humvil.settings matches 1 run data modify entity @n[tag=humvil.human.needs_config] description set from storage humvil:lib Settings.CustomTag

# Hide the specified layers as in the settings:
data modify entity @n[tag=humvil.human.needs_config] hidden_layers set from storage humvil:lib Settings.HiddenLayers
