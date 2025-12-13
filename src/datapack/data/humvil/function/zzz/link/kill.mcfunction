# > humvil:zzz/link/check_kill
# @s is a entity linked to another one who no longer has a entity linked to it

# Recicle ids:
scoreboard players add $id humvil.id 1
execute if score $id humvil.id = $global humvil.id run scoreboard players remove $global humvil.id 1

# Kill:
kill @s
