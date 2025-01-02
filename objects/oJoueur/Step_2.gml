  ////@description Animations

image_speed = 1
var sprite = s_prefix

if sneak = true
{
	if dir = -1
	{
		if hsp = 0 {sprite += "sneak_g"}
		      else {sprite += "sneak_r_g"}
	}
	if dir = 1
	{
		if hsp = 0 {sprite += "sneak_d"}
		      else {sprite += "sneak_r_d"}
	}
	if dir = 0     {sprite += "sneak_still"}
}
if sneak = false
{
	if dir = -1
	{
		if hsp = 0 {sprite += "m_g"}
		      else {sprite += "m_r_g"}
	}
	if dir = 1
	{
		if hsp = 0 {sprite += "m_d"}
		      else {sprite += "m_r_d"}
	}
	if dir = 0     {sprite += "m_still"}
}

sprite_index = asset_get_index(sprite)