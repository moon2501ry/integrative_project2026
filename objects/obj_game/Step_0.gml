get_keys();
if !in_combat{
	atualize_coord(obj_player);
}

// Mudar essa bosta antes de entregar o projeto
with obj_npc{
	if !variable_instance_exists(other,"inchat"){
		other.inchat = false;
	};
	if !variable_instance_exists(other,"npc_id"){
		other.npc_id = noone;
	};
	if place_meeting(x,y,obj_player){
		other.inchat = true;
		other.npc_type = type;
		other.dialogue = dialogue;
		if other.npc_id != id{
			other.npc_id = id;
			other.dialogue_n = 0;
		};
	};
};

if !inchat and !in_combat{
	cam_trackmove(obj_cam,obj_player);
}else if !in_combat{
	cam_chatmove(obj_cam,obj_player,npc_id,.25);		
};

if inchat{
	dialogue_len = array_length(dialogue);
	if keyboard_check_pressed(ord("B")){
		if dialogue_n >= dialogue_len-1{
			inchat = false;
			dialogue_n = 0;
			combat_init();
		}else{
			dialogue_n += 1;
		};
	};
};