kill @e[tag=buffoon.nexus_star]
execute at @n[type=marker,tag=buffoon.nexus] run kill @e[type=item,distance=..6]
scoreboard players set #state buffoon.nexus 3
scoreboard players set #nt buffoon.nexus 0
tellraw @s {text:"Convergence reset. It re-arms once at least one stone is picked up, and fires again when all four are back.",color:"#B48CFF"}
