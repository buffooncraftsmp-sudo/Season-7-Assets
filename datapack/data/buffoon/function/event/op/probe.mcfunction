$execute in buffoon:$(planet) store success score #fl buffoon.event run forceload query $(x1) $(z1)
execute if score #fl buffoon.event matches 0 run data modify storage buffoon:event job.live append from storage buffoon:event tmp.z
