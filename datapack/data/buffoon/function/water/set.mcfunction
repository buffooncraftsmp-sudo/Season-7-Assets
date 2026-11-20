# Moves an area's water to one of its 4 levels, a layer at a time. For a command block behind a button:
#   function buffoon:water/set {area:"east",level:3}
$execute unless data storage buffoon:water areas.$(area).levels.l$(level) run return run tellraw @s {text:"Water area \"$(area)\" has no level $(level) set.",color:"red"}
$execute store result score #$(area).target buffoon.water run data get storage buffoon:water areas.$(area).levels.l$(level)
$scoreboard players set #$(area).lvl buffoon.water $(level)
scoreboard players set #active buffoon.water 1
# never been set (new area or after a re-define) - snap straight to the level
$execute unless score #$(area).cur buffoon.water = #$(area).cur buffoon.water run return run scoreboard players set #$(area).snap buffoon.water 1
$execute if score #$(area).cur buffoon.water = #$(area).target buffoon.water run return 0
$execute unless score #$(area).moving buffoon.water matches 1 run function buffoon:water/start_sound with storage buffoon:water areas.$(area)
$scoreboard players set #$(area).moving buffoon.water 1
$scoreboard players operation #$(area).t buffoon.water = #speed buffoon.water
