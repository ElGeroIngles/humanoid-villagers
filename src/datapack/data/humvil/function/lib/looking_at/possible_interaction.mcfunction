# Check if @s is facing a "#humvil:can_interact_with" entity:
# Expected:
# If @s is looking to a "#humvil:can_interact_with" entity --> return 1
# If @s is not looking to a "#humvil:can_interact_with" entity--> return 0

# Check:
tag @s add humvil.ignore_itself
summon marker ~ ~ ~ {UUID:[I;1521987956,-338803203,-1956926387,-1339591941]}
tp 5ab7b174-ebce-45fd-8b5b-ac4db02772fb ~ ~ ~ ~ ~
execute as @e[type=#humvil:can_interact_with,tag=!humvil.ignore_itself,distance=..7,sort=nearest] \
    positioned ^ ^ ^7 \
    positioned as @s[distance=..7.3] \
    positioned ~ ~-0.2 ~2048 facing entity @s eyes \
    positioned ^ ^ ^1024 positioned ~ ~0.2 ~-1024 \
    rotated as 5ab7b174-ebce-45fd-8b5b-ac4db02772fb \
    positioned ^ ^ ^1024 \
    facing entity 5ab7b174-ebce-45fd-8b5b-ac4db02772fb feet \
    positioned ^ ^ ^1024 \
    facing entity @s feet \
    positioned ^ ^ ^0.2 facing entity @s eyes positioned ^ ^ ^0.2 \
    positioned ~-0.01 ~-0.01 ~-0.01 as @s[dx=0,dy=0,dz=0] \
    positioned ~-0.98 ~-0.88 ~-0.98 at @s[dx=0,dy=0,dz=0] \
    run return run kill 5ab7b174-ebce-45fd-8b5b-ac4db02772fb

kill 5ab7b174-ebce-45fd-8b5b-ac4db02772fb
return fail
