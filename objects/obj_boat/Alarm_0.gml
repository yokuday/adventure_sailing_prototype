global.lose = true;

spd = 5;

destroy_object = [obj_object, obj_tree, obj_seagul, obj_clouds];

for(i=0; i<array_length_1d(destroy_object); i++) {
	if instance_exists(destroy_object[i]) {
		instance_destroy(destroy_object[i]);	
	}
}

house_now = 0;

for(i=0; i<room_height/48; i++) {
	for(ii=0; ii<2; ii++) {
		sprite[i, ii] = irandom_range(0, 2);
	
		xx[i, ii] = 24+(ii*528);
		yy[i, ii] = i*48;
		
		if ii = 0 {
			rot[i, ii] = 0;

		}else{
			rot[i, ii] = 180;
		}
	}
}