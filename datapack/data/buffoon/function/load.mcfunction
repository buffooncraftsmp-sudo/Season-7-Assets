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
scoreboard objectives add buffoon.event dummy
scoreboard players set #busy buffoon.event 0
execute unless data storage buffoon:event zones run data modify storage buffoon:event zones set value {gas_giant:[],mars:[],the_comet:[],the_moon:[],water_planet:[]}
data modify storage buffoon:event names set value {gas_giant:"Opaline",mars:"Calderon",the_comet:"Comet Regnum",the_moon:"The Moon",water_planet:"Coralline"}
# only the event reset forceloads the master copies - clear any left behind by a crash mid-reset
execute in buffoon:gas_giant_master run forceload remove all
execute in buffoon:mars_master run forceload remove all
execute in buffoon:the_comet_master run forceload remove all
execute in buffoon:the_moon_master run forceload remove all
execute in buffoon:water_planet_master run forceload remove all
scoreboard objectives add buffoon.elder dummy
execute unless score #state buffoon.elder matches 0.. run scoreboard players set #state buffoon.elder 0
scoreboard objectives add buffoon.water dummy
scoreboard players set #2 buffoon.water 2
# ticks per layer of water - lower is faster
execute unless score #speed buffoon.water matches 1.. run scoreboard players set #speed buffoon.water 10
execute unless data storage buffoon:water ids run data modify storage buffoon:water ids set value []
scoreboard players set #active buffoon.water 1
scoreboard objectives add buffoon.twins dummy
execute unless score #west buffoon.twins matches 0.. run scoreboard players set #west buffoon.twins 0
execute unless score #east buffoon.twins matches 0.. run scoreboard players set #east buffoon.twins 0
data modify storage buffoon:twins sides set value {west:{side:"west",name:"Undertow",color:"#2FA4B5",bar:"blue",title:"The Western Tide"},east:{side:"east",name:"Riptide",color:"#4FD1A5",bar:"green",title:"The Eastern Tide"}}
