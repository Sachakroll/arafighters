if oTitleMonitor.state = "load"
{
	x = 0
	y = 0
	image_alpha = oTitleMonitor.load_timer/oTitleMonitor.load_time
}
if oTitleMonitor.fade_timer_while_reentering_title != 0
{
	x = 0
	y = 0
	image_alpha = oTitleMonitor.fade_timer_while_reentering_title/oTitleMonitor.fade_time_while_reentering_title
}

if oTitleMonitor.state != "load" && oTitleMonitor.fade_timer_while_reentering_title = 0 {image_alpha = 0}