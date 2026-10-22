# the_comet
execute in buffoon:the_comet as @a[distance=0..,tag=!buffoon.on_the_comet] run function buffoon:the_comet/enter
execute as @a[tag=buffoon.on_the_comet] at @s unless dimension buffoon:the_comet run function buffoon:the_comet/leave
# gas_giant
execute in buffoon:gas_giant as @a[distance=0..,tag=!buffoon.on_gas_giant] run function buffoon:gas_giant/enter
execute as @a[tag=buffoon.on_gas_giant] at @s unless dimension buffoon:gas_giant run function buffoon:gas_giant/leave
# mars
execute in buffoon:mars as @a[distance=0..,tag=!buffoon.on_mars] run function buffoon:mars/enter
execute as @a[tag=buffoon.on_mars] at @s unless dimension buffoon:mars run function buffoon:mars/leave
# water_planet
execute in buffoon:water_planet as @a[distance=0..,tag=!buffoon.on_water_planet] run function buffoon:water_planet/enter
execute as @a[tag=buffoon.on_water_planet] at @s unless dimension buffoon:water_planet run function buffoon:water_planet/leave
# migrate from earlier version
execute as @a[tag=buffoon.on_comet] run attribute @s minecraft:gravity modifier remove buffoon:comet_gravity
tag @a[tag=buffoon.on_comet] remove buffoon.on_comet
# astronomer's stones
function buffoon:stones/tick
# comet mining lasers
function buffoon:lasers/tick
# planet reward gear
function buffoon:items/tick
# mars ufo repair
function buffoon:ufo/tick
# gas giant toxic pool pump
function buffoon:pump/tick
# season 7 achievements
function buffoon:s7/tick
# the convergence
function buffoon:nexus/tick
# moon gravity
function buffoon:the_moon/tick
# final boss
function buffoon:boss/tick
# trophies
function buffoon:trophy/tick
