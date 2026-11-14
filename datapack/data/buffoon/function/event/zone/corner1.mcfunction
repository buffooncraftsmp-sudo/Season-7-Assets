# Ops: stand in one corner of a puzzle (the block your feet are in) and run this, then zone/corner2
function buffoon:event/zone/here
execute unless data storage buffoon:event here run return run tellraw @s {text:"Stand on a planet (or its master copy) first.",color:"red"}
data modify storage buffoon:event pending.planet set from storage buffoon:event here
execute align xyz run summon marker ~ ~ ~ {Tags:["buffoon.event_tmp"]}
execute store result storage buffoon:event pending.x int 1 run data get entity @n[type=marker,tag=buffoon.event_tmp] Pos[0]
execute store result storage buffoon:event pending.y int 1 run data get entity @n[type=marker,tag=buffoon.event_tmp] Pos[1]
execute store result storage buffoon:event pending.z int 1 run data get entity @n[type=marker,tag=buffoon.event_tmp] Pos[2]
kill @e[type=marker,tag=buffoon.event_tmp]
tellraw @s [{text:"Corner 1 set. Now stand in the opposite corner and run ",color:"#B48CFF"},{text:"/function buffoon:event/zone/corner2",color:"white"}]
