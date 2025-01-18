if global.pause = 0 {

if type = "boomerang"
{
	// Rotation
	
	image_angle += rotation_sp*vitesse/expediteur.boomerang_sp
	
	// Mouvement du boomerang
	
	if retour = 0
	{
		//info : temps = pi*portee/vitesse
		hsp = vitesse*cos(timer*vitesse/portee)
		timer++
	}
	if retour = 1 
	{
		retour_timer ++
		remaining_time = temps_acc_retour - retour_timer
		if remaining_time = 0 {retour = 2}
	}
	if retour = 1
	{
		// Calcul de la position des mains du joueur
		x_targetpos = expediteur.x
		y_targetpos = expediteur.y - expediteur.hand_height
		
		// Calcul du vecteur vitesse que l'on veut atteindre
		dir_to_player = point_direction(x, y, x_targetpos, y_targetpos)
	    target_hsp = lengthdir_x(vitesse, dir_to_player) * initial_dir
	    target_vsp = lengthdir_y(vitesse, dir_to_player) * initial_dir
		
	    // Accélération nécessaire pour atteindre la vitesse cible dans le temps restant
	    hsp += (target_hsp - hsp) / remaining_time
	    vsp += (target_vsp - vsp) / remaining_time
	}
	
	// Déclenchement du retour du boomerang
	
	if x*initial_dir < initial_x*initial_dir && retour = 0 {retour = 1}
	
	// Récuperation du boomerang
	
	if instance_place(x, y, expediteur) = noone
	{
		parti = true
	}
	if instance_place(x, y, expediteur) != noone && parti
	{
		instance_destroy()
	}
	
	// Ne fait pas de dégats plusieurs fois pendant la même collision
	
	if instance_place(x, y, expediteur) = noone && instance_place(x, y, expediteur.adv_inst) = noone
	{actif = true}
	
	// Collisions avec un projectile
	
	/*var collisions = []

	with (oProjectile) {
	    if id != other.id && place_meeting(x, y, other.id) && sprite_index = sBoomerang {
	        array_push(collisions, id)
	    }
	}

	for (var i = 0; i < array_length(collisions); i++) {
	    var colliding_instance = collisions[i]
		energie += colliding_instance.energie/100
		colliding_instance.expediteur.n_projectile--
		friendly_fire = true
		instance_destroy(colliding_instance)
	}*/
}

// Disparation quand le projectile sort de l'écran

if x < -global.x_offscreen_projectile_margin || x > 640+global.x_offscreen_projectile_margin || y < -global.y_offscreen_projectile_margin || y > 360+global.y_offscreen_projectile_margin
{instance_destroy()}

// Mouvement

x += hsp
y += vsp

}