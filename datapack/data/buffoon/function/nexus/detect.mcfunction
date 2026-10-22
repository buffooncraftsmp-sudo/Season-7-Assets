execute at @n[type=marker,tag=buffoon.nexus] store success score #has_comet buffoon.nexus if entity @e[type=marker,tag=buffoon.stone_comet,tag=!buffoon.core_stone,distance=..64]
execute at @n[type=marker,tag=buffoon.nexus] store success score #has_gas_giant buffoon.nexus if entity @e[type=marker,tag=buffoon.stone_gas_giant,tag=!buffoon.core_stone,distance=..64]
execute at @n[type=marker,tag=buffoon.nexus] store success score #has_mars buffoon.nexus if entity @e[type=marker,tag=buffoon.stone_mars,tag=!buffoon.core_stone,distance=..64]
execute at @n[type=marker,tag=buffoon.nexus] store success score #has_water_planet buffoon.nexus if entity @e[type=marker,tag=buffoon.stone_water_planet,tag=!buffoon.core_stone,distance=..64]
scoreboard players operation #have buffoon.nexus = #has_comet buffoon.nexus
scoreboard players operation #have buffoon.nexus += #has_gas_giant buffoon.nexus
scoreboard players operation #have buffoon.nexus += #has_mars buffoon.nexus
scoreboard players operation #have buffoon.nexus += #has_water_planet buffoon.nexus
