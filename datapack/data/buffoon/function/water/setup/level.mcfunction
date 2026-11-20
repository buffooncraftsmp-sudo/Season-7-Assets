# Records a water level: stand so your feet are in the block that should be the TOP layer of water.
#   /function buffoon:water/setup/level {area:"east",level:1}     (levels 1 to 4)
$execute unless data storage buffoon:water areas.$(area) run return run tellraw @s {text:"No water area called \"$(area)\".",color:"red"}
$scoreboard players set #lv buffoon.water $(level)
execute unless score #lv buffoon.water matches 1..4 run return run tellraw @s {text:"Level must be 1, 2, 3 or 4.",color:"red"}
execute store result score #y buffoon.water run data get entity @s Pos[1]
$function buffoon:water/setup/level_store {area:"$(area)",level:$(level)}
