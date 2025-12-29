/// @description Manettes

var player = 1

for (var i = 0; i < gamepad_get_device_count(); i++)
{
	if gamepad_is_connected(i)
	{
		if global.p1_controller = -1 && global.p2_controller != i
		{
			global.p1_controller = i
			if file_exists(string(gamepad_get_description(global.p1_controller))+".txt")
			{
				var _file = file_text_open_read(string(gamepad_get_description(global.p1_controller))+".txt")
				var _json = file_text_read_string(_file)
				var _struct = json_parse(_json)
				file_text_close(_file)
				global.p1_gp_y_axis = _struct._y_axis
				global.p1_gp_invert_y_axis = _struct._invert_y_axis
				global.p1_gp_x_axis = _struct._x_axis
				global.p1_gp_jump = _struct._jump
				global.p1_gp_action1 = _struct._act1
				global.p1_gp_action2 = _struct._act2
				global.p1_gp_guard = _struct._guard
				global.p1_gp_pause = _struct._pause
			}
		}
		else if global.p2_controller = -1 && global.p1_controller != i
		{
			global.p2_controller = i
			if file_exists(string(gamepad_get_description(global.p2_controller))+".txt")
			{
				var _file = file_text_open_read(string(gamepad_get_description(global.p2_controller))+".txt")
				var _json = file_text_read_string(_file)
				var _struct = json_parse(_json)
				file_text_close(_file)
				global.p2_gp_y_axis = _struct._y_axis
				global.p2_gp_invert_y_axis = _struct._invert_y_axis
				global.p2_gp_x_axis = _struct._x_axis
				global.p2_gp_jump = _struct._jump
				global.p2_gp_action1 = _struct._act1
				global.p2_gp_action2 = _struct._act2
				global.p2_gp_guard = _struct._guard
				global.p2_gp_pause = _struct._pause
			}
		}
	}
	else
	{
		if global.p1_controller = i {global.p1_controller = -1}
		if global.p2_controller = i {global.p2_controller = -1}
	}
}

//show_debug_message("1 : "+string(global.p1_controller))
//show_debug_message("2 : "+string(global.p2_controller))