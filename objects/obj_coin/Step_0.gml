//move_towards_point(obj_boat.x+100, obj_boat.y-400, spd);

if side = 0 {
	if image_xscale < 3 {
		image_xscale+=0.3;	
	}else{
		side = 1;	
	}
}else{
	if image_xscale > -3 {
		image_xscale-=0.3;	
	}else{
		side = 0;	
	}
}

if alarms > 0 {
	alarms--;	
}else{
	go = 1;	
}

/*
if point_distance(obj_boat.x+100, obj_boat.y-400, x, y) < spd+1 {
	instance_destroy(self);	
	global.coins++;
}
*/