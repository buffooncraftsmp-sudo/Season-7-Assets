# Ops: second corner - registers the box as a puzzle zone on this planet
function buffoon:event/zone/here
execute unless data storage buffoon:event pending.planet run return run tellraw @s {text:"Run zone/corner1 first.",color:"red"}
execute unless data storage buffoon:event here run return run tellraw @s {text:"Stand on a planet (or its master copy) first.",color:"red"}
data modify storage buffoon:event tmp.cmp set from storage buffoon:event pending.planet
execute store success score #diff buffoon.event run data modify storage buffoon:event tmp.cmp set from storage buffoon:event here
execute if score #diff buffoon.event matches 1 run return run tellraw @s {text:"Both corners must be on the same planet.",color:"red"}
execute align xyz run summon marker ~ ~ ~ {Tags:["buffoon.event_tmp"]}
execute store result score #bx buffoon.event run data get entity @n[type=marker,tag=buffoon.event_tmp] Pos[0]
execute store result score #by buffoon.event run data get entity @n[type=marker,tag=buffoon.event_tmp] Pos[1]
execute store result score #bz buffoon.event run data get entity @n[type=marker,tag=buffoon.event_tmp] Pos[2]
kill @e[type=marker,tag=buffoon.event_tmp]
execute store result score #ax buffoon.event run data get storage buffoon:event pending.x
execute store result score #ay buffoon.event run data get storage buffoon:event pending.y
execute store result score #az buffoon.event run data get storage buffoon:event pending.z
scoreboard players operation #x1 buffoon.event = #ax buffoon.event
scoreboard players operation #x1 buffoon.event < #bx buffoon.event
scoreboard players operation #x2 buffoon.event = #ax buffoon.event
scoreboard players operation #x2 buffoon.event > #bx buffoon.event
scoreboard players operation #y1 buffoon.event = #ay buffoon.event
scoreboard players operation #y1 buffoon.event < #by buffoon.event
scoreboard players operation #y2 buffoon.event = #ay buffoon.event
scoreboard players operation #y2 buffoon.event > #by buffoon.event
scoreboard players operation #z1 buffoon.event = #az buffoon.event
scoreboard players operation #z1 buffoon.event < #bz buffoon.event
scoreboard players operation #z2 buffoon.event = #az buffoon.event
scoreboard players operation #z2 buffoon.event > #bz buffoon.event
scoreboard players operation #dx buffoon.event = #x2 buffoon.event
scoreboard players operation #dx buffoon.event -= #x1 buffoon.event
scoreboard players add #dx buffoon.event 1
scoreboard players operation #dy buffoon.event = #y2 buffoon.event
scoreboard players operation #dy buffoon.event -= #y1 buffoon.event
scoreboard players add #dy buffoon.event 1
scoreboard players operation #dz buffoon.event = #z2 buffoon.event
scoreboard players operation #dz buffoon.event -= #z1 buffoon.event
scoreboard players add #dz buffoon.event 1
# each layer is one clone, which is capped at 32,768 blocks
scoreboard players operation #area buffoon.event = #dx buffoon.event
scoreboard players operation #area buffoon.event *= #dz buffoon.event
execute if score #area buffoon.event matches 32769.. run return run tellraw @s {text:"Too wide - one layer is over 32,768 blocks. Split it into smaller zones.",color:"red"}
data modify storage buffoon:event tmp.new set value {}
data modify storage buffoon:event tmp.new.planet set from storage buffoon:event pending.planet
execute store result storage buffoon:event tmp.new.x1 int 1 run scoreboard players get #x1 buffoon.event
execute store result storage buffoon:event tmp.new.y1 int 1 run scoreboard players get #y1 buffoon.event
execute store result storage buffoon:event tmp.new.z1 int 1 run scoreboard players get #z1 buffoon.event
execute store result storage buffoon:event tmp.new.x2 int 1 run scoreboard players get #x2 buffoon.event
execute store result storage buffoon:event tmp.new.y2 int 1 run scoreboard players get #y2 buffoon.event
execute store result storage buffoon:event tmp.new.z2 int 1 run scoreboard players get #z2 buffoon.event
data remove storage buffoon:event pending
function buffoon:event/zone/add with storage buffoon:event tmp.new
