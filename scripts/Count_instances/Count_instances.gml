function projectile_nb_check(obj, sprite, expeditr)
{
	var count = 0
	with obj
	{
		if sprite_index = sprite && expediteur = expeditr
		{count += 1}
	}
	return count
}