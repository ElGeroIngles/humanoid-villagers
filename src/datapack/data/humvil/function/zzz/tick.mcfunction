# Kill the entity if the one other one is dead:
execute as @e[tag=humvil.linked] run function humvil:zzz/link/check_kill

# Copy ai from original entity to its human:
execute as @e[tag=humvil.human] run function humvil:zzz/link/ai
