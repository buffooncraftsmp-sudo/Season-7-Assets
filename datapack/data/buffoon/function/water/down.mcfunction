# One level lower (stops at 1):   function buffoon:water/down {area:"east"}
$execute unless score #$(area).lvl buffoon.water matches 1.. run scoreboard players set #$(area).lvl buffoon.water 1
$execute if score #$(area).lvl buffoon.water matches ..1 run return 0
$scoreboard players operation #nl buffoon.water = #$(area).lvl buffoon.water
scoreboard players remove #nl buffoon.water 1
$data modify storage buffoon:water arg.area set value "$(area)"
execute store result storage buffoon:water arg.level int 1 run scoreboard players get #nl buffoon.water
function buffoon:water/set with storage buffoon:water arg
