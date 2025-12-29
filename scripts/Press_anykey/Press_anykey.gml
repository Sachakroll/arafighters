function keyboard_check_anykey(player)
{
	if player = 1
	{
		if keyboard_check(global.player1_key_action1) || keyboard_check(global.player1_key_action2)
		|| keyboard_check(global.player1_key_guard)
		|| keyboard_check(global.player1_key_pause) {return true}
		else {return false}
	}
	if player = 2
	{
		if keyboard_check(global.player2_key_action1) || keyboard_check(global.player2_key_action2)
		|| keyboard_check(global.player2_key_guard)
		|| keyboard_check(global.player2_key_pause) {return true}
		else {return false}
	}
}

function keyboard_check_pressed_anykey(player)
{
	if player = 1
	{
		if keyboard_check_pressed(global.player1_key_action1) || keyboard_check_pressed(global.player1_key_action2)
		|| keyboard_check_pressed(global.player1_key_guard)
		|| keyboard_check_pressed(global.player1_key_pause) {return true}
		else {return false}
	}
	if player = 2
	{
		if keyboard_check_pressed(global.player2_key_action1) || keyboard_check_pressed(global.player2_key_action2)
		|| keyboard_check_pressed(global.player2_key_guard)
		|| keyboard_check_pressed(global.player2_key_pause) {return true}
		else {return false}
	}
}

function gamepad_check_anykey(player)
{
	if player = 1
	{
		if gamepad_button_check(global.p1_controller, global.p1_gp_action1)
		|| gamepad_button_check(global.p1_controller, global.p1_gp_action2)
		|| gamepad_button_check(global.p1_controller, global.p1_gp_guard)
		|| gamepad_button_check(global.p1_controller, global.p1_gp_pause)
		{return true}
		else {return false}
	}
	if player = 2
	{
		if gamepad_button_check(global.p2_controller, global.p2_gp_action1)
		|| gamepad_button_check(global.p2_controller, global.p2_gp_action2)
		|| gamepad_button_check(global.p2_controller, global.p2_gp_guard)
		|| gamepad_button_check(global.p2_controller, global.p2_gp_pause)
		{return true}
		else {return false}
	}
}

function gamepad_check_pressed_anykey(player)
{
	if player = 1
	{
		if gamepad_button_check_pressed(global.p1_controller, global.p1_gp_action1)
		|| gamepad_button_check_pressed(global.p1_controller, global.p1_gp_action2)
		|| gamepad_button_check_pressed(global.p1_controller, global.p1_gp_guard)
		|| gamepad_button_check_pressed(global.p1_controller, global.p1_gp_pause)
		{return true}
		else {return false}
	}
	if player = 2
	{
		if gamepad_button_check_pressed(global.p2_controller, global.p2_gp_action1)
		|| gamepad_button_check_pressed(global.p2_controller, global.p2_gp_action2)
		|| gamepad_button_check_pressed(global.p2_controller, global.p2_gp_guard)
		|| gamepad_button_check_pressed(global.p2_controller, global.p2_gp_pause)
		{return true}
		else {return false}
	}
}