# Step 1 of defining a water area: stand at one corner of the pool. The block your feet are in counts.
#   /function buffoon:water/setup/corner1
execute store result storage buffoon:water pend.x int 1 run data get entity @s Pos[0]
execute store result storage buffoon:water pend.y int 1 run data get entity @s Pos[1]
execute store result storage buffoon:water pend.z int 1 run data get entity @s Pos[2]
data modify storage buffoon:water pend.dim set from entity @s Dimension
tellraw @s [{text:"Water corner 1 set at ",color:"aqua"},{storage:"buffoon:water",nbt:"pend.x"},{text:" "},{storage:"buffoon:water",nbt:"pend.y"},{text:" "},{storage:"buffoon:water",nbt:"pend.z"},{text:". Now stand at the opposite corner and run buffoon:water/setup/corner2 {area:\"name\"}",color:"aqua"}]
