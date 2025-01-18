player_to_follow = noone

with oPointeur_joueur
{
	if x > oMap_bus_panneau.minimum_x && y < oMap_bus_panneau.lowest_y && y > oMap_bus_panneau.highest_y
	{oMap_bus_panneau.player_to_follow = id}
	
	with oPointeur_joueur
	{
		if id != other.id && x > oMap_bus_panneau.minimum_x && y < oMap_bus_panneau.lowest_y && y > oMap_bus_panneau.highest_y && y < other.y
		{oMap_bus_panneau.player_to_follow = id}
	}
}

if player_to_follow != noone
{
	y = player_to_follow.y - lowest_y
	sp = 0
}
else
{
	if y < 0
	{
		sp += acc
		y += sp
	}
	if y >= 0
	{
		sp = 0
		y = 0
	}
}