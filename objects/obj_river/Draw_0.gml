if global.biome = "river" {
	image_blend = make_color_hsv(140, 240, 220);
}
if global.biome = "space" {
	image_blend = make_color_hsv(0, 20, 10)	
}

draw_self() // draw the normal image

old_spd = round(obj_boat.spd);

if global.biome = "river" {
	for(i=0; i<old_spd*15; i++) {
		ready = 0;
	
		if water_xx[i] > room_width+scale[i] {
			ready = 1;	
		}
		if water_xx[i] < -scale[i] {
			ready = 1;	
		}
		if water_yy[i] > room_height+scale[i] {
			ready = 1;	
		}
		if water_yy[i] < -scale[i] {
			ready = 1;	
		}
	
		if global.lose = true {
			ready = 1;	
		}
	
		if ready = 1 {
			water_xx[i] = obj_boat.x+random_range(-6, 6);
			water_yy[i] = obj_boat.y+random_range(-12, 12);
	
			scale[i] = random_range(0.5, 5);
	
			dir[i] = irandom_range(0, 360);
	
			angle[i] = irandom_range(0, 360);
	
			spd[i] = random_range(obj_boat.spd/3, obj_boat.spd);	
		}else{
			water_xx[i]+=lengthdir_x(spd[i], dir[i]);
			water_yy[i]+=lengthdir_y(spd[i], dir[i]);
		
			angle[i]+=irandom_range(-spd[i], spd[i]);
		
			draw_sprite_ext(spr_particle, 0, water_xx[i], water_yy[i], scale[i], scale[i], angle[i], make_color_hsv(140, 240, 240), 1);
		}
	}
}

for(i=0; i<20; i++) {
	if global.biome = "river" {
		bscale[i]-=bspd[i]*random_range(0.2, 1);
	
		bubble_xx[i]+=lengthdir_x(bspd[i]*2, bubble_angle[i]);
		bubble_yy[i]+=lengthdir_y(bspd[i]*2, bubble_angle[i]);
	}
	if global.biome = "space" {
		//bscale[i]-=bspd[i]*random_range(0.1, 0.2);	
	}
	
	if bscale[i] < 0 {
		bubble_xx[i] = obj_boatreal.x+random_range(-200, 200);
		bubble_yy[i] = obj_boatreal.y+random_range(-500, 500);
	
		bscale[i] = 5;
		bspd[i] = random_range(0.1, 0.5);	
	}else{
		if global.biome = "river" {
			draw_sprite_ext(spr_particle, 0, bubble_xx[i], bubble_yy[i], bscale[i], bscale[i], 0, make_color_hsv(140, 230, 240), 0.3);	
		}
		if global.biome = "space" {
			//draw_sprite_ext(spr_particle, 0, bubble_xx[i], bubble_yy[i], bscale[i]/4, bscale[i]/4, 0, c_white, 0.3);		
		}
	}
}

if global.lose = false{
	for(i=0; i<40; i++) {
		prop_y[i] -= prop_spd[i]*2;
	
		if prop_y[i] > room_height+50 {
			prop_img[i] = irandom_range(0, 3);
			prop_x[i] = irandom_range(10, room_width-10);
			prop_y[i] = irandom_range(0, -960);
	
			prop_spd[i] = random_range(0.1, 0.5);
	
			prop_rot[i] = irandom_range(0, 360);	
		}
		
		draw_sprite_ext(spr_little_toys, prop_img[i], prop_x[i], prop_y[i], 5, 5, prop_rot[i], c_gray, 0.2);
	}
}