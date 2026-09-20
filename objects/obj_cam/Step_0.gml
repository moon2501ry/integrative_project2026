var _player = instance_find(obj_player, 0);
var _middle_x = _player.x+((obj_enemy.x-_player.x)/2);
if !variable_instance_exists(self,"chat"){
	chat = false;
};
if chat{
	x = _middle_x;
}else if !chat{
	x = _player.x;
};
y = _player.y-(_player.sprite_height/2);