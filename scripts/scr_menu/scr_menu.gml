function button_text(_x,_y,text,des_color,act_color){
	var colors = [des_color,(act_color != -1) ? act_color : des_color];
	var size_text = [string_width(text),string_height(text)];
	var _return = false;
	if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+size_text[0],_y+size_text[1]){
		draw_text_colour(_x,_y,text,colors[1],colors[1],colors[1],colors[1],1);
		if mouse_check_button_pressed(mb_left){
			_return = true;
		};
	}else{
		draw_text_colour(_x,_y,text,colors[0],colors[0],colors[0],colors[0],1);
	}
	return _return
}

function start_menu(){
	if button_text(camera_get_view_width(camera_get_active())/2,camera_get_view_height(camera_get_active())/2,"Start",c_black,c_red){
		room_goto(room_test);
	}
}