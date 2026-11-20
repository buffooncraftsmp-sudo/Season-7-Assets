# Step 2: stand at the opposite corner and name the area (lowercase letters/numbers/_ only):
#   /function buffoon:water/setup/corner2 {area:"east"}
# The lowest corner is the bottom water layer, the highest is the most it can ever fill to.
execute unless data storage buffoon:water pend.dim run return run tellraw @s {text:"Run buffoon:water/setup/corner1 first.",color:"red"}
data modify storage buffoon:water tmp.dim set from entity @s Dimension
execute store success score #diff buffoon.water run data modify storage buffoon:water tmp.dim set from storage buffoon:water pend.dim
execute if score #diff buffoon.water matches 1 run return run tellraw @s {text:"Both corners must be in the same dimension.",color:"red"}
execute store result score #ax buffoon.water run data get storage buffoon:water pend.x
execute store result score #ay buffoon.water run data get storage buffoon:water pend.y
execute store result score #az buffoon.water run data get storage buffoon:water pend.z
execute store result score #bx buffoon.water run data get entity @s Pos[0]
execute store result score #by buffoon.water run data get entity @s Pos[1]
execute store result score #bz buffoon.water run data get entity @s Pos[2]
scoreboard players operation #x1 buffoon.water = #ax buffoon.water
scoreboard players operation #x1 buffoon.water < #bx buffoon.water
scoreboard players operation #x2 buffoon.water = #ax buffoon.water
scoreboard players operation #x2 buffoon.water > #bx buffoon.water
scoreboard players operation #y1 buffoon.water = #ay buffoon.water
scoreboard players operation #y1 buffoon.water < #by buffoon.water
scoreboard players operation #y2 buffoon.water = #ay buffoon.water
scoreboard players operation #y2 buffoon.water > #by buffoon.water
scoreboard players operation #z1 buffoon.water = #az buffoon.water
scoreboard players operation #z1 buffoon.water < #bz buffoon.water
scoreboard players operation #z2 buffoon.water = #az buffoon.water
scoreboard players operation #z2 buffoon.water > #bz buffoon.water
# one layer has to fit in a single /fill (32,768 blocks)
scoreboard players operation #w buffoon.water = #x2 buffoon.water
scoreboard players operation #w buffoon.water -= #x1 buffoon.water
scoreboard players add #w buffoon.water 1
scoreboard players operation #d buffoon.water = #z2 buffoon.water
scoreboard players operation #d buffoon.water -= #z1 buffoon.water
scoreboard players add #d buffoon.water 1
scoreboard players operation #w buffoon.water *= #d buffoon.water
execute if score #w buffoon.water matches 32769.. run return run tellraw @s {text:"That area is too wide - each layer must be 32,768 blocks or fewer (about 181x181). Split it into two areas.",color:"red"}
data modify storage buffoon:water new set value {levels:{}}
data modify storage buffoon:water new.dim set from storage buffoon:water pend.dim
$data modify storage buffoon:water new.id set value "$(area)"
execute store result storage buffoon:water new.x1 int 1 run scoreboard players get #x1 buffoon.water
execute store result storage buffoon:water new.y1 int 1 run scoreboard players get #y1 buffoon.water
execute store result storage buffoon:water new.z1 int 1 run scoreboard players get #z1 buffoon.water
execute store result storage buffoon:water new.x2 int 1 run scoreboard players get #x2 buffoon.water
execute store result storage buffoon:water new.y2 int 1 run scoreboard players get #y2 buffoon.water
execute store result storage buffoon:water new.z2 int 1 run scoreboard players get #z2 buffoon.water
# centre, for sounds and particles
scoreboard players operation #x1 buffoon.water += #x2 buffoon.water
scoreboard players operation #x1 buffoon.water /= #2 buffoon.water
scoreboard players operation #z1 buffoon.water += #z2 buffoon.water
scoreboard players operation #z1 buffoon.water /= #2 buffoon.water
execute store result storage buffoon:water new.cx int 1 run scoreboard players get #x1 buffoon.water
execute store result storage buffoon:water new.cz int 1 run scoreboard players get #z1 buffoon.water
$data modify storage buffoon:water areas.$(area) set from storage buffoon:water new
$execute unless data storage buffoon:water ids[{id:"$(area)"}] run data modify storage buffoon:water ids append value {id:"$(area)"}
# forget the old level so the first button press snaps the water into place
$scoreboard players reset #$(area).cur buffoon.water
$scoreboard players reset #$(area).moving buffoon.water
$scoreboard players reset #$(area).snap buffoon.water
data remove storage buffoon:water pend
$tellraw @s [{text:"Water area \"$(area)\" saved (",color:"aqua"},{score:{name:"#w",objective:"buffoon.water"}},{text:" blocks per layer). Now set its 4 levels with buffoon:water/setup/level {area:\"$(area)\",level:1}",color:"aqua"}]
