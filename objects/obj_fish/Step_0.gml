//move_towards_point(obj_boat.x+100, obj_boat.y-400, spd);

if side = 0 {
	image_angle+=10;
}else{
	image_angle-=10;
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