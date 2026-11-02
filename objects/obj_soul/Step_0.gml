disth = obj_player.x-x
distv = (obj_player.y-obj_player.sprite_height)-y
spdh += .05*sign(disth);
spdv += .05*sign(distv);
if disth > 48 or disth < -48{
	if disth < 56 and disth > -56{
		spdh -= spdh/5
	};
	x += clamp(spdh,-5,5);
}else{
	spdh = 0;	
};
if distv > 8 or distv < -8{
	y += clamp(spdv,-2.5,2.5);
}else{
	spdv = 0;
};