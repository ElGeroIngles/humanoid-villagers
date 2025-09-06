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
# 0 --> Random
# 1 --> Always right-handed
# 2 --> Always left-handed
$scoreboard players set $main_hand humvil.settings $(main_hand)

# External layers to hide:
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
