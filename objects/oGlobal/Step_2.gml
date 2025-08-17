/// @description Debug

if keyboard_check_pressed(vk_f1)
{
	if room = Title
	{
		room_goto(global.map)
		global.battle_intro_skip = true
		audio_stop_sound(global.music)
	}
	else
	{
		room_goto(Title)
		audio_stop_sound(global.music)
	}
}

//if keyboard_check_pressed(vk_anykey)
//{show_debug_message(string(keyboard_lastkey))}