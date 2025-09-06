# > humvil:zzz/load
# Set default settings:

# New humans will be selected from:
# 0 --> Players that have joined this world and random ones
# 1 --> Only players that have joined this world
# 2 --> Only random ones
scoreboard players set $human_pool humvil.settings 0

# The main hand for the humans will be:
# 0 --> Random
# 1 --> Always right-handed
# 2 --> Always left-handed
scoreboard players set $main_hand humvil.settings 0

# External layers to hide:
scoreboard players set $hide_cape humvil.settings 0
scoreboard players set $hide_jacket humvil.settings 0
scoreboard players set $hide_left_sleeve humvil.settings 0
scoreboard players set $hide_right_sleeve humvil.settings 0
scoreboard players set $hide_left_leg_pants humvil.settings 0
scoreboard players set $hide_right_leg_pants humvil.settings 0
scoreboard players set $hide_hat humvil.settings 0

# Humans inherit equipment from its original entity:
# 0 --> No
# 1 --> Yes
scoreboard players set $inherit_equipment humvil.settings 1

# Id:
scoreboard players set $global humvil.id -2147483648

# Only run once per world.
# scoreboard players set $init humvil.global 0
