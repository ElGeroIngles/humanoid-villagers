tellraw @a [{"text":"[HUMVIL] ","color":"yellow"},{"translate":"load.humvil.message.2","color":"yellow"}]

# Scoreboards:
scoreboard objectives add humvil.transform.gender dummy
scoreboard objectives add humvil.transform.model_type dummy
scoreboard objectives add humvil.transform.main_hand dummy

scoreboard objectives add humvil.settings dummy
scoreboard objectives add humvil.global dummy

scoreboard objectives add humvil.temp dummy

scoreboard objectives add humvil.id dummy

scoreboard objectives add humvil.conversations dummy
scoreboard objectives add humvil.conversations.id dummy
scoreboard objectives add humvil.conversations.id.receptor dummy
scoreboard objectives add humvil.conversations.wait_between_lines dummy

scoreboard objectives add humvil.players.JoinGame minecraft.custom:minecraft.leave_game
scoreboard objectives add humvil.players.Dummy dummy

scoreboard objectives add humvil.open_dialog trigger

scoreboard objectives add humvil.animations.double_crouching dummy
scoreboard objectives add humvil.animations.in_doors dummy

# Ticks:
schedule function humvil:zzz/ticks/1s 1s replace

# Initialize default config:
execute unless score $init humvil.global matches ..0 run function humvil:zzz/init

tellraw @a [{"text":"[HUMVIL] ","color":"yellow"},{"translate":"load.humvil.message.3","color":"green"}]
tellraw @a [{"text":"[HUMVIL] ","color":"yellow"},{"text":"Humanoid Villagers","underlined":true,"color":"gold","click_event":{"action":"open_url","url":"https://modrinth.com/datapack/humanoid-villagers"}}," ",{"text":"(v0.0.1)","underlined":true,"color":"green","click_event":{"action":"open_url","url":"https://modrinth.com/datapack/humanoid-villagers/changelog"},"hover_event":{"action":"show_text","value":[{"translate":"load.humvil.message.5"}]}},{"text":" - ","color":"gray"},{"translate":"load.humvil.message.4","color":"blue"},{"text":"☽ Eclipse Studios","underlined":true,"color":"blue","click_event":{"action":"open_url","url":"https://www.youtube.com/@EclipseStudiosMC"}}]
tellraw @a [{"text":"[HUMVIL] ","color":"yellow"},{"translate":"load.humvil.message.1","color":"light_purple"}]
tellraw @a [{"text":"[HUMVIL] ","color":"yellow"},{"text":"[Discord]","underlined":true,"color":"blue","click_event":{"action":"open_url","url":"https://discord.gg/X2NTE7hkq8"}},{"text":" ✦ ","color":"dark_aqua"},{"text":"[YouTube]","underlined":true,"color":"red","click_event":{"action":"open_url","url":"https://www.youtube.com/@EclipseStudiosMC"}},{"text":" ✦ ","color":"dark_aqua"},{"text":"[GitHub]","underlined":true,"color":"dark_gray","click_event":{"action":"open_url","url":"https://github.com/EclipseStudiosMC"}},{"text":" ✦ ","color":"dark_aqua"},{"text":"[Modrinth]","underlined":true,"color":"green","click_event":{"action":"open_url","url":"https://modrinth.com/user/EclipseStudios"}},{"text":" ✦ ","color":"dark_aqua"},{"text":"[Planet Minecraft]","underlined":true,"color":"aqua","click_event":{"action":"open_url","url":"https://www.planetminecraft.com/member/elgeroingles/"}}]
execute as @a at @s run playsound minecraft:entity.player.levelup ambient @s
