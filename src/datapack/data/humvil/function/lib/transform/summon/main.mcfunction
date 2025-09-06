# Summon the with the randomized name and such:
# Macros:
# $(name) --> Its name
# $(model_type) --> Its model type (wide or slim)
# $(skin) --> Profile containing the skin texture to use

# Debug:
# tellraw @a "################"
# $tellraw @a ["My name is: ",$(name)]
# tellraw @a ["My score was: ",{score:{name:"@s",objective:"humvil.transform.gender"}}]
# $tellraw @a "My model type is: $(model_type)"
# tellraw @a ["My score was: ",{score:{name:"@s",objective:"humvil.transform.model_type"}}]
# tellraw @a ["My skin is: ",{nbt:"mannequin.skin",storage:"humvil:random"}]

# Summon:
$execute at @s run summon minecraft:mannequin ~ ~ ~ {CustomName:$(name),profile:{model:'$(model_type)',$(skin)},Tags:["smithed.entity","humvil.human.needs_config"]}
