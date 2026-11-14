# Runs buffoon:event/op/<tmp.op> once per zone, for every planet in the job
data modify storage buffoon:event tmp.planets set from storage buffoon:event job.planets
function buffoon:event/job/planets_loop
