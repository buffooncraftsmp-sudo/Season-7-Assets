scoreboard players add @s buffoon.boss 1
execute at @s facing entity @p[gamemode=!spectator,distance=..80] feet run tp @s ^ ^ ^0.14
execute at @s run tp @s ~ ~ ~ ~ 0
particle minecraft:dust{color:[0.7,0.8,0.2],scale:3.0f} ~ ~1 ~ 2 1 2 0 10 force @a
particle minecraft:campfire_cosy_smoke ~ ~0.6 ~ 1.8 0.6 1.8 0.005 2 force @a
particle minecraft:spore_blossom_air ~ ~1 ~ 2.2 1 2.2 0 4 force @a
execute as @a[distance=..2.8,gamemode=!spectator,gamemode=!creative] run effect give @s minecraft:poison 2 1 true
execute as @a[distance=..2.8,gamemode=!spectator,gamemode=!creative] run effect give @s minecraft:nausea 4 0 true
execute if score @s buffoon.boss matches 1 run playsound minecraft:block.potent_sulfur.noxious_gas hostile @a[distance=..60] ~ ~ ~ 3 0.7
execute if score @s buffoon.boss matches 1.. run scoreboard players operation #m buffoon.boss = @s buffoon.boss
execute if score @s buffoon.boss matches 1.. run scoreboard players operation #m buffoon.boss %= #20 buffoon.boss
execute if score #m buffoon.boss matches 0 as @a[distance=..2.8,gamemode=!spectator,gamemode=!creative] run function buffoon:boss/hurt {a:3}
execute if score @s buffoon.boss matches 160.. run kill @s
