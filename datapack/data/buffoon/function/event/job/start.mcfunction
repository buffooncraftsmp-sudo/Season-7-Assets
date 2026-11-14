# Starts a copy job. dir "reset" = master -> live, "save" = live -> master
execute if score #busy buffoon.event matches 1 run return run tellraw @a {text:"A planet reset is already running - give it a few seconds.",color:"gray"}
scoreboard players set #busy buffoon.event 1
scoreboard players set #tries buffoon.event 0
$data modify storage buffoon:event job set value {dir:"$(dir)",planets:$(planets),live:[]}
# note which live chunks aren't already forceloaded, so we only ever remove our own forceloads
data modify storage buffoon:event tmp.op set value "probe"
function buffoon:event/job/each
data modify storage buffoon:event tmp.op set value "load"
function buffoon:event/job/each
schedule function buffoon:event/job/try 5t
