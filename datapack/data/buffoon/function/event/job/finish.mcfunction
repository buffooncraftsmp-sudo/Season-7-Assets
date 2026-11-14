data modify storage buffoon:event tmp.op set value "unload"
function buffoon:event/job/each
function buffoon:event/job/unload_live
scoreboard players set #busy buffoon.event 0
