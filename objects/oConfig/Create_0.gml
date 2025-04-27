init = 0

state = "fade1"
fade_time = 60
fade_timer = 0
written_text = "Sautez avec le joystick !"

text_alpha = 0
text_default_x = 320*2
text_y = 20*2
letter_xsize = 18

y_axis = 0
invert_y_axis = 0
jump_button = 0
x_axis = 0
action1_button = 0
action2_button = 0
guard_button = 0
grab_button = 0
pause_button = 0

timer = 0
time = 60

hsp = 0
vsp = 0
jump_force = 8
g_acc = 2*jump_force/time
x_acc = 0.1

if global.config_player = 1 {gamepad = global.p1_controller}
if global.config_player = 2 {gamepad = global.p2_controller}