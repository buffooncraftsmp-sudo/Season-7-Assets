scoreboard players set #state buffoon.ufo 3
execute at @n[type=marker,tag=buffoon.ufo_target] run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force @a
execute at @n[type=marker,tag=buffoon.ufo_target] run particle minecraft:totem_of_undying ~ ~1 ~ 1.5 1.5 1.5 0.6 300 force @a
execute at @n[type=marker,tag=buffoon.ufo_target] run particle minecraft:crimson_spore ~ ~1 ~ 2 2 2 0 200 force @a
execute as @n[type=marker,tag=buffoon.ufo_target] at @s run function buffoon:ufo/build_plinth
execute at @n[type=marker,tag=buffoon.ufo_target] run playsound minecraft:entity.generic.explode master @a[distance=..250] ~ ~ ~ 8 0.6
execute at @n[type=marker,tag=buffoon.ufo_target] run playsound minecraft:ui.toast.challenge_complete master @a[distance=..250] ~ ~ ~ 100 1
execute at @n[type=marker,tag=buffoon.ufo_target] run title @a[distance=..250] title {text:"Stone Revealed!",color:"#E0452B",bold:true}
execute at @n[type=marker,tag=buffoon.ufo_target] run title @a[distance=..250] subtitle {text:"The aliens have uncovered the Astronomer's Stone of Mars",color:"gold"}
function buffoon:ufo/on_complete
execute at @n[type=marker,tag=buffoon.ufo_target] run advancement grant @a[distance=..250] until buffoon:s7/ufo_fixed
