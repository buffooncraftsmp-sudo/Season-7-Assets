# Puts an area straight to a level with no animation (setup, and the planet reset):
#   /function buffoon:water/snap {area:"east",level:1}
$execute unless data storage buffoon:water areas.$(area).levels.l$(level) run return run tellraw @s {text:"Water area \"$(area)\" has no level $(level) set.",color:"red"}
$execute store result score #$(area).target buffoon.water run data get storage buffoon:water areas.$(area).levels.l$(level)
$scoreboard players set #$(area).lvl buffoon.water $(level)
$scoreboard players set #$(area).moving buffoon.water 0
$scoreboard players set #$(area).snap buffoon.water 1
scoreboard players set #active buffoon.water 1
