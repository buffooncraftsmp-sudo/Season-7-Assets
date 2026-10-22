# Stand in the block space where the Alien Control Panel should be placed
execute as @e[type=marker,tag=buffoon.ufo_slot_panel] at @s run function buffoon:ufo/panel/holo_hide
kill @e[type=marker,tag=buffoon.ufo_slot_panel]
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:["buffoon.ufo_slot","buffoon.ufo_slot_panel"]}
forceload add ~ ~
scoreboard players set #panel buffoon.ufo 0
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function buffoon:ufo/panel/holo_show
tellraw @s {text:"Alien Control Panel slot set here.",color:"#7CFF4F"}
