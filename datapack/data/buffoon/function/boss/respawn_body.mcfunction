summon mannequin ~ ~ ~ {Tags:["buffoon.boss","buffoon.boss_body","buffoon.boss_ent"],hide_description:1b,NoGravity:1b,Invulnerable:1b,Silent:1b,attributes:[{id:"minecraft:scale",base:2.22}],equipment:{mainhand:{id:"minecraft:nether_star",count:1}}}
execute if score #skin buffoon.boss matches 1 run function buffoon:boss/apply_skin
execute if score #state buffoon.boss matches 2 if score #shielded buffoon.boss matches 0 run function buffoon:boss/take_hit
execute if score #state buffoon.boss matches 4 if score #shielded buffoon.boss matches 0 run function buffoon:boss/take_hit
scoreboard players set #glow buffoon.boss 0
