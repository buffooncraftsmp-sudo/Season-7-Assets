# Stand on the spot where the laser should hit - the plinth and stone appear here
kill @e[type=marker,tag=buffoon.ufo_target]
kill @e[type=marker,tag=buffoon.ufo_target_origin]
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:["buffoon.ufo_target"]}
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:["buffoon.ufo_target_origin"]}
forceload add ~-3 ~-3 ~3 ~3
forceload add 5000 5000 5004 5004
schedule function buffoon:ufo/snapshot 40t
tellraw @s {text:"UFO laser target set here. Saving the spot in 2 seconds...",color:"#7CFF4F"}
