// Mouvement

angle += 0.2/inverse_speed
if angle > 2*pi
{
	angle = 0
}
y = y_center + sin(angle)*etendue

draw_ypos_0 = base_draw_ypos_0 + 2*sin(angle)*etendue
draw_ypos_1 = base_draw_ypos_1 + 2*sin(angle)*etendue
draw_ypos_2 = base_draw_ypos_2 + 2*sin(angle)*etendue
draw_ypos_3 = base_draw_ypos_3 + 2*sin(angle)*etendue

// Apparition et disparition

if oTitleMonitor.state = "choice to options"
{
	image_alpha += 1/oTitleMonitor.anim1_dur
}
if oTitleMonitor.state = "options to choice"
{
	image_alpha -= 1/oTitleMonitor.anim1_dur
}
if oTitleMonitor.state = "options"
{
	image_alpha = 1
}
if oTitleMonitor.state = "choice"
{
	image_alpha = 0
}

if global.p2_controller = -1 {image_index = 0}
else
{
	if oTitleMonitor.selected_options = 1.2
	{image_index = oTitleMonitor.selected_controls + 2}
	else {image_index = 1}
}