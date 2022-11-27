if obj_score.city_start = true {
	for(i=0; i<room_height/48; i++) {
		for(ii=0; ii<2; ii++) {
			if global.biome = "river" {
				draw_sprite_ext(spr_boarder, obj_boat.sprite[i, ii], obj_boat.xx[i, ii], obj_boat.yy[i, ii], 3, 3, obj_boat.rot[i, ii], c_white, 1);
			}
			if global.biome = "space" {
				draw_sprite_ext(spr_sboarder, obj_boat.sprite[i, ii], obj_boat.xx[i, ii], obj_boat.yy[i, ii], 3, 3, obj_boat.rot[i, ii], c_white, 1);	
			}
		}
	}
}

if obj_score.city_start = true {
	if !instance_exists(obj_object) {
		if global.biome = "river" then sdock = spr_docks;
		if global.biome = "space" then sdock = spr_space_dock;
		
		draw_sprite_ext(sdock, 0, 0, obj_score.city_yy, 3, 3, 0, c_white, 1);
		
		draw_sprite_ext(sdock, 0, 576, obj_score.city_yy, -3, 3, 0, c_white, 1);
		
		for(i=0; i<obj_boat.house_number; i++) {
			for(ii=0; ii<2; ii++) {
				if global.biome = "river" then shouse = spr_house;
				if global.biome = "space" then shouse = spr_space_house;
				
				draw_sprite_ext(shouse, obj_boat.house_sprite[ii, i], obj_boat.house_xx[ii, i], (obj_score.city_yy-310)+obj_boat.house_yy[ii, i], 4, 4, 0, c_white, 1);
					
				draw_sprite_ext(shouse, obj_boat.house_sprite[ii, i]+1, obj_boat.house_xx[ii, i], (obj_score.city_yy-310)+obj_boat.house_yy[ii, i], 4, 4, 0, obj_boat.house_color[ii, i], 1);
			}
		}
	}
}

draw_self();