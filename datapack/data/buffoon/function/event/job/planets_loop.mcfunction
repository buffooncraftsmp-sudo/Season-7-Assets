execute unless data storage buffoon:event tmp.planets[0] run return 0
data modify storage buffoon:event tmp.p set from storage buffoon:event tmp.planets[0]
data remove storage buffoon:event tmp.planets[0]
data remove storage buffoon:event tmp.zones
function buffoon:event/job/zones_set with storage buffoon:event tmp
function buffoon:event/job/zones_loop
function buffoon:event/job/planet_done with storage buffoon:event tmp
function buffoon:event/job/planets_loop
