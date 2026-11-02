function combat_init(){
	other.in_combat = true;
	cam_setcoord(obj_cam,0,0,false,noone,noone);
	var instance = instance_create_layer(0,0,"Battle",obj_battle);
}

function combat_gui(){
	draw_text(0,0,"Em Combate")
}

function combat(){
	if !variable_instance_exists(other,"instance_baralho"){
		var x_baralho = (camera_get_view_width(view_camera[0])/6)*5;
		other.instance_baralho = instance_create_layer(x_baralho,10,"Battle",obj_card);
		variable_instance_set(other.instance_baralho,"sprite_index",spr_card);
		variable_instance_set(other.instance_baralho,"image_index",0);
	};
	if !variable_instance_exists(other,"instance_cemiterio"){
		var _x = (camera_get_view_width(view_camera[0])/6)*5;
		other.instance_cemiterio = instance_create_layer(_x,50,"Battle",obj_card);
		variable_instance_set(other.instance_cemiterio,"sprite_index",spr_card);
		variable_instance_set(other.instance_cemiterio,"image_index",1);
	};
	if !variable_instance_exists(other.instance_baralho,"baralho"){
		other.baralho = ds_stack_create()
		cartas = [4,5,6];
		repeat(array_length(cartas)){
			randomise()
			var card = irandom(array_length(cartas)-1);
			ds_stack_push(other.baralho,cartas[card]);
			array_delete(cartas,card,1);
		}
		other.instance_baralho.baralho = other.baralho;
	};
	with other.instance_baralho{
		if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x,mouse_y,self){
			var _x = (camera_get_view_width(view_camera[0])/6)*2;
			var carta = instance_create_layer(_x,50,"Battle",obj_card);
			variable_instance_set(carta,"sprite_index",spr_card);
			variable_instance_set(carta,"image_index",ds_stack_pop(baralho));
		}
	};
}