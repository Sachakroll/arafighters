function collision(x, y, obj)
{
	return place_meeting(x, y, obj)
}
function inst_collision(x, y, obj)
{
	return instance_place(x, y, obj)
}

if owner.player = 1 {sprite_index = global.player1_hitbox_sprite}
if owner.player = 2 {sprite_index = global.player2_hitbox_sprite}