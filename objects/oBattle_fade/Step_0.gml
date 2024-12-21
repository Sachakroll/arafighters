if oCombat.state = "fade1"
{
	x = 0
	y = 0
	image_alpha = 1-oCombat.fade_timer/oCombat.fade_time
}else
{image_alpha = 0}