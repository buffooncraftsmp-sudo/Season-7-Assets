kill @e[type=marker,tag=buffoon.boss_center]
execute in buffoon:the_moon run summon marker 0.5 150 0.5 {Tags:["buffoon.boss_center","buffoon.boss_ent"]}
execute as @n[type=marker,tag=buffoon.boss_center] run function buffoon:boss/ground_start
execute in buffoon:the_moon run summon marker 0.5 150 -27.5 {Tags:["buffoon.boss_pillar","buffoon.boss_pillar_comet","buffoon.boss_ent"]}
execute as @n[type=marker,tag=buffoon.boss_pillar_comet] run function buffoon:boss/ground_start_pillar
execute as @n[type=marker,tag=buffoon.boss_pillar_comet] at @s run function buffoon:boss/pillar_comet
execute in buffoon:the_moon run summon marker 28.5 150 0.5 {Tags:["buffoon.boss_pillar","buffoon.boss_pillar_gas_giant","buffoon.boss_ent"]}
execute as @n[type=marker,tag=buffoon.boss_pillar_gas_giant] run function buffoon:boss/ground_start_pillar
execute as @n[type=marker,tag=buffoon.boss_pillar_gas_giant] at @s run function buffoon:boss/pillar_gas_giant
execute in buffoon:the_moon run summon marker 0.5 150 28.5 {Tags:["buffoon.boss_pillar","buffoon.boss_pillar_mars","buffoon.boss_ent"]}
execute as @n[type=marker,tag=buffoon.boss_pillar_mars] run function buffoon:boss/ground_start_pillar
execute as @n[type=marker,tag=buffoon.boss_pillar_mars] at @s run function buffoon:boss/pillar_mars
execute in buffoon:the_moon run summon marker -27.5 150 0.5 {Tags:["buffoon.boss_pillar","buffoon.boss_pillar_water_planet","buffoon.boss_ent"]}
execute as @n[type=marker,tag=buffoon.boss_pillar_water_planet] run function buffoon:boss/ground_start_pillar
execute as @n[type=marker,tag=buffoon.boss_pillar_water_planet] at @s run function buffoon:boss/pillar_water_planet
schedule function buffoon:boss/intro 20t
