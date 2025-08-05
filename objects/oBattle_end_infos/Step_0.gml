if oCombat.state = "end_infos_appearing"
{
	visible = true
	image_alpha += 1/oCombat.end_appear_time
	visible = true
}
if oCombat.state = "end_infos"
{
	image_alpha = 1
	
	var p1_ratio = global.p2_dmg_taken/(global.p1_dmg_taken+global.p2_dmg_taken)
	var p1_score = round(20*p1_ratio)
	if p1_score = 10 && oCombat.winner = 2 {p1_score = 9}
	show_debug_message("p1 "+string(p1_score))
	
	var p2_ratio = global.p1_dmg_taken/(global.p1_dmg_taken+global.p2_dmg_taken)
	var p2_score = round(20*p2_ratio)
	if p2_score = 10 && oCombat.winner = 1 {p2_score = 9}
	show_debug_message("p2 "+string(p2_score))
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