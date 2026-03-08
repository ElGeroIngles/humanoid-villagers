# Ask for confirmation:
tellraw @s ["",{color:"yellow",text:"[HUMVIL] "},{color:"gold",translate:"uninstall.humvil.confirmation"},"\n",{color:"green",click_event:{action:"run_command",command:"/function humvil:cmd/uninstall/yes"},text:"[",extra:[{translate:"uninstall.humvil.yes",fallback:"Yes"},"]"]},{color:"red",click_event:{action:"run_command",command:"/function humvil:cmd/uninstall/no"},text:" [",extra:[{translate:"uninstall.humvil.no",fallback:"No"},"]"]}]
playsound minecraft:entity.cat.ambient ambient @s
