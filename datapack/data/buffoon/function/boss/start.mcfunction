# Teleports every non-spectator player to the Moon and starts the fight
function buffoon:boss/cleanup
execute in buffoon:the_moon run forceload add -48 -48 48 48
execute in buffoon:the_moon run spreadplayers 0 50 2 6 under 140 false @a[gamemode=!spectator]
effect give @a[gamemode=!spectator] minecraft:resistance 8 4 true
effect give @a[gamemode=!spectator] minecraft:slow_falling 8 0 true
scoreboard players set #state buffoon.boss 1
scoreboard players set #bt buffoon.boss 0
schedule function buffoon:boss/build 40t
