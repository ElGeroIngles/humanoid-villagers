# Macros:
# $(human_pool) --> Controls what pools are available when summoning a human (0-2)
# $(main_hand) --> Controls which will be the main hand of the human (0-2)
# $(inherit_equipment) --> Whether the human should inherit the equipment of its original entity or not (0-1)
# $(hide_cape) --> Whether to show the cape on the human or not (0-1)
# $(hide_jacket) --> Whether to show the jacket on the human or not (0-1)
# $(hide_left_sleeve) --> Whether to show the left sleeve on the human or not (0-1)
# $(hide_right_sleeve) --> Whether to show the right sleeve on the human or not (0-1)
# $(hide_left_leg_pants) --> Whether to show the left leg pants on the human or not (0-1)
# $(hide_right_leg_pants) --> Whether to show the right leg pants on the human or not (0-1)
# $(hide_hat) --> Whether to show the hat on the human or not (0-1)

# Apply the settings from the dialog macro:

# New humans will be selected from:
# 0 --> Players that have joined this world and random ones
# 1 --> Only players that have joined this world
# 2 --> Only random ones
$scoreboard players set $human_pool humvil.settings $(human_pool)

# The main hand for the humans will be:
# 0 --> Random (90% for right-handed and 10% for left-handed)
# 1 --> Always right-handed
# 2 --> Always left-handed
$scoreboard players set $main_hand humvil.settings $(main_hand)
$scoreboard players set $right-handed_percentage humvil.settings $(right_handed_percentage)

# External layers to hide:
# 0 --> Don't hide that layer
# 1 --> Hide that layer
$scoreboard players set $hide_cape humvil.settings $(hide_cape)
$scoreboard players set $hide_jacket humvil.settings $(hide_jacket)
$scoreboard players set $hide_left_sleeve humvil.settings $(hide_left_sleeve)
$scoreboard players set $hide_right_sleeve humvil.settings $(hide_right_sleeve)
$scoreboard players set $hide_left_leg_pants humvil.settings $(hide_left_leg_pants)
$scoreboard players set $hide_right_leg_pants humvil.settings $(hide_right_leg_pants)
$scoreboard players set $hide_hat humvil.settings $(hide_hat)

# Humans inherit equipment from its original entity:
# 0 --> No
# 1 --> Yes
$scoreboard players set $inherit_equipment humvil.settings $(inherit_equipment)

# Hide the "NPC" tag below the mannequin's name:
# 0 --> No
# 1 --> Yes
$scoreboard players set $npc_tag humvil.settings $(allow_npc_tag)

# Override the "NPC" tag below the mannequin's name:
# 0 --> No
# 1 --> Yes
$scoreboard players set $custom_npc_tag humvil.settings $(allow_npc_tag_custom)
$data modify storage humvil:lib Settings.CustomTag set value $(npc_tag_custom)

# Specify which entities can be humanized:
# 0 --> Only naturally spawning villagers & zombified villagers, once they have been cured, from structures (villages, igloo...)
# 1 --> All villagers
# 2 --> Only transform the specified entities (via manual tags and functions)
$scoreboard players set $can_be_humanized humvil.settings $(can_be_humanized)

# Allow for animations in humans (such as double crouching when near a player or make them swin then in water):
# 0 --> No
# 1 --> Yes
$scoreboard players set $animated_humans humvil.settings $(allow_animations)

# Allow for conversations between humans:
# 0 --> No
# 1 --> Yes (0.01% chance each tick, with a cooldown of 30s (600 ticks) between each conversation of that villager)
$scoreboard players set $humans_can_conversate humvil.settings $(allow_conversations)
$scoreboard players set $humans_conversate_frequency humvil.settings $(conversations_frequency)
$scoreboard players set $humans_conversate_cooldown humvil.settings $(conversations_cooldown)
