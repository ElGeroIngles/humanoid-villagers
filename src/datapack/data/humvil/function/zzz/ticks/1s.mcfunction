# Decrease conversation cooldows by 1s:
scoreboard players remove @e[type=#humvil:can_conversate_with,scores={humvil.conversations=1..}] humvil.conversations 1

# Loop for 1s:
schedule function humvil:zzz/ticks/1s 1s replace
