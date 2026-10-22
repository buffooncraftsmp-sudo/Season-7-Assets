# Prints the boss state and which pillar crystals the pack thinks are alive
tellraw @s [{text:"state=",color:"gray"},{score:{name:"#state",objective:"buffoon.boss"},color:"white"},{text:"  hp=",color:"gray"},{score:{name:"#hp",objective:"buffoon.boss"},color:"white"},{text:"  crystals=",color:"gray"},{score:{name:"#crystals",objective:"buffoon.boss"},color:"white"}]
tellraw @s [{text:"comet: alive=",color:"gray"},{score:{name:"#alive_comet",objective:"buffoon.boss"},color:"white"}]
tellraw @s [{text:"gas_giant: alive=",color:"gray"},{score:{name:"#alive_gas_giant",objective:"buffoon.boss"},color:"white"}]
tellraw @s [{text:"mars: alive=",color:"gray"},{score:{name:"#alive_mars",objective:"buffoon.boss"},color:"white"}]
tellraw @s [{text:"water_planet: alive=",color:"gray"},{score:{name:"#alive_water_planet",objective:"buffoon.boss"},color:"white"}]
execute store result score #dbg buffoon.boss if entity @e[type=end_crystal]
tellraw @s [{text:"end crystals loaded anywhere: ",color:"gray"},{score:{name:"#dbg",objective:"buffoon.boss"},color:"white"}]
