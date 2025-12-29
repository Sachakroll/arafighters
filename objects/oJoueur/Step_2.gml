///@description Animations

if global.pause != 0 {image_speed = 0}
else{
	image_speed = 1
	if hsp != 0 {image_speed = abs(hsp)/max_walksp}
}

var sprite = s_prefix

// Choix du sprite

if sneak {sprite += "_sneak"}
else {sprite += "_m"}

if hsp != 0 {sprite += "_r"}
if dir = -1 {sprite += "_g"}
if dir = 1  {sprite += "_d"}

// Application du sprite

sprite_index = asset_get_index(sprite)