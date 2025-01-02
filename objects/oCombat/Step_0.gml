// Transition

if state = "fade1"
{
	fade_timer += 1
	if fade_timer = fade_time
	{
		state = "intro"
	}
}

// Timer

if global.ruleset_style = "vies"
{global.battle_timer ++}
if global.ruleset_style = "temps"
{
	global.battle_timer --
	if global.battle_timer = 0
	{room_goto(Title)}
}