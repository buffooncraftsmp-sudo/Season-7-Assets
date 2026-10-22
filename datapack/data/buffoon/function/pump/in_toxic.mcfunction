effect give @s minecraft:poison 3 3 true
effect give @s minecraft:nausea 8 1 true
effect give @s minecraft:slowness 2 2 true
damage @s 3 buffoon:toxic_water
particle minecraft:dust{color:[0.6,0.85,0.2],scale:1.5f} ~ ~1 ~ 0.4 0.6 0.4 0 20 force @a
playsound minecraft:block.fire.extinguish player @a ~ ~ ~ 1 0.6
advancement grant @s until buffoon:s7/toxic_dip
