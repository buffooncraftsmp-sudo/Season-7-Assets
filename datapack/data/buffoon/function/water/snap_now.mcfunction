# Rebuilds every layer of the area: water up to the target, air above it
$data modify storage buffoon:water step set from storage buffoon:water areas.$(id)
$scoreboard players operation #L buffoon.water = #$(id).target buffoon.water
execute store result score #y buffoon.water run data get storage buffoon:water step.y1
execute store result score #top buffoon.water run data get storage buffoon:water step.y2
function buffoon:water/snap_loop
$scoreboard players operation #$(id).cur buffoon.water = #$(id).target buffoon.water
$scoreboard players set #$(id).snap buffoon.water 0
$scoreboard players set #$(id).moving buffoon.water 0
