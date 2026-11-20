# Clamps #y to the area (one below the bottom = empty, top corner = full) and saves it
$execute store result score #lo buffoon.water run data get storage buffoon:water areas.$(area).y1
scoreboard players remove #lo buffoon.water 1
$execute store result score #hi buffoon.water run data get storage buffoon:water areas.$(area).y2
scoreboard players operation #y buffoon.water > #lo buffoon.water
scoreboard players operation #y buffoon.water < #hi buffoon.water
$execute store result storage buffoon:water areas.$(area).levels.l$(level) int 1 run scoreboard players get #y buffoon.water
$execute if score #y buffoon.water = #lo buffoon.water run return run tellraw @s {text:"Area \"$(area)\" level $(level) set to empty.",color:"aqua"}
$tellraw @s [{text:"Area \"$(area)\" level $(level): water up to Y=",color:"aqua"},{score:{name:"#y",objective:"buffoon.water"}}]
