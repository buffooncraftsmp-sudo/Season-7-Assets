scoreboard players add #t buffoon.nexus 1
execute if score #t buffoon.nexus matches 2.. run scoreboard players set #t buffoon.nexus 0
execute unless entity @n[type=marker,tag=buffoon.nexus] run return 0
function buffoon:nexus/detect
scoreboard players remove #nphase buffoon.nexus 1
execute if score #nphase buffoon.nexus matches ..0 run scoreboard players set #nphase buffoon.nexus 4
execute if score #state buffoon.nexus matches 0 at @n[type=marker,tag=buffoon.nexus] run function buffoon:nexus/streams {s:"0.9"}
execute if score #state buffoon.nexus matches 0 if score #t buffoon.nexus matches 0 at @n[type=marker,tag=buffoon.nexus] run particle minecraft:portal ~ ~0.8 ~ 0.3 0.3 0.3 0.3 4 force @a
execute if score #state buffoon.nexus matches 0 if score #have buffoon.nexus matches 4 run function buffoon:nexus/start
execute if score #state buffoon.nexus matches 1 run function buffoon:nexus/sequence
execute if score #state buffoon.nexus matches 3 if score #have buffoon.nexus matches ..3 run scoreboard players set #state buffoon.nexus 0
execute as @e[type=item_display,tag=buffoon.nexus_star] at @s run tp @s ~ ~ ~ ~3 ~
execute if score #state buffoon.nexus matches 2 if score #t buffoon.nexus matches 0 at @n[type=marker,tag=buffoon.nexus] run particle minecraft:end_rod ~ ~2.5 ~ 0.6 0.6 0.6 0.02 2 force @a
execute if score #state buffoon.nexus matches 2 at @n[type=marker,tag=buffoon.nexus] run function buffoon:nexus/streams {s:"0.8"}
