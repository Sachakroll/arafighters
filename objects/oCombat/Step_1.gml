if init = 0
{
	global.p1_inst = instance_create_layer(global.player1_spawn_x,global.player1_spawn_y,"Player",global.player1_char,
	{
		player : 1,
		dir : 0
	})
	
	global.p2_inst = instance_create_layer(global.player2_spawn_x,global.player2_spawn_y,"Player",global.player2_char,
	{
		player : 2,
		dir : 0
	})
	
	global.p1_inst.adv_inst = global.p2_inst
	global.p2_inst.adv_inst = global.p1_inst
}
init = 1