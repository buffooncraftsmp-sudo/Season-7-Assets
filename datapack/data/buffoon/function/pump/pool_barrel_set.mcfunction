kill @e[type=marker,tag=buffoon.pump_pool_barrel]
summon marker ~ ~ ~ {Tags:["buffoon.pump_pool_barrel"]}
forceload add ~ ~
forceload add 5100 5100
function buffoon:pump/refill_pool_barrel
tellraw @s {text:"Pool barrel set - filled with the Gas Giant stone and a pair of Sulfur Treads for every player.",color:"#D8D040"}
scoreboard players set @s buffoon.ray 100
