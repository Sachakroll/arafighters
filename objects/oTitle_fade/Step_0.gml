if oTitleMonitor.state = "load"
{
	x = 0
	y = 0
	image_alpha = oTitleMonitor.load_timer/oTitleMonitor.load_time
}else
{image_alpha = 0}