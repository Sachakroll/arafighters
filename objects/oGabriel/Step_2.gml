  ////@description Animations


image_speed = 1

if sneak = true
{
	if dir = -1
	{
		if hsp = 0 {sprite_index = sGabriel_sneak_g}
		      else {sprite_index = sGabriel_sneak_r_g}
	}
	if dir = 1
	{
		if hsp = 0 {sprite_index = sGabriel_sneak_d}
		      else {sprite_index = sGabriel_sneak_r_d}
	}
	if dir = 0     {sprite_index = sGabriel_sneak_still}
}
if sneak = false
{
	if dir = -1
	{
		if hsp = 0 {sprite_index = sGabriel_m_g}
		      else {sprite_index = sGabriel_m_r_g}
	}
	if dir = 1
	{
		if hsp = 0 {sprite_index = sGabriel_m_d}
		      else {sprite_index = sGabriel_m_r_d}
	}
	if dir = 0     {sprite_index = sGabriel_m_still}
}
