kill @e[type=marker,tag=buffoon.nexus]
summon marker ~ ~ ~ {Tags:["buffoon.nexus"]}
forceload add ~ ~
scoreboard players set #state buffoon.nexus 0
tellraw @s {text:"Celestial Nexus set. Place the four Astronomer's Stones within 64 blocks of it.",color:"#B48CFF"}
