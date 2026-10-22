scoreboard players remove #cd buffoon.boss 1
execute if score #cd buffoon.boss matches 30 if score #state buffoon.boss matches 2 store result score #spell buffoon.boss run random value 1..4
execute if score #cd buffoon.boss matches 30 if score #state buffoon.boss matches 4 store result score #spell buffoon.boss run random value 1..5
execute if score #cd buffoon.boss matches 30 if score #spell buffoon.boss = #last buffoon.boss if score #state buffoon.boss matches 2 store result score #spell buffoon.boss run random value 1..4
execute if score #cd buffoon.boss matches 30 if score #spell buffoon.boss = #last buffoon.boss if score #state buffoon.boss matches 4 store result score #spell buffoon.boss run random value 1..5
execute if score #cd buffoon.boss matches 30 if score #spell buffoon.boss = #last buffoon.boss run scoreboard players add #spell buffoon.boss 1
execute if score #cd buffoon.boss matches 30 if score #state buffoon.boss matches 2 if score #spell buffoon.boss matches 5.. run scoreboard players set #spell buffoon.boss 1
execute if score #cd buffoon.boss matches 30 if score #spell buffoon.boss matches 6.. run scoreboard players set #spell buffoon.boss 1
execute if score #cd buffoon.boss matches 30 store result score #mroll buffoon.boss run random value 1..100
execute if score #cd buffoon.boss matches 30 if score #mroll buffoon.boss matches ..50 unless score #last buffoon.boss matches 1 run scoreboard players set #spell buffoon.boss 1
execute if score #cd buffoon.boss matches 30 run scoreboard players operation #last buffoon.boss = #spell buffoon.boss
execute if score #cd buffoon.boss matches 30 if score #spell buffoon.boss matches 1 run title @a[distance=..150] actionbar [{text:"✦ The Astronomer casts ",color:"gray"},{text:"Meteor Shower",color:"#FFB627",bold:true},{text:"! ✦",color:"gray"}]
execute if score #cd buffoon.boss matches 1..30 if score #spell buffoon.boss matches 1 at @n[type=item_display,tag=buffoon.boss_star] run particle minecraft:dust{color:[1.0,0.75,0.2],scale:2.0f} ~ ~ ~ 0.5 0.5 0.5 0 10 force @a
execute if score #cd buffoon.boss matches ..0 if score #spell buffoon.boss matches 1 run function buffoon:boss/spell_comet
execute if score #cd buffoon.boss matches 30 if score #spell buffoon.boss matches 2 run title @a[distance=..150] actionbar [{text:"✦ The Astronomer casts ",color:"gray"},{text:"Choking Nebula",color:"#D8D040",bold:true},{text:"! ✦",color:"gray"}]
execute if score #cd buffoon.boss matches 1..30 if score #spell buffoon.boss matches 2 at @n[type=item_display,tag=buffoon.boss_star] run particle minecraft:dust{color:[0.85,0.85,0.3],scale:2.0f} ~ ~ ~ 0.5 0.5 0.5 0 10 force @a
execute if score #cd buffoon.boss matches ..0 if score #spell buffoon.boss matches 2 run function buffoon:boss/spell_gas
execute if score #cd buffoon.boss matches 30 if score #spell buffoon.boss matches 3 run title @a[distance=..150] actionbar [{text:"✦ The Astronomer casts ",color:"gray"},{text:"Sweeping Laser",color:"#E0452B",bold:true},{text:"! ✦",color:"gray"}]
execute if score #cd buffoon.boss matches 1..30 if score #spell buffoon.boss matches 3 at @n[type=item_display,tag=buffoon.boss_star] run particle minecraft:dust{color:[0.95,0.3,0.15],scale:2.0f} ~ ~ ~ 0.5 0.5 0.5 0 10 force @a
execute if score #cd buffoon.boss matches ..0 if score #spell buffoon.boss matches 3 run function buffoon:boss/spell_mars
execute if score #cd buffoon.boss matches 30 if score #spell buffoon.boss matches 4 run title @a[distance=..150] actionbar [{text:"✦ The Astronomer casts ",color:"gray"},{text:"Tidal Gaze",color:"#3FD8E0",bold:true},{text:"! ✦",color:"gray"}]
execute if score #cd buffoon.boss matches 1..30 if score #spell buffoon.boss matches 4 at @n[type=item_display,tag=buffoon.boss_star] run particle minecraft:dust{color:[0.3,0.85,1.0],scale:2.0f} ~ ~ ~ 0.5 0.5 0.5 0 10 force @a
execute if score #cd buffoon.boss matches ..0 if score #spell buffoon.boss matches 4 run function buffoon:boss/spell_water
execute if score #cd buffoon.boss matches 30 if score #spell buffoon.boss matches 5 run title @a[distance=..150] actionbar [{text:"✦ The Astronomer casts ",color:"gray"},{text:"Star Wisps",color:"#B48CFF",bold:true},{text:"! ✦",color:"gray"}]
execute if score #cd buffoon.boss matches 1..30 if score #spell buffoon.boss matches 5 at @n[type=item_display,tag=buffoon.boss_star] run particle minecraft:dust{color:[0.7,0.5,1.0],scale:2.0f} ~ ~ ~ 0.5 0.5 0.5 0 10 force @a
execute if score #cd buffoon.boss matches ..0 if score #spell buffoon.boss matches 5 run function buffoon:boss/spell_wisps
execute if score #cd buffoon.boss matches 30 at @n[type=item_display,tag=buffoon.boss_star] run playsound minecraft:entity.evoker.prepare_attack hostile @a[distance=..120] ~ ~ ~ 4 0.6
execute if score #cd buffoon.boss matches 1..30 at @n[type=item_display,tag=buffoon.boss_star] run particle minecraft:end_rod ~ ~ ~ 0.2 0.2 0.2 0.15 4 force @a
execute if score #cd buffoon.boss matches ..0 at @n[type=item_display,tag=buffoon.boss_star] run playsound minecraft:entity.illusioner.cast_spell hostile @a[distance=..120] ~ ~ ~ 4 0.7
execute if score #cd buffoon.boss matches ..0 if score #state buffoon.boss matches 2 store result score #cd buffoon.boss run random value 100..190
execute if score #cd buffoon.boss matches ..0 if score #state buffoon.boss matches 4 store result score #cd buffoon.boss run random value 60..120
