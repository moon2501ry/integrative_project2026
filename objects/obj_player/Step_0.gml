#region Entrada
var k_up = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
var k_down = keyboard_check(ord("S")) or keyboard_check(vk_down);
var k_left = keyboard_check(ord("A")) or keyboard_check(vk_left);
var k_right = keyboard_check(ord("D")) or keyboard_check(vk_right);
var _gp = global.gamepad_main;
if _gp != undefined{
	k_up = gamepad_button_check_pressed(_gp, gp_face1);
	k_left = gamepad_button_check(_gp, gp_padl);
	k_right = gamepad_button_check(_gp, gp_padr);
};
#endregion

#region Move
mov = k_right-k_left;
spdh = mov*spd;

if place_meeting(x+spdh, y, obj_floor){
    while !place_meeting(x+sign(spdh), y, obj_floor){
        x += sign(spdh)
    }
    spdh = 0
}
#endregion

#region Gravity
spdv += grv;

if k_up{
    spdv = -8
}

if place_meeting(x, y+spdv, obj_floor){
    while !place_meeting(x, y+sign(spdv), obj_floor){
        y += sign(spdv);
    }
    spdv = 0;
};
#endregion

#region Coordenadas
y+=spdv;
x+=spdh;
#endregion