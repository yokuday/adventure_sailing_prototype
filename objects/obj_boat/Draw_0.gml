//the boarder is moved to obj_docks
if obj_score.city_start = false || !instance_exists(obj_docks) {
	for(i=0; i<room_height/48; i++) {
		for(ii=0; ii<2; ii++) {
			if global.biome = "river" {
				draw_sprite_ext(spr_boarder, sprite[i, ii], xx[i, ii], yy[i, ii], 3, 3, rot[i, ii], c_white, 1);
			}
			if global.biome = "space" {
				draw_sprite_ext(spr_sboarder, sprite[i, ii], xx[i, ii], yy[i, ii], 3, 3, rot[i, ii], c_white, 1);
			}
		}
	}
}

//the city
if obj_score.city_start = false {
	if obj_score.city = true {
		if !instance_exists(obj_object) {
			if global.biome = "river" then sdock = spr_docks;
			//if global.biome = "space" then sdock = spr_space_dock;
			
			draw_sprite_ext(sdock, 0, 0, city_y, 3, 3, 0, c_white, 1);
		
			draw_sprite_ext(sdock, 0, 576, city_y, -3, 3, 0, c_white, 1);
		
			for(i=0; i<house_number; i++) {
				for(ii=0; ii<2; ii++) {
					if global.biome = "river" then shouse = spr_house;
					//if global.biome = "space" then shouse = spr_space_house;
					
					draw_sprite_ext(shouse, house_sprite[ii, i], house_xx[ii, i], (city_y-310)+house_yy[ii, i], 4, 4, 0, c_white, 1);
					
					draw_sprite_ext(shouse, house_sprite[ii, i]+1, house_xx[ii, i], (city_y-310)+house_yy[ii, i], 4, 4, 0, house_color[ii, i], 1);
				}
			}
		}
	}
}
//the docks
if instance_exists(obj_stopdock) {
	if global.biome = "river" then sstopdock = spr_dockplace;
	if global.biome = "space" then sstopdock = spr_space_dockplace;
	draw_sprite_ext(sstopdock, 0, obj_stopdock.x, obj_stopdock.y, 2, 2, 0, c_white, 1);	
}

//the boat
if lose = false or global.lose = true {
	draw_sprite_3d(1, 4);
}
//the hand
if instance_exists(obj_docks) {
	if obj_docks.ready = 0 {
		value+=0.04;
	
		if sin(value) > 0.99 {
			f_image = 1;	
		}
	
		if sin(value) < -0.99 {
			f_image = 0;	
		}
	
		for(i=0; i<200; i++) {
			if f_image = 1 {
				if point_distance(sin(value), sin(value), finger[i], finger[i]) < 0.05 {
					if scale[i] = 0 {
						scale[i] = 12;	
					}
				}
			}
		
			if scale[i] > 0 {
				if scale[i] < 11 {
					draw_sprite_ext(spr_particle_2, 0, finger_x[i]+sin(value)*15, 870, scale[i], scale[i], random_range(-5, 5), c_white, scale[i]/11);
				}
				scale[i]-=0.2;
			}
		}
	
		draw_sprite_ext(spr_finger, f_image, 330+sin(value)*120, 910, 3, 3, 0, c_white, 1);
	}
}