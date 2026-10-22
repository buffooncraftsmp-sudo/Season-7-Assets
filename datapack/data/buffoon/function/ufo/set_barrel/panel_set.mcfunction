kill @e[type=marker,tag=buffoon.ufo_barrel_panel]
summon marker ~ ~ ~ {Tags:["buffoon.ufo_barrel","buffoon.ufo_barrel_panel"]}
forceload add ~ ~
function buffoon:ufo/refill/panel
particle minecraft:happy_villager ~ ~ ~ 0.5 0.5 0.5 0 20 force @s
tellraw @s {text:"Alien Control Panel will be hidden in this barrel (filled now and on every reset).",color:"#7CFF4F"}
scoreboard players set @s buffoon.ray 100
