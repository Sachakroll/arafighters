// Fondu de début

if state = "fade1"
{
	fade_timer += 1
	if fade_timer = fade_time {state = "intro"}
}

// Fondu de fin

if state = "fade2"
{
	fade_timer -= 1
	if fade_timer <= 0
	{
		global.title_enable_fade_in = true
		room_goto(Title)
	}
}

// Timer

if global.ruleset_style = "vies" && global.pause = 0
{global.battle_timer ++}
if global.ruleset_style = "temps" && global.pause = 0
{
	if global.battle_timer = 0 && state != "fade2"//à modifier p-ê
	{
		//à modifier
		state = "fade2"
		fade_timer = fade_time
	}
	if global.battle_timer != 0 {global.battle_timer --}
}

// Pause

if (keyboard_check_pressed(global.player1_key_pause) || gamepad_button_check_pressed(global.p1_controller, global.p1_gp_pause)) && global.pause != 2
{global.pause = 1-global.pause}
if (keyboard_check_pressed(global.player2_key_pause) || gamepad_button_check_pressed(global.p2_controller, global.p2_gp_pause)) && global.pause != 1
{global.pause = 2-global.pause}

// Quitter le combat

if global.pause != 0 && state != "fade2"
{
	var p1_want_to_quit = (gamepad_button_check(global.p1_controller, global.p1_gp_action1) && gamepad_button_check(global.p1_controller, global.p1_gp_action2) && gamepad_button_check(global.p1_controller, global.p1_gp_guard)) || (keyboard_check(global.player1_key_action1) && keyboard_check(global.player1_key_action2) && keyboard_check(global.player1_key_guard))
	var p2_want_to_quit = (gamepad_button_check(global.p2_controller, global.p2_gp_action1) && gamepad_button_check(global.p2_controller, global.p2_gp_action2) && gamepad_button_check(global.p2_controller, global.p2_gp_guard)) || (keyboard_check(global.player2_key_action1) && keyboard_check(global.player2_key_action2) && keyboard_check(global.player2_key_guard))
	if (p1_want_to_quit && global.pause = 1) || (p2_want_to_quit && global.pause = 2)
	{
		state = "fade2"
		fade_timer = fade_time
	}
}

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