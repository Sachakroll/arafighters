// Intro

if state = "intro"
{
	intro_timer ++
	if intro_timer >= intro_duration {state = "combat"}
	if global.battle_intro_skip // Debug
	{
		state = "combat"
		global.battle_intro_skip = false
	}
}

// Fin du combat

if pre_fin && global.pause = 0 && state = "combat"
{
	pre_fin_timer ++
	if (pre_fin_timer >= pre_fin_temps_time && global.ruleset_style = "temps")
	|| (pre_fin_timer >= pre_fin_vies_time && global.ruleset_style = "vies")
	{
		state = "fin"
		fin_timer = 0
	}
}
if state = "fin"
{
	fin_timer ++
	if fin_timer = 240
	{
		fade_timer = fade_time
		state = "fade2"
	}
}

// Fondu de début

if state = "fade1"
{
	fade_timer ++
	if fade_timer = fade_time {state = "intro"}
}

// Fondu de fin

if state = "fade2"
{
	fade_timer --
	if fade_timer <= 0
	{
		global.title_enable_fade_in = true
		room_goto(Title)
	}
}

// Timer

if global.ruleset_style = "vies" && global.pause = 0 && state = "combat"
{global.battle_timer ++}
if global.ruleset_style = "temps" && global.pause = 0 && state = "combat"
{
	if global.battle_timer = 0
	{
		pre_fin = true
	}
	if global.battle_timer != 0 {global.battle_timer --}
}

// Fin du combat si un joueur meurt

if global.ruleset_style = "vies" && state = "combat"
{with oJoueur {if vies = 0 && mort {oCombat.pre_fin = true}}}

// Pause

if (keyboard_check_pressed(global.player1_key_pause) || gamepad_button_check_pressed(global.p1_controller, global.p1_gp_pause)) && global.pause != 2 && state = "combat"
{global.pause = 1-global.pause}
if (keyboard_check_pressed(global.player2_key_pause) || gamepad_button_check_pressed(global.p2_controller, global.p2_gp_pause)) && global.pause != 1 && state = "combat"
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