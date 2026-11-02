function get_keys(){
	global.k_up = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
	global.k_down = keyboard_check(ord("S")) or keyboard_check(vk_down);
	global.k_left = keyboard_check(ord("A")) or keyboard_check(vk_left);
	global.k_right = keyboard_check(ord("D")) or keyboard_check(vk_right);
	if global.gamepad_main != undefined{
		global.k_up = gamepad_button_check_pressed(_gp, gp_face1);
		global.k_left = gamepad_button_check(_gp, gp_padl);
		global.k_right = gamepad_button_check(_gp, gp_padr);
	};
}

function moveh_control(_instance,_collision,id_collision){
	_instance.spd = (variable_instance_exists(_instance,"spd")) ? _instance.spd : 1;
	_instance.spdh = (variable_instance_exists(_instance,"spdh")) ? _instance.spdh : 0;
	
	var mov = global.k_right-global.k_left;
	_instance.spdh = mov*_instance.spd;
	if _collision{
		_instance.collision = id_collision;
		with _instance{
			if place_meeting(x+spdh, y, collision){
				while !place_meeting(x+sign(spdh), y, collision){
				    x += sign(spdh)
				}
				spdh = 0
			}
		};
	};
}

function movev_gravity(_instance,id_collision,_jump){
	_instance.spdv = (variable_instance_exists(_instance,"spdv")) ? _instance.spdv : 0
	_instance.grv = (variable_instance_exists(_instance,"grv")) ? _instance.grv : .5
	_instance.spdv += grv;
	if _jump{
		if global.k_up{
		    _instance.spdv = -8
		};
	};
	_instance.collision = id_collision
	with _instance{
		if place_meeting(x, y+spdv, collision){
		    while !place_meeting(x, y+sign(spdv), collision){
		        y += sign(spdv);
		    }
		    spdv = 0;
		};
	}
}

function atualize_coord(_instance){
	_instance.x += (variable_instance_exists(_instance,"spdh")) ? _instance.spdh : 0
	_instance.y += (variable_instance_exists(_instance,"spdv")) ? _instance.spdv : 0
}