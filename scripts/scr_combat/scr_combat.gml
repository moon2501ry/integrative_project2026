function combat_init(){
	other.in_combat = true;
	cam_setcoord(obj_cam,0,0,false,noone,noone);
	var instance = instance_create_layer(0,0,"Battle",obj_battle);
}

function combat_draw(){
	draw_text(0,0,"Em Combate");
	draw_sprite(spr_card,3,(camera_get_view_width(view_camera[0])/6)*2,224)
	draw_sprite(spr_card,3,(camera_get_view_width(view_camera[0])/6)*3,224)
	draw_sprite(spr_card,3,(camera_get_view_width(view_camera[0])/6)*4,224)
}

function combat(deck){
	#region Player
	if !variable_instance_exists(other,"instance_baralho"){
		var x_baralho = (camera_get_view_width(view_camera[0])/6)*5;
		other.instance_baralho = instance_create_layer(x_baralho,320,"Battle",obj_card);
		variable_instance_set(other.instance_baralho,"sprite_index",spr_card);
		variable_instance_set(other.instance_baralho,"image_index",0);
	};
	if !variable_instance_exists(other,"instance_cemiterio"){
		var _x = (camera_get_view_width(view_camera[0])/6)*5;
		other.instance_cemiterio = instance_create_layer(_x,224,"Battle",obj_card);
		variable_instance_set(other.instance_cemiterio,"sprite_index",spr_card);
		variable_instance_set(other.instance_cemiterio,"image_index",1);
	};
	if !variable_global_exists("baralho"){
		var _deck = deck
		global.baralho = ds_stack_create()
		repeat(array_length(_deck)){
			randomise()
			var card = irandom(array_length(_deck)-1);
			ds_stack_push(global.baralho,_deck[card]);
			array_delete(_deck,card,1);
			show_debug_message("Deck: "+string(_deck));
		}
	};
	
	global.hand = (!variable_global_exists("hand")) ? [] : global.hand;
	with other.instance_baralho{
		if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x,mouse_y,self) and (array_length(global.hand)<4){
			var _x = (camera_get_view_width(view_camera[0])/6);
			show_debug_message("Baralho: "+string(global.baralho))
			var _card = ds_stack_pop(global.baralho);
			var instance_card = instance_create_layer(_x*(array_length(global.hand)+1),320,"Battle",obj_card);
			variable_instance_set(instance_card,"sprite_index",spr_card);
			variable_instance_set(instance_card,"image_index",_card);
			array_push(global.hand,instance_card);
		}
	};
	
	other.temp_i = (!variable_instance_exists(other,"temp_i")) ? 0 : other.temp_i;
	if array_length(global.hand)>=1{
		with global.hand[other.temp_i]{
			global.actitaved_f = (!variable_global_exists("activated_f")) ? [] : global.actitaved_f;
			activated = (!variable_instance_exists(self,"activated")) ? false : activated;
			if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x,mouse_y,self) and (array_length(global.actitaved_f)<3) and !activated{
				other.x = (camera_get_view_width(view_camera[0])/6)*(array_length(global.actitaved_f)+2);
				other.y = 224;
				array_push(global.actitaved_f,id);
				activated = true;
			}
			other.activated_card = activated;
		}
		if activated_card{
			array_delete(global.hand,other.temp_id,1);
		}
		other.temp_i = (other.temp_i>=array_length(global.hand)) ? 0 : other.temp_i;
	};
	#endregion
}