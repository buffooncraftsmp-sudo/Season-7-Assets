execute store result score #x1 buffoon.pump run data get entity @n[type=marker,tag=buffoon.pump_c1] Pos[0]
execute store result score #x2 buffoon.pump run data get entity @n[type=marker,tag=buffoon.pump_c2] Pos[0]
scoreboard players operation #minx buffoon.pump = #x1 buffoon.pump
scoreboard players operation #minx buffoon.pump < #x2 buffoon.pump
scoreboard players operation #maxx buffoon.pump = #x1 buffoon.pump
scoreboard players operation #maxx buffoon.pump > #x2 buffoon.pump
scoreboard players operation #dx buffoon.pump = #maxx buffoon.pump
scoreboard players operation #dx buffoon.pump -= #minx buffoon.pump
scoreboard players operation #cx buffoon.pump = #minx buffoon.pump
scoreboard players operation #cx buffoon.pump += #maxx buffoon.pump
scoreboard players operation #cx buffoon.pump /= #2 buffoon.pump
scoreboard players operation #hx buffoon.pump = #dx buffoon.pump
scoreboard players operation #hx buffoon.pump /= #2 buffoon.pump
execute store result score #y1 buffoon.pump run data get entity @n[type=marker,tag=buffoon.pump_c1] Pos[1]
execute store result score #y2 buffoon.pump run data get entity @n[type=marker,tag=buffoon.pump_c2] Pos[1]
scoreboard players operation #miny buffoon.pump = #y1 buffoon.pump
scoreboard players operation #miny buffoon.pump < #y2 buffoon.pump
scoreboard players operation #maxy buffoon.pump = #y1 buffoon.pump
scoreboard players operation #maxy buffoon.pump > #y2 buffoon.pump
scoreboard players operation #dy buffoon.pump = #maxy buffoon.pump
scoreboard players operation #dy buffoon.pump -= #miny buffoon.pump
scoreboard players operation #cy buffoon.pump = #miny buffoon.pump
scoreboard players operation #cy buffoon.pump += #maxy buffoon.pump
scoreboard players operation #cy buffoon.pump /= #2 buffoon.pump
scoreboard players operation #hy buffoon.pump = #dy buffoon.pump
scoreboard players operation #hy buffoon.pump /= #2 buffoon.pump
execute store result score #z1 buffoon.pump run data get entity @n[type=marker,tag=buffoon.pump_c1] Pos[2]
execute store result score #z2 buffoon.pump run data get entity @n[type=marker,tag=buffoon.pump_c2] Pos[2]
scoreboard players operation #minz buffoon.pump = #z1 buffoon.pump
scoreboard players operation #minz buffoon.pump < #z2 buffoon.pump
scoreboard players operation #maxz buffoon.pump = #z1 buffoon.pump
scoreboard players operation #maxz buffoon.pump > #z2 buffoon.pump
scoreboard players operation #dz buffoon.pump = #maxz buffoon.pump
scoreboard players operation #dz buffoon.pump -= #minz buffoon.pump
scoreboard players operation #cz buffoon.pump = #minz buffoon.pump
scoreboard players operation #cz buffoon.pump += #maxz buffoon.pump
scoreboard players operation #cz buffoon.pump /= #2 buffoon.pump
scoreboard players operation #hz buffoon.pump = #dz buffoon.pump
scoreboard players operation #hz buffoon.pump /= #2 buffoon.pump
scoreboard players operation #wminx buffoon.pump = #minx buffoon.pump
scoreboard players remove #wminx buffoon.pump 3
scoreboard players operation #wminz buffoon.pump = #minz buffoon.pump
scoreboard players remove #wminz buffoon.pump 3
scoreboard players operation #wmaxx buffoon.pump = #maxx buffoon.pump
scoreboard players add #wmaxx buffoon.pump 3
scoreboard players operation #wmaxz buffoon.pump = #maxz buffoon.pump
scoreboard players add #wmaxz buffoon.pump 3
scoreboard players operation #wmaxy buffoon.pump = #maxy buffoon.pump
scoreboard players add #wmaxy buffoon.pump 1
scoreboard players set #vx2 buffoon.pump 5000
scoreboard players operation #vx2 buffoon.pump += #dx buffoon.pump
scoreboard players add #vx2 buffoon.pump 6
scoreboard players set #vy2 buffoon.pump 150
scoreboard players operation #vy2 buffoon.pump += #dy buffoon.pump
scoreboard players add #vy2 buffoon.pump 1
scoreboard players set #vz2 buffoon.pump 5000
scoreboard players operation #vz2 buffoon.pump += #dz buffoon.pump
scoreboard players add #vz2 buffoon.pump 6
scoreboard players operation #dyp buffoon.pump = #dy buffoon.pump
scoreboard players add #dyp buffoon.pump 1
scoreboard players operation #cy buffoon.pump = #maxy buffoon.pump
scoreboard players add #cy buffoon.pump 1
execute store result storage buffoon:pump pool.minx int 1 run scoreboard players get #minx buffoon.pump
execute store result storage buffoon:pump pool.miny int 1 run scoreboard players get #miny buffoon.pump
execute store result storage buffoon:pump pool.minz int 1 run scoreboard players get #minz buffoon.pump
execute store result storage buffoon:pump pool.maxx int 1 run scoreboard players get #maxx buffoon.pump
execute store result storage buffoon:pump pool.maxy int 1 run scoreboard players get #maxy buffoon.pump
execute store result storage buffoon:pump pool.maxz int 1 run scoreboard players get #maxz buffoon.pump
execute store result storage buffoon:pump pool.dx int 1 run scoreboard players get #dx buffoon.pump
execute store result storage buffoon:pump pool.dy int 1 run scoreboard players get #dy buffoon.pump
execute store result storage buffoon:pump pool.dz int 1 run scoreboard players get #dz buffoon.pump
execute store result storage buffoon:pump pool.cx int 1 run scoreboard players get #cx buffoon.pump
execute store result storage buffoon:pump pool.cy int 1 run scoreboard players get #cy buffoon.pump
execute store result storage buffoon:pump pool.cz int 1 run scoreboard players get #cz buffoon.pump
execute store result storage buffoon:pump pool.hx int 1 run scoreboard players get #hx buffoon.pump
execute store result storage buffoon:pump pool.hz int 1 run scoreboard players get #hz buffoon.pump
execute store result storage buffoon:pump pool.vx2 int 1 run scoreboard players get #vx2 buffoon.pump
execute store result storage buffoon:pump pool.vy2 int 1 run scoreboard players get #vy2 buffoon.pump
execute store result storage buffoon:pump pool.vz2 int 1 run scoreboard players get #vz2 buffoon.pump
execute store result storage buffoon:pump pool.dyp int 1 run scoreboard players get #dyp buffoon.pump
execute store result storage buffoon:pump pool.wminx int 1 run scoreboard players get #wminx buffoon.pump
execute store result storage buffoon:pump pool.wminz int 1 run scoreboard players get #wminz buffoon.pump
execute store result storage buffoon:pump pool.wmaxx int 1 run scoreboard players get #wmaxx buffoon.pump
execute store result storage buffoon:pump pool.wmaxz int 1 run scoreboard players get #wmaxz buffoon.pump
execute store result storage buffoon:pump pool.wmaxy int 1 run scoreboard players get #wmaxy buffoon.pump
scoreboard players operation #layer buffoon.pump = #maxy buffoon.pump
execute store result storage buffoon:pump pool.layer int 1 run scoreboard players get #layer buffoon.pump
function buffoon:pump/pool_setup with storage buffoon:pump pool
