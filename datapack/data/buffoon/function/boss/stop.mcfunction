function buffoon:boss/cleanup
stopsound @a record minecraft:music.dragon
tellraw @s {text:"Boss fight stopped and cleared. Pillars stay - /function buffoon:boss/start rebuilds everything.",color:"#B48CFF"}
