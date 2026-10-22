scoreboard objectives add buffoon.ray dummy
scoreboard objectives add buffoon.laser dummy
scoreboard players set #20 buffoon.laser 20
scoreboard players set #60 buffoon.laser 60
scoreboard players set #480 buffoon.laser 480
execute unless score #state buffoon.laser matches 0.. run scoreboard players set #state buffoon.laser 0
execute unless score #north buffoon.laser matches 0.. run scoreboard players set #north buffoon.laser 0
execute unless score #east buffoon.laser matches 0.. run scoreboard players set #east buffoon.laser 0
execute unless score #south buffoon.laser matches 0.. run scoreboard players set #south buffoon.laser 0
execute unless score #west buffoon.laser matches 0.. run scoreboard players set #west buffoon.laser 0
scoreboard objectives add buffoon.ufo dummy
scoreboard players set #20 buffoon.ufo 20
execute unless score #core buffoon.ufo matches 0.. run scoreboard players set #core buffoon.ufo 0
execute unless score #nav buffoon.ufo matches 0.. run scoreboard players set #nav buffoon.ufo 0
execute unless score #panel buffoon.ufo matches 0.. run scoreboard players set #panel buffoon.ufo 0
execute unless score #state buffoon.ufo matches 0.. run scoreboard players set #state buffoon.ufo 0
scoreboard objectives add buffoon.pump dummy
scoreboard players set #2 buffoon.pump 2
scoreboard players set #10 buffoon.pump 10
scoreboard players set #6 buffoon.pump 6
scoreboard players set #20 buffoon.pump 20
execute unless score #motor buffoon.pump matches 0.. run scoreboard players set #motor buffoon.pump 0
execute unless score #filter buffoon.pump matches 0.. run scoreboard players set #filter buffoon.pump 0
execute unless score #valve buffoon.pump matches 0.. run scoreboard players set #valve buffoon.pump 0
execute unless score #state buffoon.pump matches 0.. run scoreboard players set #state buffoon.pump 0
scoreboard objectives add buffoon.nexus dummy
scoreboard players set #20 buffoon.nexus 20
scoreboard players set #4 buffoon.nexus 4
scoreboard players set #3 buffoon.nexus 3
scoreboard players set #8 buffoon.nexus 8
scoreboard players set #30 buffoon.nexus 30
execute unless score #state buffoon.nexus matches 0.. run scoreboard players set #state buffoon.nexus 0
scoreboard objectives add buffoon.boss dummy
execute unless score #state buffoon.boss matches 0.. run scoreboard players set #state buffoon.boss 0
execute unless score #skin buffoon.boss matches 0.. run scoreboard players set #skin buffoon.boss 1
scoreboard players set #4 buffoon.boss 4
scoreboard players set #gbn buffoon.boss 26
team add buffoon.boss
team modify buffoon.boss color light_purple
scoreboard players set #10 buffoon.boss 10
scoreboard objectives add buffoon.mid dummy
scoreboard players set #3 buffoon.boss 3
scoreboard players set #20 buffoon.boss 20
