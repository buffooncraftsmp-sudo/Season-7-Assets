bossbar set buffoon:pump players @a[distance=..200]
scoreboard players operation #s buffoon.pump = #su buffoon.pump
scoreboard players operation #s buffoon.pump /= #20 buffoon.pump
scoreboard players operation #m2 buffoon.pump = #su buffoon.pump
scoreboard players operation #m2 buffoon.pump %= #20 buffoon.pump
execute if score #m2 buffoon.pump matches 0 run title @a[distance=..200] actionbar [{text:"Pump starting up: ",color:"#D8D040"},{score:{name:"#s",objective:"buffoon.pump"},color:"white"},{text:"s until draining",color:"white"}]
execute if score #su buffoon.pump matches 1201.. if score #m2 buffoon.pump matches 0 run playsound minecraft:block.iron_door.close master @a[distance=..200] ~ ~ ~ 4 0.5
execute if score #su buffoon.pump matches 1201.. if score #m2 buffoon.pump matches 10 run playsound minecraft:block.piston.extend master @a[distance=..200] ~ ~ ~ 4 0.5
execute if score #su buffoon.pump matches 1201.. run particle minecraft:large_smoke ~ ~0.8 ~ 0.2 0.3 0.2 0.02 3 force @a
execute if score #su buffoon.pump matches 601..1200 run playsound minecraft:block.grindstone.use master @a[distance=..200] ~ ~ ~ 4 0.5
execute if score #su buffoon.pump matches 601..1200 run playsound minecraft:block.piston.contract master @a[distance=..200] ~ ~ ~ 3 0.6
execute if score #su buffoon.pump matches 601..1200 if score #m2 buffoon.pump matches 0 run playsound minecraft:block.copper_bulb.turn_on master @a[distance=..200] ~ ~ ~ 3 0.7
execute if score #su buffoon.pump matches 601..1200 if score #m2 buffoon.pump matches 0 run playsound minecraft:block.beacon.ambient master @a[distance=..200] ~ ~ ~ 4 0.6
execute if score #su buffoon.pump matches 601..1200 run particle minecraft:smoke ~ ~0.8 ~ 0.2 0.3 0.2 0.02 6 force @a
execute if score #su buffoon.pump matches 201..600 run playsound minecraft:block.beacon.ambient master @a[distance=..200] ~ ~ ~ 5 1.0
execute if score #su buffoon.pump matches ..200 run playsound minecraft:block.beacon.ambient master @a[distance=..200] ~ ~ ~ 6 1.5
execute if score #su buffoon.pump matches ..600 run playsound minecraft:block.piston.extend master @a[distance=..200] ~ ~ ~ 4 0.9
execute if score #su buffoon.pump matches ..600 run playsound minecraft:block.bubble_column.upwards_inside master @a[distance=..200] ~ ~ ~ 4 0.7
execute if score #su buffoon.pump matches ..600 run playsound minecraft:block.conduit.ambient master @a[distance=..200] ~ ~ ~ 4 0.8
execute if score #su buffoon.pump matches ..600 run particle minecraft:splash ~ ~0.8 ~ 0.2 0.4 0.2 0 10 force @a
execute if score #su buffoon.pump matches ..600 run particle minecraft:cloud ~ ~1 ~ 0.2 0.3 0.2 0.03 3 force @a
execute if score #su buffoon.pump matches ..200 if score #m2 buffoon.pump matches 0 run playsound minecraft:block.note_block.pling master @a[distance=..200] ~ ~ ~ 100 1.8
execute if score #su buffoon.pump matches 600 run title @a[distance=..200] title {text:"30 seconds!",color:"#D8D040",bold:true}
execute if score #su buffoon.pump matches 200 run title @a[distance=..200] title {text:"10 seconds!",color:"red",bold:true}
