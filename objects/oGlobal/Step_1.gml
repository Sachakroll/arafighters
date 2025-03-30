/// @description Manettes

var player = 1

for (var i = 0; i < gamepad_get_device_count(); i++)
{
	if gamepad_is_connected(i)
	{
		if global.p1_controller = -1 && global.p2_controller != i
		{global.p1_controller = i}
		else if global.p2_controller = -1 && global.p1_controller != i
		{global.p2_controller = i}
	}
	else
	{
		if global.p1_controller = i {global.p1_controller = -1}
		if global.p2_controller = i {global.p2_controller = -1}
	}
}

//show_debug_message("1 : "+string(global.p1_controller))
//show_debug_message("2 : "+string(global.p2_controller))