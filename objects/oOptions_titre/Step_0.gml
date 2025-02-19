// Mouvement

angle += 0.2/inverse_speed
if angle > 2*pi
{
	angle = 0
}
y = y_center + sin(angle)*etendue

draw_ypos = base_draw_ypos + 2*sin(angle)*etendue

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

if oTitleMonitor.selected_options = 0 {image_index = 0}
else {image_index = 1}