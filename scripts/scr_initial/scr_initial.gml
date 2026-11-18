gamepads = [];
gamepad_main = undefined;

#region Rooms

rooms = {
	"room_menu": {"index":0,"type":"menu"},
	"room_test": {"index":1,"type":"game"},
	"room_base": {"index":2,"type":"dev"}
}
/* Sem funcionar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
global.transition = [false,false];

function room_trans(_room){
	other.sprite_index = (other.sprite_index != spr_transition) ? spr_transition : other.sprite_index;
	global.transition[0] = true;
	if global.transition[1]{
		other.sprite_set_speed(spr_transition,-sprite_get_speed(spr_transition),-1);
		global.transition = [false,false];
		room_goto(_room);
	}
}
function room_ftrans(){
	global.transition[1] = true;
}
*/
#endregion