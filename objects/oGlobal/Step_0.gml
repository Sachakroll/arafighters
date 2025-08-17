// Volume

audio_master_gain(global.volume)

// Plein écran

if keyboard_check_pressed(vk_f4) || keyboard_check_pressed(vk_f11)
{
	fullscreen = 1 - fullscreen
	window_set_fullscreen(fullscreen)
	window_set_size(1280, 720)
}