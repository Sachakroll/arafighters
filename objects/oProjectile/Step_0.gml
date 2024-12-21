// Mouvement

x += energie/masse

if x < 0 || x > 640
{
	expediteur.n_projectile--
	instance_destroy()
}

// Collisions avec un projectile

var collisions = [];

with (oProjectile) {
    if (id != other.id && place_meeting(x, y, other.id)) {
        array_push(collisions, id);
    }
}

for (var i = 0; i < array_length(collisions); i++) {
    var colliding_instance = collisions[i];
	energie += colliding_instance.energie
	masse += colliding_instance.masse
	image_xscale = power(masse, 1/3)
	image_yscale = power(masse, 1/3)
	vitesse = energie/masse
	if colliding_instance.masse > masse
	{
		x = colliding_instance.x
		y = colliding_instance.y
	}
	colliding_instance.expediteur.n_projectile--
	instance_destroy(colliding_instance)
}