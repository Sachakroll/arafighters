if room = Config
{
	if oConfig.state = "fade1"
	{
		x = 0
		y = 0
		image_alpha = 1-oConfig.fade_timer/oConfig.fade_time
	}
	if oConfig.state = "fade2"
	{
		x = 0
		y = 0
		image_alpha = 1-oConfig.fade_timer/oConfig.fade_time
	}
	if oConfig.state != "fade1" && oConfig.state != "fade2" {image_alpha = 0}
}
else
{
	if oCombat.state = "fade1" || oCombat.state = "fade2"
	{
		x = 0
		y = 0
		image_alpha = 1-oCombat.fade_timer/oCombat.fade_time
	}else
	{image_alpha = 0}
}
