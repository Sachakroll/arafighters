/// @description Debug

if keyboard_check_pressed(vk_f1)
{
	if room = Title
	{room_goto(Map_bus)}
	else{room_goto(Title)}
}

if keyboard_check_pressed(vk_anykey)
{show_debug_message(string(keyboard_lastkey))}