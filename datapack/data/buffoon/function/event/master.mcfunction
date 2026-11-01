# Ops: hop between a planet and its master copy, keeping the same coordinates
execute if dimension buffoon:gas_giant in buffoon:gas_giant_master run return run tp @s ~ ~ ~
execute if dimension buffoon:gas_giant_master in buffoon:gas_giant run return run tp @s ~ ~ ~
execute if dimension buffoon:mars in buffoon:mars_master run return run tp @s ~ ~ ~
execute if dimension buffoon:mars_master in buffoon:mars run return run tp @s ~ ~ ~
execute if dimension buffoon:the_comet in buffoon:the_comet_master run return run tp @s ~ ~ ~
execute if dimension buffoon:the_comet_master in buffoon:the_comet run return run tp @s ~ ~ ~
execute if dimension buffoon:the_moon in buffoon:the_moon_master run return run tp @s ~ ~ ~
execute if dimension buffoon:the_moon_master in buffoon:the_moon run return run tp @s ~ ~ ~
execute if dimension buffoon:water_planet in buffoon:water_planet_master run return run tp @s ~ ~ ~
execute if dimension buffoon:water_planet_master in buffoon:water_planet run return run tp @s ~ ~ ~
tellraw @s {text:"Stand on a planet (or its master copy) first.",color:"red"}
