if oCombat.state = "intro" && !active
{
	visible = true
	image_alpha = 0
	timer = 0
	active = true
	phase = 0
	if global.battle_intro_skip // Debug
	{
		phase = 3
		timer = 180
		image_index = 3
		
		// Musique
		global.music = audio_play_sound(battle_select_music(), 100, true)
	}
}
if active && phase < 3
{
	timer++
	if timer >= 60*phase && timer < 60*phase + t1 {image_alpha += 1/t1}
	if timer >= 60*phase + t1 && timer < 60*phase + t2 {image_alpha = 1}
	if timer >= 60*phase + t2 && timer < 60*phase + t3 {image_alpha -= 1/(t3-t2)}
	if timer >= 60*phase + t3 && timer < 60*phase + 60 {image_alpha = 0}
	if timer = 60*phase + 60
	{
		phase ++
		image_index ++
		
		// Musique
		if phase = 3
		{global.music = audio_play_sound(battle_select_music(), 100, true)}
	}
}
if active && phase = 3
{
	timer++
	if timer >= 180 && timer < 180 + t4 {image_alpha += 1/t4}
	if timer >= 180 + t4 && timer < 180 + t5 {image_alpha = 1}
	if timer >= 180 + t5 && timer < 180 + t6 {image_alpha -= 1/(t6-t5)}
	if timer = 180 + t6 {phase ++}
}
if active && phase >= 4
{
	active = false
	image_alpha = 0
	visible = false
}

// Easter Egg

if global.easteregg_state = 2 && phase = 3
{sprite_index = sIntro_easter_egg}
else {sprite_index = sIntro_numbers}