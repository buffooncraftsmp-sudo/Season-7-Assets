kill @e[type=marker,tag=buffoon.ufo_emitter]
summon marker ~ ~ ~ {Tags:["buffoon.ufo_emitter"]}
forceload add ~ ~
tellraw @s {text:"UFO laser emitter set here.",color:"#7CFF4F"}
