# Check if the hidden layers array should be updated, if so, update it.

# Check in binary the value of the settings:
scoreboard players set $current_hidden_layers humvil.settings 0

execute if score $hide_cape humvil.settings matches 1 run scoreboard players add $current_hidden_layers humvil.settings 2
execute if score $hide_jacket humvil.settings matches 1 run scoreboard players add $current_hidden_layers humvil.settings 4
execute if score $hide_left_sleeve humvil.settings matches 1 run scoreboard players add $current_hidden_layers humvil.settings 8
execute if score $hide_right_sleeve humvil.settings matches 1 run scoreboard players add $current_hidden_layers humvil.settings 16
execute if score $hide_left_leg_pants humvil.settings matches 1 run scoreboard players add $current_hidden_layers humvil.settings 32
execute if score $hide_right_leg_pants humvil.settings matches 1 run scoreboard players add $current_hidden_layers humvil.settings 64
execute if score $hide_hat humvil.settings matches 1 run scoreboard players add $current_hidden_layers humvil.settings 128

# Exit if the array hasn't changed:
execute if score $current_hidden_layers humvil.settings = $previous_hidden_layers humvil.settings run return fail

# Set current as previous for future checks:
scoreboard players operation $previous_hidden_layers humvil.settings = $current_hidden_layers humvil.settings

# Update array:
data modify storage humvil:lib Settings.HiddenLayers set value []
execute if score $hide_cape humvil.settings matches 1 run data modify storage humvil:lib Settings.HiddenLayers append value "cape"
execute if score $hide_jacket humvil.settings matches 1 run data modify storage humvil:lib Settings.HiddenLayers append value "jacket"
execute if score $hide_left_sleeve humvil.settings matches 1 run data modify storage humvil:lib Settings.HiddenLayers append value "left_sleeve"
execute if score $hide_right_sleeve humvil.settings matches 1 run data modify storage humvil:lib Settings.HiddenLayers append value "right_sleeve"
execute if score $hide_left_leg_pants humvil.settings matches 1 run data modify storage humvil:lib Settings.HiddenLayers append value "left_leg_pants"
execute if score $hide_right_leg_pants humvil.settings matches 1 run data modify storage humvil:lib Settings.HiddenLayers append value "right_leg_pants"
execute if score $hide_hat humvil.settings matches 1 run data modify storage humvil:lib Settings.HiddenLayers append value "hat"
