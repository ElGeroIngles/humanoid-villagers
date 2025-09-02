# Summon the with the randomized name and such:
# Macros:
# $(name) --> Its name
# $(model_type) --> Its model type (wide or slim)
# $(skin) --> Profile containing the skin texture to use

# Summon:
$execute at @s run summon minecraft:mannequin ~ ~ ~ {CustomName:$(name),model:$(model_type),$(skin)}
