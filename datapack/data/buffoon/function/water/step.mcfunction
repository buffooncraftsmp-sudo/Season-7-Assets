# One area, once a tick (macro args = the area's stored data)
$execute unless score #$(id).snap buffoon.water matches 1 unless score #$(id).moving buffoon.water matches 1 run return 0
scoreboard players set #active buffoon.water 1
# nobody near it - wait until the area is loaded again
$execute in $(dim) unless loaded $(x1) $(y1) $(z1) run return 0
$execute in $(dim) unless loaded $(x2) $(y1) $(z2) run return 0
$execute if score #$(id).snap buffoon.water matches 1 run return run function buffoon:water/snap_now {id:"$(id)"}
$execute if score #$(id).cur buffoon.water = #$(id).target buffoon.water run return run function buffoon:water/arrive with storage buffoon:water areas.$(id)
$scoreboard players add #$(id).t buffoon.water 1
$execute if score #$(id).t buffoon.water < #speed buffoon.water run return 0
$scoreboard players set #$(id).t buffoon.water 0
$execute if score #$(id).cur buffoon.water < #$(id).target buffoon.water run return run function buffoon:water/rise {id:"$(id)"}
$function buffoon:water/fall {id:"$(id)"}
