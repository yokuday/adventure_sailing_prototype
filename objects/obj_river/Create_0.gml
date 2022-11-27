image_index = 0 // in image_index 0 we have the image and in image_index 1 we have the bit to blank out
image_speed = 0

depth = -1;

//display_set_gui_size(160, 320);

old_spd = round(obj_boat.spd)

for(i=0; i<1000; i++) {
	water_xx[i] = obj_boat.x+random_range(-6, 6);
	water_yy[i] = obj_boat.y+random_range(-12, 12);
	
	scale[i] = random_range(0.5, 5);
	
	dir[i] = irandom_range(0, 360);
	angle[i] = irandom_range(0, 360);
	
	spd[i] = random_range(obj_boat.spd/3, obj_boat.spd);
}

for(i=0; i<20; i++) {
	bubble_xx[i] = obj_boatreal.x+random_range(-200, 200);
	bubble_yy[i] = obj_boatreal.y+random_range(-500, 500);
	
	bscale[i] = 5;
	bspd[i] = random_range(0.1, 0.5);
	
	bubble_angle[i] = irandom_range(0, 360);
}

for(i=0; i<40; i++) {
	prop_img[i] = irandom_range(0, 3);
	prop_x[i] = irandom_range(10, room_width-10);
	prop_y[i] = irandom_range(0, -960);
	
	prop_spd[i] = random_range(0.1, 0.5);
	
	prop_rot[i] = irandom_range(0, 360);
}