# Ops: removes the most recently added zone on the planet you're standing on
function buffoon:event/zone/here
execute unless data storage buffoon:event here run return run tellraw @s {text:"Stand on a planet (or its master copy) first.",color:"red"}
data modify storage buffoon:event tmp.u.planet set from storage buffoon:event here
function buffoon:event/zone/undo_do with storage buffoon:event tmp.u
