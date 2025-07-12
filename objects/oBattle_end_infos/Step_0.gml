if oCombat.state = "end_infos_appearing"
{
	visible = true
	image_alpha += 1/oCombat.end_appear_time
	visible = true
}
if oCombat.state = "end_infos"
{
	image_alpha = 1
}
if oCombat.state = "end_infos_disappearing"
{
	image_alpha -= 1/oCombat.end_disappear_time
}

if oCombat.state != "end_infos_appearing" && oCombat.state != "end_infos" && oCombat.state != "end_infos_disappearing"
{
	visible = false
	image_alpha = 0
}

if oCombat.winner = 1 {image_index = 0}
if oCombat.winner = 2 {image_index = 1}