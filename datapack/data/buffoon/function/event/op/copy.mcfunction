# Copies the zone one layer at a time so no single clone hits the 32,768 block limit
execute store result score #y buffoon.event run data get storage buffoon:event tmp.z.y1
execute store result score #y2 buffoon.event run data get storage buffoon:event tmp.z.y2
function buffoon:event/op/copy_loop
