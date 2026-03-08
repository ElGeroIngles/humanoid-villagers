# > humvil:cmd/uninstall/main

# The datapack will be uninstalled:
function humvil:lib/chat/clear
tellraw @s ["",{color:"yellow",text:"[HUMVIL] "},{color:"gold",translate:"uninstall.humvil.message.1"}]

# Uninstall datapack:
scoreboard objectives remove humvil.transform.gender 
scoreboard objectives remove humvil.transform.model_type 
scoreboard objectives remove humvil.transform.main_hand 
scoreboard objectives remove humvil.settings 
scoreboard objectives remove humvil.global 
scoreboard objectives remove humvil.temp 
scoreboard objectives remove humvil.id 
scoreboard objectives remove humvil.conversations 
scoreboard objectives remove humvil.conversations.id 
scoreboard objectives remove humvil.conversations.id.receptor 
scoreboard objectives remove humvil.conversations.wait_between_lines 
scoreboard objectives remove humvil.players.JoinGame
scoreboard objectives remove humvil.players.Dummy
scoreboard objectives remove humvil.open_dialog
scoreboard objectives remove humvil.animations.double_crouching 
scoreboard objectives remove humvil.animations.in_doors 
scoreboard objectives remove humvil.health 
scoreboard objectives remove humvil.health_check 

schedule clear humvil:zzz/ticks/1s

execute as @e[tag=humvil.human] run kill @s
execute as @e[tag=humvil.human.transformed] run data remove entity @s CustomName
effect clear @e[tag=humvil.human.transformed] minecraft:invisibility

execute as @e[tag=humvil.human.transformed] run attribute @s minecraft:scale modifier remove humvil:cover_human_hitbox
execute as @e[tag=humvil.human.transformed] run attribute @s minecraft:scale modifier remove humvil:cover_human_hitbox_baby

tag @e[tag=humvil.human.transformed] add humvil.uninstall.not_this

tag @e[tag=humvil.human.transformed] remove smithed.entity
tag @e remove humvil.linked
tag @e remove humvil.player_registered
tag @e remove humvil.player_nearby
tag @e remove humvil.player_somewhat_nearby
tag @e remove humvil.human.transformed

data remove storage humvil:conversations Current
data remove storage humvil:pool names
data remove storage humvil:pool skins
data remove storage humvil:pool conversations

# Finished:
tellraw @s ["",{color:"yellow",text:"[HUMVIL] "},{color:"green",translate:"uninstall.humvil.message.2"}," ",{color:"green",translate:"uninstall.humvil.message.3"}]
playsound minecraft:entity.player.levelup ambient @s
