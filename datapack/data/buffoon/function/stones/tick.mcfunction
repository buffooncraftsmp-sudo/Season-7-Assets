execute as @e[type=interaction,tag=buffoon.stone_comet] if data entity @s attack at @s run function buffoon:stones/comet/hit
execute as @e[type=marker,tag=buffoon.stone_comet] at @s unless block ~ ~ ~ minecraft:light run function buffoon:stones/comet/broken
execute as @e[type=marker,tag=buffoon.stone_comet] at @s run particle minecraft:wax_on ~ ~0.5 ~ 0.3 0.3 0.3 0 1
execute as @e[type=interaction,tag=buffoon.stone_gas_giant] if data entity @s attack at @s run function buffoon:stones/gas_giant/hit
execute as @e[type=marker,tag=buffoon.stone_gas_giant] at @s unless block ~ ~ ~ minecraft:light run function buffoon:stones/gas_giant/broken
execute as @e[type=marker,tag=buffoon.stone_gas_giant] at @s run particle minecraft:spore_blossom_air ~ ~0.5 ~ 0.3 0.3 0.3 0 1
execute as @e[type=interaction,tag=buffoon.stone_mars] if data entity @s attack at @s run function buffoon:stones/mars/hit
execute as @e[type=marker,tag=buffoon.stone_mars] at @s unless block ~ ~ ~ minecraft:light run function buffoon:stones/mars/broken
execute as @e[type=marker,tag=buffoon.stone_mars] at @s run particle minecraft:crimson_spore ~ ~0.5 ~ 0.3 0.3 0.3 0 1
execute as @e[type=interaction,tag=buffoon.stone_water_planet] if data entity @s attack at @s run function buffoon:stones/water_planet/hit
execute as @e[type=marker,tag=buffoon.stone_water_planet] at @s unless block ~ ~ ~ minecraft:light run function buffoon:stones/water_planet/broken
execute as @e[type=marker,tag=buffoon.stone_water_planet] at @s run particle minecraft:nautilus ~ ~0.5 ~ 0.3 0.3 0.3 0 1
execute as @e[type=item_display,tag=buffoon.stone_display] at @s run tp @s ~ ~ ~ ~4 ~
