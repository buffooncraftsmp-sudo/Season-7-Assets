$data modify storage buffoon:event tmp.z.src set value "buffoon:$(planet)_master"
$data modify storage buffoon:event tmp.z.dst set value "buffoon:$(planet)"
function buffoon:event/op/copy
