scoreboard players set #state buffoon.pump 2
bossbar remove buffoon:pump
function buffoon:pump/sweep_all
execute at @n[type=marker,tag=buffoon.pump_center] run particle minecraft:totem_of_undying ~ ~ ~ 3 2 3 0.6 300 force @a
execute at @n[type=marker,tag=buffoon.pump_center] run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force @a
execute at @n[type=marker,tag=buffoon.pump_nozzle] run playsound minecraft:block.end_portal.spawn master @a[distance=..200] ~ ~ ~ 100 1.2
execute at @n[type=marker,tag=buffoon.pump_nozzle] run playsound minecraft:ui.toast.challenge_complete master @a[distance=..200] ~ ~ ~ 100 1
execute at @n[type=marker,tag=buffoon.pump_nozzle] run title @a[distance=..200] title {text:"Pool Drained!",color:"#D8D040",bold:true}
execute at @n[type=marker,tag=buffoon.pump_nozzle] run title @a[distance=..200] subtitle {text:"The Gas Giant's treasure lies exposed",color:"yellow"}
function buffoon:pump/on_complete
execute at @n[type=marker,tag=buffoon.pump_center] run advancement grant @a[distance=..200] until buffoon:s7/pump_drained
