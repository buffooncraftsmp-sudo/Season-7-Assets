# Only does any work while a water area is moving or waiting to snap
execute unless score #active buffoon.water matches 1 run return 0
scoreboard players set #active buffoon.water 0
data modify storage buffoon:water queue set from storage buffoon:water ids
function buffoon:water/loop
