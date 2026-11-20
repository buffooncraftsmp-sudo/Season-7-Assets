# Makes a level completely drained (no water at all in the area).
#   /function buffoon:water/setup/level_empty {area:"east",level:1}
$execute unless data storage buffoon:water areas.$(area) run return run tellraw @s {text:"No water area called \"$(area)\".",color:"red"}
$scoreboard players set #lv buffoon.water $(level)
execute unless score #lv buffoon.water matches 1..4 run return run tellraw @s {text:"Level must be 1, 2, 3 or 4.",color:"red"}
$execute store result score #y buffoon.water run data get storage buffoon:water areas.$(area).y1
scoreboard players remove #y buffoon.water 1
$function buffoon:water/setup/level_store {area:"$(area)",level:$(level)}
