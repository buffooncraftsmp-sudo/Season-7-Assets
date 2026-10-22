execute if score #core buffoon.ufo matches 1 as @e[type=marker,tag=buffoon.ufo_slot_core] at @s unless block ~ ~ ~ minecraft:beacon run function buffoon:ufo/core/broken
execute if score #core buffoon.ufo matches 0 if score #t buffoon.ufo matches 0 as @e[type=marker,tag=buffoon.ufo_slot_core] at @s run particle minecraft:dust{color:[0.5,1.0,0.3],scale:1.2f} ~ ~-0.4 ~ 0.4 0 0.4 0 6 force @a
execute if score #nav buffoon.ufo matches 1 as @e[type=marker,tag=buffoon.ufo_slot_nav] at @s unless block ~ ~ ~ minecraft:cartography_table run function buffoon:ufo/nav/broken
execute if score #nav buffoon.ufo matches 0 if score #t buffoon.ufo matches 0 as @e[type=marker,tag=buffoon.ufo_slot_nav] at @s run particle minecraft:dust{color:[0.5,1.0,0.3],scale:1.2f} ~ ~-0.4 ~ 0.4 0 0.4 0 6 force @a
execute if score #panel buffoon.ufo matches 1 as @e[type=marker,tag=buffoon.ufo_slot_panel] at @s unless block ~ ~ ~ minecraft:comparator run function buffoon:ufo/panel/broken
execute if score #panel buffoon.ufo matches 0 if score #t buffoon.ufo matches 0 as @e[type=marker,tag=buffoon.ufo_slot_panel] at @s run particle minecraft:dust{color:[0.5,1.0,0.3],scale:1.2f} ~ ~-0.4 ~ 0.4 0 0.4 0 6 force @a
execute as @e[type=marker,tag=buffoon.ufo_emitter] at @s unless block ~ ~ ~ minecraft:lime_stained_glass run kill @s
scoreboard players add #t buffoon.ufo 1
execute if score #t buffoon.ufo matches 4.. run scoreboard players set #t buffoon.ufo 0
execute as @e[type=item_display,tag=buffoon.ufo_ghost] at @s run tp @s ~ ~ ~ ~4 ~
scoreboard players operation #count buffoon.ufo = #core buffoon.ufo
scoreboard players operation #count buffoon.ufo += #nav buffoon.ufo
scoreboard players operation #count buffoon.ufo += #panel buffoon.ufo
execute if score #state buffoon.ufo matches 0 if score #count buffoon.ufo matches 3 run function buffoon:ufo/power_start
execute if score #state buffoon.ufo matches 1 run function buffoon:ufo/power_tick
execute if score #state buffoon.ufo matches 2 run scoreboard players remove #fire buffoon.ufo 1
execute if score #state buffoon.ufo matches 2 if score #fire buffoon.ufo matches ..0 run function buffoon:ufo/reveal
execute if score #state buffoon.ufo matches 2.. if score #t buffoon.ufo matches 0..1 as @e[type=marker,tag=buffoon.ufo_emitter] at @s run function buffoon:ufo/beam_start
execute if score #state buffoon.ufo matches 1.. if score #count buffoon.ufo matches 0 run function buffoon:ufo/reset
