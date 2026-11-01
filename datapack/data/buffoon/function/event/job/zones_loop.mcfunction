execute unless data storage buffoon:event tmp.zones[0] run return 0
data modify storage buffoon:event tmp.z set from storage buffoon:event tmp.zones[0]
data remove storage buffoon:event tmp.zones[0]
function buffoon:event/job/dispatch with storage buffoon:event tmp
function buffoon:event/job/zones_loop
