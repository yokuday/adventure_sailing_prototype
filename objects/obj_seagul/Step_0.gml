if x > room_width+16 {
	instance_destroy(self);	
}

if x < -16 {
	instance_destroy(self);	
}

if dir = 0 {
	x+=spd
}else{
	x-=spd;	
}