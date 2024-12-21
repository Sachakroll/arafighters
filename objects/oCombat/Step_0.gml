// Transition

if state = "fade1"
{
	fade_timer += 1
	if fade_timer = fade_time
	{
		state = "intro"
	}
}