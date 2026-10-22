scoreboard players set #nray buffoon.nexus 0
$execute positioned ~ ~0.6 ~ facing entity @n[type=marker,tag=buffoon.nexus] feet run function buffoon:nexus/beam_step {c:"$(c)",s:"$(s)",p1:"$(p1)",p2:"$(p2)"}
