$execute in buffoon:gas_giant as @a[x=$(x1),y=$(bot),z=$(z1),dx=40,dy=$(n),dz=40,gamemode=!creative,gamemode=!spectator] at @s if block ~ ~ ~ minecraft:water run function buffoon:pump/in_toxic
$execute in buffoon:gas_giant unless score #state buffoon.pump matches 1..2 run particle minecraft:dust{color:[0.6,0.85,0.2],scale:1.5f} $(cx) $(cy) $(cz) 8 0.1 8 0 10 force @a
$execute in buffoon:gas_giant unless score #state buffoon.pump matches 1..2 run particle minecraft:sulfur_bubbles $(cx) $(cy) $(cz) 8 0.1 8 0 6 force @a
$execute in buffoon:gas_giant unless score #state buffoon.pump matches 1..2 run particle minecraft:campfire_cosy_smoke $(cx) $(cy) $(cz) 8 0.2 8 0.005 2 force @a
