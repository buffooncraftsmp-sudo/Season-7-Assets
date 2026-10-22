scoreboard players add @s buffoon.boss 1
execute if score @s buffoon.boss matches ..20 run function buffoon:boss/sweep_warn
execute if score @s buffoon.boss matches 21..80 run tp @s ~ ~ ~ ~2 0
execute if score @s buffoon.boss matches 21..80 at @s run function buffoon:boss/sweep_go
execute if score @s buffoon.boss matches 21..80 run tp @s ~ ~ ~ ~2 0
execute if score @s buffoon.boss matches 21..80 at @s run function buffoon:boss/sweep_go
execute if score @s buffoon.boss matches 21..80 run tp @s ~ ~ ~ ~2 0
execute if score @s buffoon.boss matches 21..80 at @s run function buffoon:boss/sweep_go
scoreboard players operation #m buffoon.boss = @s buffoon.boss
scoreboard players operation #m buffoon.boss %= #10 buffoon.boss
execute if score #m buffoon.boss matches 0 run tag @a remove buffoon.swept
execute if score @s buffoon.boss matches 21 run playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..120] ~ ~ ~ 3 1.4
execute if score @s buffoon.boss matches 81.. run kill @s
