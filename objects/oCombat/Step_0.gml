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

// Animations de double saut

if p1_doublejumping
{
	instance_create_layer(global.p1_inst.x, global.p1_inst.y, "Player", oDoublejump_animation,
	{hsp : global.p1_inst.hsp/2})
	p1_doublejumping = false
}
if p2_doublejumping
{
	instance_create_layer(global.p2_inst.x, global.p2_inst.y, "Player", oDoublejump_animation,
	{hsp : global.p2_inst.hsp/2})
	p2_doublejumping = false
}