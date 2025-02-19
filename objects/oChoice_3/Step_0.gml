angle += 0.2/inverse_speed
if angle > 2*pi
{
	angle = 0
}
y = y_center + sin(angle)*etendue

if oTitleMonitor.selected_choice = 3
{
	image_index = 1
}else
{
	image_index = 0
}

if oTitleMonitor.state = "title to choice" || oTitleMonitor.state = "char to choice" || oTitleMonitor.state = "options to choice"
{
	image_alpha += 1/oTitleMonitor.anim1_dur
}
if oTitleMonitor.state = "choice to title" || oTitleMonitor.state = "choice to char" || oTitleMonitor.state = "choice to options"
{
	image_alpha -= 1/oTitleMonitor.anim1_dur
}
if oTitleMonitor.state = "choice"
{
	image_alpha = 1
}