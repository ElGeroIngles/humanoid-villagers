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
