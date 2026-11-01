# Fully shuts the Celestial Nexus down: removes the marker so tick stops all beams/particles,
# cancels a running sequence's effects and drops the forceload. Place the lodestone again to re-set it.
execute at @n[type=marker,tag=buffoon.nexus] run effect clear @a[distance=..64] minecraft:darkness
execute at @n[type=marker,tag=buffoon.nexus] run effect clear @a[distance=..64] minecraft:nausea
execute at @n[type=marker,tag=buffoon.nexus] run title @a[distance=..64] clear
execute at @n[type=marker,tag=buffoon.nexus] run stopsound @a[distance=..96]
execute at @n[type=marker,tag=buffoon.nexus] run forceload remove ~ ~
kill @e[tag=buffoon.nexus_star]
kill @e[type=marker,tag=buffoon.nexus]
scoreboard players set #state buffoon.nexus 3
scoreboard players set #nt buffoon.nexus 0
tellraw @s {text:"Celestial Nexus stopped. Break and re-place the lodestone to set it up again.",color:"#B48CFF"}
