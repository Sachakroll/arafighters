// Mouvement

if oTitleMonitor.char_cadres_do_move
{
	angle += 0.2/inverse_speed
	if angle > 2*pi
	{
		angle = 0
	}
	y = y_center + sin(angle)*etendue
}

// Apparition et disparition

if oTitleMonitor.state = "choice to char" || oTitleMonitor.state = "rules to char"
{
	image_alpha += 1/oTitleMonitor.anim1_dur
}
if oTitleMonitor.state = "char to choice" || oTitleMonitor.state = "char to rules"
{
	image_alpha -= 1/oTitleMonitor.anim1_dur
}
if oTitleMonitor.state = "char"
{
	image_alpha = 1
}
if oTitleMonitor.state = "title" || oTitleMonitor.state = "choice" || oTitleMonitor.state = "rules"
{
	image_alpha = 0
}