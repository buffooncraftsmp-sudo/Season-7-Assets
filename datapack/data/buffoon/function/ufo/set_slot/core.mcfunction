# Stand in the block space where the Alien Power Core should be placed
execute as @e[type=marker,tag=buffoon.ufo_slot_core] at @s run function buffoon:ufo/core/holo_hide
kill @e[type=marker,tag=buffoon.ufo_slot_core]
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:["buffoon.ufo_slot","buffoon.ufo_slot_core"]}
forceload add ~ ~
scoreboard players set #core buffoon.ufo 0
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function buffoon:ufo/core/holo_show
tellraw @s {text:"Alien Power Core slot set here.",color:"#7CFF4F"}
