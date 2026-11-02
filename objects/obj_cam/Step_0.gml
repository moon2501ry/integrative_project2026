if !variable_instance_exists(self,"chat_id"){
	chat_id = noone;
};
if !variable_instance_exists(self,"chat"){
	chat = false;
};
var _player = instance_find(obj_player, 0);
var _middle_x = (instance_exists(chat_id)) ? _player.x+((chat_id.x-_player.x)/2) : 0;
if chat{
	x = _middle_x;
}else if !chat{
	x = _player.x;
};
y = _player.y-(_player.sprite_height/2);