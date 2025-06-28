if init = 0
{
	// Initialisation des personnages
	
	// Joueur 1
	global.p1_inst = instance_create_layer(global.player1_spawn_x,global.player1_spawn_y,"Player",global.player1_char,
	{
		player : 1
	})
	global.p1_hitbox_inst = instance_create_layer(global.player1_spawn_x,global.player1_spawn_y,"Player",oHitbox,
	{
		owner : global.p1_inst,
		sprite_index : global.player1_hitbox_sprite
	})
	
	// Joueur 2
	global.p2_inst = instance_create_layer(global.player2_spawn_x,global.player2_spawn_y,"Player",global.player2_char,
	{
		player : 2
	})
	global.p2_hitbox_inst = instance_create_layer(global.player2_spawn_x,global.player2_spawn_y,"Player",oHitbox,
	{
		owner : global.p2_inst,
		sprite_index : global.player2_hitbox_sprite
	})
	
	// Variables données aux joueurs
	
	// Joueur 1
	global.p1_inst.adv_inst = global.p2_inst
	global.p1_inst.own_hitbox = global.p1_hitbox_inst
	global.p1_inst.adv_hitbox = global.p2_hitbox_inst
	
	// Joueur 2
	global.p2_inst.adv_inst = global.p1_inst
	global.p2_inst.own_hitbox = global.p2_hitbox_inst
	global.p2_inst.adv_hitbox = global.p1_hitbox_inst
	
	// Initialisation du nombre de pv affiché
	
	p1_displayed_pv = global.p1_inst.max_pv
	p2_displayed_pv = global.p2_inst.max_pv
	p1_old_pv = global.p1_inst.max_pv
	p2_old_pv = global.p2_inst.max_pv
}
init = 1