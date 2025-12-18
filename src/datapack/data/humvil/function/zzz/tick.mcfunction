# Fix global id if needed:
execute unless score $global humvil.id matches -16000..16000 run scoreboard players set $global humvil.id -16000

# Update the hidden layers array if needed:
function humvil:lib/settings/update_hidden_layers

# Add new players to an array of all players that have joined this world:
execute as @a[scores={humvil.players.JoinGame=1..}] run function humvil:lib/pool/players/join

# Playercount Check:
execute store result score #PlayerCount humvil.players.Dummy if entity @a
execute if score #PlayerCount humvil.players.Dummy < #PlayerCountPrev humvil.players.Dummy run function humvil:lib/pool/players/someone_left
scoreboard players operation #PlayerCountPrev humvil.players.Dummy = #PlayerCount humvil.players.Dummy

# Kill the entity if the one other one is dead:
execute as @e[tag=humvil.linked] run function humvil:zzz/link/check_kill

# Humanize entities:
# 0 --> Only naturally spawning villagers & zombified villagers, once they have been cured, from structures (villages, igloo...)
# 1 --> All villagers
# 2 --> Only transform the specified entities (via manual tags and functions)
execute if score $can_be_humanized humvil.settings matches 0 as @e[tag=humvil.villager_from_village,tag=!humvil.human.transformed,tag=!smithed.entity,type=minecraft:villager] run function humvil:lib/transform/humanize_villager
execute if score $can_be_humanized humvil.settings matches 1 as @e[tag=!humvil.human.transformed,tag=!smithed.entity,type=minecraft:villager] run function humvil:lib/transform/humanize_villager

# Add the AI to the human:
execute as @e[tag=humvil.human] run function humvil:zzz/link/ai

# Play following line of the conversation after little cooldown:
execute if data storage humvil:conversations Current[0] as @e[scores={humvil.conversations.id=-2147483648..2147483647},tag=humvil.conversation.participant.1.this] run function humvil:zzz/link/conversations/play/cooldown/main

# Reset receptor id scoreboard if no dialogs are running to take into account for players disconecting mid-dialog:
execute unless entity @e[tag=humvil.conversation.in_conversation] run scoreboard players reset @a humvil.conversations.id.receptor

# Damage mannequin when its linked entity is hurt so the mannequin also shows as red:
execute as @e[tag=humvil.human.transformed] run function humvil:zzz/link/damage

# Open dialog if triggered:
scoreboard players enable @a humvil.open_dialog
dialog show @a[scores={humvil.open_dialog=1..}] humvil:about
scoreboard players set @a[scores={humvil.open_dialog=1..}] humvil.open_dialog 0
