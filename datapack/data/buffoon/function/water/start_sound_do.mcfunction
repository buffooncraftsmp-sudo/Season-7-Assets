$execute if data storage buffoon:water snd{dir:"rise"} in $(dim) positioned $(cx) $(y) $(cz) run playsound minecraft:item.bucket.empty block @a[distance=..48] ~ ~ ~ 3 0.5
$execute if data storage buffoon:water snd{dir:"rise"} in $(dim) positioned $(cx) $(y) $(cz) run playsound minecraft:block.bubble_column.upwards_inside block @a[distance=..48] ~ ~ ~ 3 0.7
$execute if data storage buffoon:water snd{dir:"fall"} in $(dim) positioned $(cx) $(y) $(cz) run playsound minecraft:item.bucket.fill block @a[distance=..48] ~ ~ ~ 3 0.5
$execute if data storage buffoon:water snd{dir:"fall"} in $(dim) positioned $(cx) $(y) $(cz) run playsound minecraft:block.bubble_column.whirlpool_inside block @a[distance=..48] ~ ~ ~ 3 0.7
$execute in $(dim) positioned $(cx) $(y) $(cz) run playsound minecraft:block.piston.extend block @a[distance=..48] ~ ~ ~ 1.5 0.5
