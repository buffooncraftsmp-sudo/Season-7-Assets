scoreboard players add @s buffoon.boss 1
execute if score @s buffoon.boss matches ..29 run particle minecraft:dust{color:[1.0,0.1,0.1],scale:0.8f} ~ ~ ~ 0.6 0.6 0.6 0 4 force @a
execute if score @s buffoon.boss matches 1 run playsound minecraft:entity.guardian.attack hostile @a[distance=..60] ~ ~ ~ 2 1.6
execute if score @s buffoon.boss matches 1..29 run tag @s add buffoon.lock_aim
execute if score @s buffoon.boss matches ..29 at @n[type=item_display,tag=buffoon.boss_star] facing entity @s feet run function buffoon:boss/aim_go
execute if score @s buffoon.boss matches 30..40 run tag @s add buffoon.lock_fire
execute if score @s buffoon.boss matches 30..40 at @n[type=item_display,tag=buffoon.boss_star] facing entity @s feet run function buffoon:boss/beam_go
execute if score @s buffoon.boss matches 30 run playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..80] ~ ~ ~ 3 1.2
execute if score @s buffoon.boss matches 30 run execute as @a[distance=..2.5,gamemode=!spectator,gamemode=!creative] run function buffoon:boss/hurt {a:9}
execute if score @s buffoon.boss matches 30 run particle minecraft:explosion ~ ~ ~ 1 1 1 0 6 force @a
tag @s remove buffoon.lock_aim
tag @s remove buffoon.lock_fire
execute if score @s buffoon.boss matches 41.. run kill @s
