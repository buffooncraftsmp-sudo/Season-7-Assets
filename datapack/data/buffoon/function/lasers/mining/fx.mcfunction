execute if score #paused buffoon.laser matches 1 run bossbar set buffoon:mining name {text:"Mining the Comet Core",color:"gold"}
execute if score #paused buffoon.laser matches 1 run bossbar set buffoon:mining color yellow
scoreboard players set #paused buffoon.laser 0
# drill point
particle minecraft:lava ~ ~ ~ 1 0.3 1 0 4 force @a
particle minecraft:electric_spark ~ ~ ~ 1 0.5 1 0.4 10 force @a
particle minecraft:block{block_state:{Name:"minecraft:gilded_blackstone"}} ~ ~ ~ 1.5 0.4 1.5 0 10 force @a
# wide debris field and dust cloud around the site
particle minecraft:large_smoke ~ ~1 ~ 4 1.5 4 0.03 12 force @a
particle minecraft:campfire_cosy_smoke ~ ~ ~ 3 0.5 3 0.02 3 force @a
particle minecraft:block{block_state:{Name:"minecraft:blackstone"}} ~ ~0.5 ~ 7 1 7 0 25 force @a
particle minecraft:falling_dust{block_state:{Name:"minecraft:gilded_blackstone"}} ~ ~6 ~ 8 3 8 0 12 force @a
particle minecraft:white_ash ~ ~3 ~ 10 4 10 0 40 force @a
particle minecraft:wax_on ~ ~2 ~ 8 3 8 0 10 force @a
particle minecraft:end_rod ~ ~1 ~ 6 2 6 0.05 4 force @a
particle minecraft:lava ~ ~0.5 ~ 5 0.5 5 0 2 force @a
