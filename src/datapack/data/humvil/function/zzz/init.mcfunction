# > humvil:zzz/load
# Set default settings:

# Human skins will be selected from:
# 0 --> Players that have joined this world and random ones
# 1 --> Only players that have joined this world
# 2 --> Only random ones
scoreboard players set $human_pool humvil.settings 0

# The main hand for the humans will be:
# 0 --> Random (90% for right-handed and 10% for left-handed)
# 1 --> Always right-handed
# 2 --> Always left-handed
scoreboard players set $main_hand humvil.settings 0
scoreboard players set $right-handed_percentage humvil.settings 90

# External layers to hide:
# 0 --> Don't hide that layer
# 1 --> Hide that layer
scoreboard players set $hide_cape humvil.settings 0
scoreboard players set $hide_jacket humvil.settings 0
scoreboard players set $hide_left_sleeve humvil.settings 0
scoreboard players set $hide_right_sleeve humvil.settings 0
scoreboard players set $hide_left_leg_pants humvil.settings 0
scoreboard players set $hide_right_leg_pants humvil.settings 0
scoreboard players set $hide_hat humvil.settings 0
data modify storage humvil:lib Settings.HiddenLayers set value []
scoreboard players set $previous_hidden_layers humvil.settings 0

# Humans inherit equipment from its original entity:
# 0 --> No
# 1 --> Yes
scoreboard players set $inherit_equipment humvil.settings 1

# Hide the "NPC" tag below the mannequin's name:
# 0 --> No
# 1 --> Yes
scoreboard players set $npc_tag humvil.settings 1

# Override the "NPC" tag below the mannequin's name:
# 0 --> No
# 1 --> Yes
scoreboard players set $custom_npc_tag humvil.settings 0
data modify storage humvil:lib Settings.CustomTag set value {translate:"entity.minecraft.mannequin.label"}

# Specify which entities can be humanized:
# 0 --> Only naturally spawning villagers & zombified villagers, once they have been cured, from structures (villages, igloo...)
# 1 --> All villagers
# 2 --> Only transform the specified entities (via manual tags and functions)
scoreboard players set $can_be_humanized humvil.settings 0

# Id:
scoreboard players set $global humvil.id -2147483648

# Only run once per world:
# scoreboard players set $init humvil.global 0
