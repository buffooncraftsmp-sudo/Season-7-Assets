# After a planet's zones are copied: run its puzzle reset hooks (scores, NPC tags) and announce it
$execute if data storage buffoon:event tmp{op:"reset"} run function #buffoon:event/reset/$(p)
$execute if data storage buffoon:event tmp{op:"reset"} run tellraw @a [{text:"✦ ",color:"#B48CFF"},{storage:"buffoon:event",nbt:"names.$(p)",color:"#B48CFF"},{text:" has been reset.",color:"#B48CFF"}]
$execute if data storage buffoon:event tmp{op:"save"} run tellraw @a[gamemode=creative] [{text:"Saved ",color:"#B48CFF"},{storage:"buffoon:event",nbt:"names.$(p)",color:"#B48CFF"},{text:" puzzles to its master copy.",color:"#B48CFF"}]
