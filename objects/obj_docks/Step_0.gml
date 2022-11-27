if image_index = 5 {
	
	image_index = 0;
	image_speed = 0;
	alarm[0] = irandom_range(30, 150)	
}

if ready = 1 {
	image_alpha = 0;	
}else{
	image_alpha = 1;	
}

if obj_score.city_done = 1 {
	image_alpha = 0;
}else{
	if global.lose = true {
		ready = 0;	
	}
}

depth = -3;

if obj_score.city_yy > room_height+300 {
	instance_destroy(self);	
}