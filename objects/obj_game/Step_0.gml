with obj_enemy{
	if !variable_instance_exists(other,"collision_player"){
		other.collision_player = false;
	};
	if place_meeting(x,y,obj_player){
		other.collision_player = true;
	};
};
obj_cam.chat = collision_player;