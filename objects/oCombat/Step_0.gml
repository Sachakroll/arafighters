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

if global.ruleset_style = "vies" && global.pause = 0
{global.battle_timer ++}
if global.ruleset_style = "temps" && global.pause = 0
{
	global.battle_timer --
	if global.battle_timer = 0
	{room_goto(Title)}
}

// Pause

if keyboard_check_pressed(global.player1_key_pause) && global.pause != 2
{global.pause = 1-global.pause}
if keyboard_check_pressed(global.player2_key_pause) && global.pause != 1
{global.pause = 2-global.pause}
