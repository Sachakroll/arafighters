if global.pause = 0
{
	if image_alpha - appear_sp > 0 {image_alpha -= appear_sp}
	else {image_alpha = 0}
	timer = 0
}
else
{
	timer += appear_sp
	image_alpha = (-cos(timer)+1)/2
}
