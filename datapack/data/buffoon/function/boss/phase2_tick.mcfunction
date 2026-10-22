scoreboard players add #bt buffoon.boss 1
execute if score #bt buffoon.boss matches 20 as @n[type=marker,tag=buffoon.boss_pillar_comet] at @s run function buffoon:boss/crystal_comet
execute if score #bt buffoon.boss matches 35 as @n[type=marker,tag=buffoon.boss_pillar_gas_giant] at @s run function buffoon:boss/crystal_gas_giant
execute if score #bt buffoon.boss matches 50 as @n[type=marker,tag=buffoon.boss_pillar_mars] at @s run function buffoon:boss/crystal_mars
execute if score #bt buffoon.boss matches 65 as @n[type=marker,tag=buffoon.boss_pillar_water_planet] at @s run function buffoon:boss/crystal_water_planet
execute if score #bt buffoon.boss matches 100.. run scoreboard players set #state buffoon.boss 4
execute if score #bt buffoon.boss matches 100.. run scoreboard players set #cd buffoon.boss 60
execute if score #bt buffoon.boss matches 100.. run scoreboard players set #mv buffoon.boss 140
