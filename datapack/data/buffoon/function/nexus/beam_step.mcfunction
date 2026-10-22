scoreboard players operation #nm buffoon.nexus = #nray buffoon.nexus
scoreboard players operation #nm buffoon.nexus += #nphase buffoon.nexus
scoreboard players operation #nm buffoon.nexus %= #4 buffoon.nexus
$execute if score #nm buffoon.nexus matches 0 run particle minecraft:dust{color:$(c),scale:$(s)f} ~ ~ ~ 0.12 0.12 0.12 0 1 force @a
$execute if score #nm buffoon.nexus matches 0 run particle $(p1) ~ ~ ~ 0.15 0.15 0.15 0 1 force @a
scoreboard players operation #nm2 buffoon.nexus = #nray buffoon.nexus
scoreboard players operation #nm2 buffoon.nexus %= #3 buffoon.nexus
$execute if score #nm2 buffoon.nexus matches 0 run particle $(p2) ~ ~ ~ 0.35 0.35 0.35 0 1 force @a
scoreboard players add #nray buffoon.nexus 1
execute if entity @n[type=marker,tag=buffoon.nexus,distance=..0.8] run return run particle minecraft:end_rod ~ ~ ~ 0.2 0.2 0.2 0.02 1 force @a
$execute if score #nray buffoon.nexus matches ..300 positioned ^ ^ ^0.5 run function buffoon:nexus/beam_step {c:"$(c)",s:"$(s)",p1:"$(p1)",p2:"$(p2)"}
