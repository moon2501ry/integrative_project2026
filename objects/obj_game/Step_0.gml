with obj_npc{
	if !variable_instance_exists(other,"collision_player"){
		other.collision_player = false;
	};
	if !variable_instance_exists(other,"npc_id"){
		other.npc_id = noone;
	};
	if place_meeting(x,y,obj_player){
		other.collision_player = true;
		other.npc_type = type;
		other.dialogue = dialogue;
		if other.npc_id != id{
			other.npc_id = id;
			other.dialogue_n = 0;
		};
	};
};

if collision_player{
	dialogue_len = array_length(dialogue);
	if keyboard_check_pressed(ord("B")){
		if dialogue_n >= dialogue_len-1{
			collision_player = false;
			dialogue_n = 0;
		}else{
			dialogue_n += 1;
		};
	};
};

obj_cam.chat = collision_player;
obj_cam.chat_id = npc_id;