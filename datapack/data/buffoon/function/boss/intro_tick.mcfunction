scoreboard players add #bt buffoon.boss 1
execute if score #bt buffoon.boss matches 40 as @n[type=marker,tag=buffoon.boss_pillar_comet] at @s run function buffoon:boss/crystal_comet
execute if score #bt buffoon.boss matches 60 as @n[type=marker,tag=buffoon.boss_pillar_gas_giant] at @s run function buffoon:boss/crystal_gas_giant
execute if score #bt buffoon.boss matches 80 as @n[type=marker,tag=buffoon.boss_pillar_mars] at @s run function buffoon:boss/crystal_mars
execute if score #bt buffoon.boss matches 100 as @n[type=marker,tag=buffoon.boss_pillar_water_planet] at @s run function buffoon:boss/crystal_water_planet
execute if score #bt buffoon.boss matches 140 at @n[type=marker,tag=buffoon.boss_center] run function buffoon:boss/spawn
execute if score #bt buffoon.boss matches 200.. run function buffoon:boss/phase1_begin
