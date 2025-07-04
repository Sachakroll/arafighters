if oCombat.state = "fin" && phase = 0
{
	visible = true
	image_alpha = 0
	timer = 0
	phase = 1
	if global.ruleset_style = "temps" {sprite_index = sMot_fin}
	if global.ruleset_style = "vies" {sprite_index = sMot_ko}
	image_index = 0
}

if phase = 1
{
	if global.ruleset_style = "temps"
	{
		timer ++
		image_alpha += 1/t1
		if timer = t1
		{
			timer = 0
			image_alpha = 1
			phase = 2
		}
	}
	if global.ruleset_style = "vies"
	{
		image_alpha = 1
		image_index ++
		if image_index = img_number - 1
		{phase = 2}
	}	
}

if phase = 2
{
	timer ++
	if timer = t2
	{
		phase = 3
		timer = 0
	}
}

if phase = 3
{
	timer ++
	image_alpha -= 1/t3
	if timer = t3
	{
		phase = 4
		image_alpha = 0
		visible = false
	}
}

if phase = 4 && oCombat.state != "fin" {phase = 0}