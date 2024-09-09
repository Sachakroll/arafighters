//Initialisation des joueurs

player1_char = oGabriel
player2_char = oGabriel

player1_inst = instance_create_layer(197,349,"Player",player1_char,
{
	player : 1,
	dir : 0
})

player1_inst = instance_create_layer(360,349,"Player",player2_char,
{
	player : 2,
	dir : 0
})

global.player1_key_left = vk_left
global.player1_key_right = vk_right
global.player1_key_jump = vk_up
global.player1_key_sneak = vk_down

global.player2_key_left = ord("Q")
global.player2_key_right = ord("D")
global.player2_key_jump = ord("Z")
global.player2_key_sneak = ord("S")
