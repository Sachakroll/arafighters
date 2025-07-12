function cadre_x(char_number)
{
	var cadres_ecart = 108
	if char_number <= oTitleMonitor.half_char_number {var place_on_row = char_number}
	else {var place_on_row = char_number - oTitleMonitor.half_char_number}
	var pos = place_on_row - (oTitleMonitor.half_char_number+1)/2
	var _x = pos * cadres_ecart + 320
	return _x
}
function cadre_y(char_number)
{
	if char_number <= oTitleMonitor.half_char_number {var _y = 40}
	else {var _y = 128}
	return _y
}