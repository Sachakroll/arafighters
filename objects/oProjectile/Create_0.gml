// Initialisation

timer = 0
hsp = 0
vsp = 0
parti = false
retour = 0
retour_timer = 0
actif = true
initial_x = x
initial_y = y
has_hit_ground = false
initial_dir = sign(cos(angle))

portee_x = portee * cos(angle)
portee_y = -portee * sin(angle)
vitesse_x = vitesse * cos(angle)
vitesse_y = -vitesse * sin(angle)