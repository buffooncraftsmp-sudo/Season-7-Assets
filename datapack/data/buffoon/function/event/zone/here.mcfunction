# Sets storage buffoon:event here to the planet the player is on (live or master copy)
data remove storage buffoon:event here
execute if dimension buffoon:gas_giant run data modify storage buffoon:event here set value "gas_giant"
execute if dimension buffoon:gas_giant_master run data modify storage buffoon:event here set value "gas_giant"
execute if dimension buffoon:mars run data modify storage buffoon:event here set value "mars"
execute if dimension buffoon:mars_master run data modify storage buffoon:event here set value "mars"
execute if dimension buffoon:the_comet run data modify storage buffoon:event here set value "the_comet"
execute if dimension buffoon:the_comet_master run data modify storage buffoon:event here set value "the_comet"
execute if dimension buffoon:the_moon run data modify storage buffoon:event here set value "the_moon"
execute if dimension buffoon:the_moon_master run data modify storage buffoon:event here set value "the_moon"
execute if dimension buffoon:water_planet run data modify storage buffoon:event here set value "water_planet"
execute if dimension buffoon:water_planet_master run data modify storage buffoon:event here set value "water_planet"
