kill @e[type=marker,tag=buffoon.boss_sweep]
tag @a remove buffoon.swept
execute at @n[type=marker,tag=buffoon.boss_center] run summon marker ~ ~0.35 ~ {Tags:["buffoon.boss_sweep","buffoon.boss_ent"]}
execute at @n[type=marker,tag=buffoon.boss_center] run playsound minecraft:entity.guardian.attack hostile @a[distance=..120] ~ ~ ~ 4 0.6
tellraw @a[distance=..150] {text:"A laser sweeps the ground - JUMP!",color:"red",bold:true}
