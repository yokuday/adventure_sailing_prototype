depth = -1000
if image_index >= image_number-1 {
	instance_destroy(self);	
}

if wait_boom > 0 {
	wait_boom--	
}else { boom = true; image_speed = 1 }

if image_speed == 1 {
	view_xport[0] = irandom_range(-13, 13);
	view_yport[0] = irandom_range(-13, 13);
}