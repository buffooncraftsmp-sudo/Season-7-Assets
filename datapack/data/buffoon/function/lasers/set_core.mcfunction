# Run this standing where the beams should hit (e.g. 0 ~ 0 on The Comet). Snapshots the dig site for resets.
kill @e[type=marker,tag=buffoon.laser_core]
kill @e[type=marker,tag=buffoon.laser_origin]
execute align xz positioned ~0.5 ~ ~0.5 run summon marker ~ ~ ~ {Tags:["buffoon.laser_core"]}
execute align xz positioned ~0.5 ~ ~0.5 run summon marker ~ ~ ~ {Tags:["buffoon.laser_origin"]}
forceload add ~-6 ~-6 ~6 ~6
forceload add 5000 5000 5010 5010
# give the forceloaded chunks a moment to load before snapshotting
schedule function buffoon:lasers/snapshot 40t
tellraw @s {text:"Laser target set here. Saving the dig site in 2 seconds...",color:"gold"}
