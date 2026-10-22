# Stand in the block space where the Alien Navigation System should be placed
execute as @e[type=marker,tag=buffoon.ufo_slot_nav] at @s run function buffoon:ufo/nav/holo_hide
kill @e[type=marker,tag=buffoon.ufo_slot_nav]
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:["buffoon.ufo_slot","buffoon.ufo_slot_nav"]}
forceload add ~ ~
scoreboard players set #nav buffoon.ufo 0
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function buffoon:ufo/nav/holo_show
tellraw @s {text:"Alien Navigation System slot set here.",color:"#7CFF4F"}
