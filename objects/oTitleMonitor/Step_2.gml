// Easter eggs

if state = "title"
{
	// Piou
	if keyboard_check_pressed(ord("P")) {global.easteregg_state = 0.11}
	else if global.easteregg_state = 0.11
	{
		if keyboard_check_pressed(ord("I")) {global.easteregg_state = 0.12}
		if keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(ord("I")) {global.easteregg_state = 0}
	}
	else if global.easteregg_state = 0.12
	{
		if keyboard_check_pressed(ord("O")) {global.easteregg_state = 0.13}
		if keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(ord("O")) {global.easteregg_state = 0}
	}
	else if global.easteregg_state = 0.13
	{
		if keyboard_check_pressed(ord("U")) 
		{
			global.easteregg_state = 1
			easteregg_msg_timer = 0
		}
		if keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(ord("U")) {global.easteregg_state = 0}
	}
	
	// Smileman
	if keyboard_check_pressed(ord("S")) {global.easteregg_state = 0.21}
	else if global.easteregg_state = 0.21
	{
		if keyboard_check_pressed(ord("M")) {global.easteregg_state = 0.22}
		if keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(ord("M")) {global.easteregg_state = 0}
	}
	else if global.easteregg_state = 0.22
	{
		if keyboard_check_pressed(ord("I")) {global.easteregg_state = 0.23}
		if keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(ord("I")) {global.easteregg_state = 0}
	}
	else if global.easteregg_state = 0.23
	{
		if keyboard_check_pressed(ord("L")) {global.easteregg_state = 0.24}
		if keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(ord("L")) {global.easteregg_state = 0}
	}
	else if global.easteregg_state = 0.24
	{
		if keyboard_check_pressed(ord("E")) 
		{
			global.easteregg_state = 2
			easteregg_msg_timer = 0
		}
		if keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(ord("E")) {global.easteregg_state = 0}
	}
}
else if global.easteregg_state != 1 && global.easteregg_state != 2 {global.easteregg_state = 0}