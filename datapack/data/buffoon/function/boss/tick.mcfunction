execute if score #state buffoon.boss matches 0 run return 0
execute if score #still buffoon.boss matches 1.. run scoreboard players remove #still buffoon.boss 1
scoreboard players remove #sphase buffoon.boss 1
execute if score #sphase buffoon.boss matches ..0 run scoreboard players set #sphase buffoon.boss 4
execute if score #state buffoon.boss matches 6 as @e[type=marker,tag=buffoon.boss_portal] at @s run function buffoon:boss/portal_tick
execute if score #alive_comet buffoon.boss matches 1 at @n[type=marker,tag=buffoon.boss_pillar_comet] unless entity @e[type=end_crystal,distance=..4] run function buffoon:boss/crystal_broken_comet
execute if score #alive_gas_giant buffoon.boss matches 1 at @n[type=marker,tag=buffoon.boss_pillar_gas_giant] unless entity @e[type=end_crystal,distance=..4] run function buffoon:boss/crystal_broken_gas_giant
execute if score #alive_mars buffoon.boss matches 1 at @n[type=marker,tag=buffoon.boss_pillar_mars] unless entity @e[type=end_crystal,distance=..4] run function buffoon:boss/crystal_broken_mars
execute if score #alive_water_planet buffoon.boss matches 1 at @n[type=marker,tag=buffoon.boss_pillar_water_planet] unless entity @e[type=end_crystal,distance=..4] run function buffoon:boss/crystal_broken_water_planet
scoreboard players set #crystals buffoon.boss 0
scoreboard players operation #crystals buffoon.boss += #alive_comet buffoon.boss
scoreboard players operation #crystals buffoon.boss += #alive_gas_giant buffoon.boss
scoreboard players operation #crystals buffoon.boss += #alive_mars buffoon.boss
scoreboard players operation #crystals buffoon.boss += #alive_water_planet buffoon.boss
execute if score #state buffoon.boss matches 2 run function buffoon:boss/star_shield
execute if score #state buffoon.boss matches 4 run function buffoon:boss/star_shield
function buffoon:boss/shield_calc
execute as @e[type=item_display,tag=buffoon.boss_stone] at @s run tp @s ~ ~ ~ ~4 ~
execute if score #state buffoon.boss matches 1 run function buffoon:boss/intro_tick
execute if score #state buffoon.boss matches 2..5 unless entity @n[type=mannequin,tag=buffoon.boss] at @n[type=zombie,tag=buffoon.boss_hitbox] run function buffoon:boss/respawn_body
execute if score #state buffoon.boss matches 2..5 unless entity @n[type=zombie,tag=buffoon.boss_hitbox] at @n[type=mannequin,tag=buffoon.boss] run function buffoon:boss/respawn_hitbox
execute if score #state buffoon.boss matches 2..4 run function buffoon:boss/body
execute if score #state buffoon.boss matches 2..4 run function buffoon:boss/bubble
execute as @e[type=zombie,tag=buffoon.boss_hitbox] store result score #zh buffoon.boss run data get entity @s Health
execute if score #state buffoon.boss matches 2..4 if score #zh buffoon.boss matches ..999 as @e[type=zombie,tag=buffoon.boss_hitbox] run function buffoon:boss/hit
execute if score #state buffoon.boss matches 2 run function buffoon:boss/move
execute if score #state buffoon.boss matches 4 run function buffoon:boss/move
execute if score #state buffoon.boss matches 2 run function buffoon:boss/cast
execute if score #state buffoon.boss matches 4 run function buffoon:boss/cast
execute if score #state buffoon.boss matches 3 run function buffoon:boss/phase2_tick
execute as @e[type=marker,tag=buffoon.boss_strike] at @s run function buffoon:boss/strike_tick
execute if entity @e[type=marker,tag=buffoon.boss_strike] run function buffoon:boss/rifts
execute as @e[type=block_display,tag=buffoon.meteor_vis] at @s run function buffoon:boss/meteor_vis_tick
execute as @e[type=marker,tag=buffoon.boss_gas] at @s run function buffoon:boss/gas_tick
execute as @e[type=marker,tag=buffoon.boss_sweep] at @s run function buffoon:boss/sweep_tick
execute as @e[type=marker,tag=buffoon.boss_wave] at @s run function buffoon:boss/wave_tick
execute if score #state buffoon.boss matches 2 if score #hp buffoon.boss matches ..27 run function buffoon:boss/phase2_begin
execute if score #state buffoon.boss matches 4 if score #hp buffoon.boss matches ..0 run function buffoon:boss/death_begin
execute if score #state buffoon.boss matches 5 run function buffoon:boss/death_tick
