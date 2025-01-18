///@description Animations

if global.pause = 0 {image_speed = 1}
else {image_speed = 0}

var sprite = s_prefix

// Choix du sprite

if sneak {sprite += "_sneak"}
else {sprite += "_m"}

if still = true {sprite += "_still"}
else
{
	if hsp != 0 {sprite += "_r"}
	if dir = -1 {sprite += "_g"}
	if dir = 1  {sprite += "_d"}
}

// Application du sprite

sprite_index = asset_get_index(sprite)