execute as @e[type=interaction,tag=buffoon.trophy_angel] if data entity @s attack at @s as @n[type=marker,tag=buffoon.trophy_angel,distance=..1] at @s run function buffoon:trophy/angel/pickup
execute as @e[type=marker,tag=buffoon.trophy_angel] at @s unless block ~ ~ ~ minecraft:light run function buffoon:trophy/angel/pickup
execute as @e[type=interaction,tag=buffoon.trophy_eve] if data entity @s attack at @s as @n[type=marker,tag=buffoon.trophy_eve,distance=..1] at @s run function buffoon:trophy/eve/pickup
execute as @e[type=marker,tag=buffoon.trophy_eve] at @s unless block ~ ~ ~ minecraft:light run function buffoon:trophy/eve/pickup
execute as @e[type=interaction,tag=buffoon.trophy_dora] if data entity @s attack at @s as @n[type=marker,tag=buffoon.trophy_dora,distance=..1] at @s run function buffoon:trophy/dora/pickup
execute as @e[type=marker,tag=buffoon.trophy_dora] at @s unless block ~ ~ ~ minecraft:light run function buffoon:trophy/dora/pickup
execute as @e[type=interaction,tag=buffoon.trophy_nova] if data entity @s attack at @s as @n[type=marker,tag=buffoon.trophy_nova,distance=..1] at @s run function buffoon:trophy/nova/pickup
execute as @e[type=marker,tag=buffoon.trophy_nova] at @s unless block ~ ~ ~ minecraft:light run function buffoon:trophy/nova/pickup
execute as @e[type=interaction,tag=buffoon.trophy_sage] if data entity @s attack at @s as @n[type=marker,tag=buffoon.trophy_sage,distance=..1] at @s run function buffoon:trophy/sage/pickup
execute as @e[type=marker,tag=buffoon.trophy_sage] at @s unless block ~ ~ ~ minecraft:light run function buffoon:trophy/sage/pickup
execute as @e[type=interaction,tag=buffoon.trophy_flying] if data entity @s attack at @s as @n[type=marker,tag=buffoon.trophy_flying,distance=..1] at @s run function buffoon:trophy/flying/pickup
execute as @e[type=marker,tag=buffoon.trophy_flying] at @s unless block ~ ~ ~ minecraft:light run function buffoon:trophy/flying/pickup
execute as @e[type=interaction,tag=buffoon.trophy_lone] if data entity @s attack at @s as @n[type=marker,tag=buffoon.trophy_lone,distance=..1] at @s run function buffoon:trophy/lone/pickup
execute as @e[type=marker,tag=buffoon.trophy_lone] at @s unless block ~ ~ ~ minecraft:light run function buffoon:trophy/lone/pickup
execute as @e[type=interaction,tag=buffoon.trophy_skip] if data entity @s attack at @s as @n[type=marker,tag=buffoon.trophy_skip,distance=..1] at @s run function buffoon:trophy/skip/pickup
execute as @e[type=marker,tag=buffoon.trophy_skip] at @s unless block ~ ~ ~ minecraft:light run function buffoon:trophy/skip/pickup
execute as @e[type=interaction,tag=buffoon.trophy_thunder] if data entity @s attack at @s as @n[type=marker,tag=buffoon.trophy_thunder,distance=..1] at @s run function buffoon:trophy/thunder/pickup
execute as @e[type=marker,tag=buffoon.trophy_thunder] at @s unless block ~ ~ ~ minecraft:light run function buffoon:trophy/thunder/pickup
execute as @e[type=interaction,tag=buffoon.trophy_echo] if data entity @s attack at @s as @n[type=marker,tag=buffoon.trophy_echo,distance=..1] at @s run function buffoon:trophy/echo/pickup
execute as @e[type=marker,tag=buffoon.trophy_echo] at @s unless block ~ ~ ~ minecraft:light run function buffoon:trophy/echo/pickup
execute as @e[type=interaction,tag=buffoon.trophy_korny] if data entity @s attack at @s as @n[type=marker,tag=buffoon.trophy_korny,distance=..1] at @s run function buffoon:trophy/korny/pickup
execute as @e[type=marker,tag=buffoon.trophy_korny] at @s unless block ~ ~ ~ minecraft:light run function buffoon:trophy/korny/pickup
execute as @e[type=interaction,tag=buffoon.trophy_ky] if data entity @s attack at @s as @n[type=marker,tag=buffoon.trophy_ky,distance=..1] at @s run function buffoon:trophy/ky/pickup
execute as @e[type=marker,tag=buffoon.trophy_ky] at @s unless block ~ ~ ~ minecraft:light run function buffoon:trophy/ky/pickup
execute as @e[type=interaction,tag=buffoon.trophy_lux] if data entity @s attack at @s as @n[type=marker,tag=buffoon.trophy_lux,distance=..1] at @s run function buffoon:trophy/lux/pickup
execute as @e[type=marker,tag=buffoon.trophy_lux] at @s unless block ~ ~ ~ minecraft:light run function buffoon:trophy/lux/pickup
execute as @e[type=interaction,tag=buffoon.trophy_opg] if data entity @s attack at @s as @n[type=marker,tag=buffoon.trophy_opg,distance=..1] at @s run function buffoon:trophy/opg/pickup
execute as @e[type=marker,tag=buffoon.trophy_opg] at @s unless block ~ ~ ~ minecraft:light run function buffoon:trophy/opg/pickup
execute as @e[type=interaction,tag=buffoon.trophy_nebs] if data entity @s attack at @s as @n[type=marker,tag=buffoon.trophy_nebs,distance=..1] at @s run function buffoon:trophy/nebs/pickup
execute as @e[type=marker,tag=buffoon.trophy_nebs] at @s unless block ~ ~ ~ minecraft:light run function buffoon:trophy/nebs/pickup
execute as @e[type=item_display,tag=buffoon.trophy_display] at @s run tp @s ~ ~ ~ ~3 ~
scoreboard players add #tt buffoon.boss 1
execute if score #tt buffoon.boss matches 20.. run scoreboard players set #tt buffoon.boss 0
execute if score #tt buffoon.boss matches 0 as @e[type=marker,tag=buffoon.trophy] at @s run particle minecraft:end_rod ~ ~0.6 ~ 0.25 0.25 0.25 0.01 1
