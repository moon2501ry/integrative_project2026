if collision_player{
	var _x = camera_get_view_width(camera_get_active())/2-sprite_get_width(spr_dialogbox)*2
	var _y = camera_get_view_height(camera_get_active())-sprite_get_height(spr_dialogbox)*4
	draw_sprite_ext(spr_dialogbox,-1,_x,_y,4,4,0,-1,1);
	draw_text(_x,_y,dialogue[dialogue_n])
}
combat_gui()