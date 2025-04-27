if init = 0
{
	oConfig_enemy.x = oConfig_character.x + x_acc*sqr(time)/4 + 32
	oConfig_enemy.y = oConfig_character.y
	init = 1
}