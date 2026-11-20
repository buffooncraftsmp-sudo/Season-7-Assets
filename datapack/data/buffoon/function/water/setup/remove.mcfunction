#   /function buffoon:water/setup/remove {area:"east"}   (leaves the water where it is)
$data remove storage buffoon:water areas.$(area)
$data remove storage buffoon:water ids[{id:"$(area)"}]
$scoreboard players reset #$(area).cur buffoon.water
$scoreboard players reset #$(area).target buffoon.water
$scoreboard players reset #$(area).lvl buffoon.water
$scoreboard players reset #$(area).moving buffoon.water
$scoreboard players reset #$(area).snap buffoon.water
$tellraw @s {text:"Water area \"$(area)\" removed.",color:"aqua"}
