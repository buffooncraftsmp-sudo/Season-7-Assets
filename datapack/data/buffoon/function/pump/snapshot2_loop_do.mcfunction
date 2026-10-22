$execute in buffoon:gas_giant store success score #cs buffoon.pump run clone $(x1) $(y) $(z1) $(x2) $(y) $(z2) 5000 $(vy) 5000 replace force
execute unless score #cs buffoon.pump matches 1 run scoreboard players set #ok buffoon.pump 0
