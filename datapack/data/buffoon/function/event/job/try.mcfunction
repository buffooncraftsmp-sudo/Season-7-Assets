# Waits (up to ~10s) for every zone to load in both dimensions, then copies
scoreboard players set #ok buffoon.event 1
data modify storage buffoon:event tmp.op set value "check"
function buffoon:event/job/each
execute if score #ok buffoon.event matches 0 run scoreboard players add #tries buffoon.event 1
execute if score #ok buffoon.event matches 0 if score #tries buffoon.event matches ..40 run return run schedule function buffoon:event/job/try 5t
execute if score #ok buffoon.event matches 0 run tellraw @a {text:"Planet reset failed - the puzzle areas wouldn't load. Try again.",color:"red"}
execute if score #ok buffoon.event matches 1 run data modify storage buffoon:event tmp.op set from storage buffoon:event job.dir
execute if score #ok buffoon.event matches 1 run function buffoon:event/job/each
function buffoon:event/job/finish
