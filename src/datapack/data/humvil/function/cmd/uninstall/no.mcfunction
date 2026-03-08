# > humvil:cmd/uninstall/main

# The datapack won't be uninstalled:
function humvil:lib/chat/clear
tellraw @s ["",{color:"yellow",text:"[HUMVIL] "},{color:"gold",translate:"uninstall.humvil.deny"}]
playsound minecraft:entity.player.levelup ambient @s
