$execute in $(dim) positioned $(cx) $(y) $(cz) run playsound minecraft:entity.generic.splash block @a[distance=..48] ~ ~ ~ 2 0.6
$execute in $(dim) positioned $(cx) $(y) $(cz) run playsound minecraft:block.piston.contract block @a[distance=..48] ~ ~ ~ 1.5 0.5
$execute in $(dim) positioned $(cx) $(y) $(cz) run title @a[distance=..48] actionbar [{text:"Water level ",color:"aqua"},{score:{name:"#$(id).lvl",objective:"buffoon.water"},color:"aqua"}]
