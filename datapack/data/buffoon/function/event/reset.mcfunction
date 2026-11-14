# Resets every puzzle zone on one planet from its master copy. Safe to run from a hidden command block:
#   function buffoon:event/reset {planet:"mars"}
$function buffoon:event/job/start {dir:"reset",planets:["$(planet)"]}
