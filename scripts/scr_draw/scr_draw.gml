function scr_draw() {
	draw_set_color(c_white);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);

	if name = "stone" {
		/////////////////////////////////////////////
		if point_distance(x, y, obj_boat.x, obj_boat.y) < 700 {
			if d3 {draw_sprite_3d(image_xscale, image_yscale) } else {
				draw_sprite_ext(sprite_index, current_frame, x, y, image_xscale, image_yscale, 0, c_white, 1)
			}
		}
		
		if current_frame == 3 && !d3 {
			for(var k = 0; k<5; k++) {
				if trash_start[k] > 0 {
					trash_start[k]--;	
				}else{
					trash_y[k] -= 0.08;
					if trash_state[k] == 0 {
						trash_scale[k] += 0.05;
						if trash_scale[k] >= 1 { trash_state[k] = 1 };
					}else{
						trash_state[k] += 0.5
						
						if trash_state[k] >= 45 { trash_alpha[k] = 1 - ((trash_state[k] - 45) / 10) }
						if trash_state[k] >= 55 { 
							trash_x[k] = x + irandom_range(-60, 60);
							trash_y[k] = y + irandom_range(-15, 30);
				
							trash_scale[k] = 0;
							trash_state[k] = 0;
				
							trash_start[k] = irandom_range(0, 50);
				
							trash_alpha[k] = 1;
						}
					}
					
					draw_sprite_ext(spr_particle, 0, trash_x[k], trash_y[k],
					trash_scale[k] * 8 / 2 * 8.5, trash_scale[k] * 8 / 5 * 8.5, 0, make_color_rgb(106, 113, 55), trash_alpha[k] / 4)
				}
			}
		}
		
		scr_trick_draw();
		/////////////////////////////////////////////
	}

	if name = "plank" {
		/////////////////////////////////////////////
		if point_distance(x, y, obj_boat.x, obj_boat.y) < 800 {
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0+(sin(vari)*25), c_white, 1)
		}
		/////////////////////////////////////////////
	}

	if name = "rocket" {
		/////////////////////////////////////////////
		if alarm[1] < 0 {
			draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);	
		}
		/////////////////////////////////////////////
	}

	if name = "chest" {
		/////////////////////////////////////////////
		if point_distance(x, y, obj_boat.x, obj_boat.y) < 800 {
			draw_sprite_3d(image_xscale, image_yscale);
		}
		/////////////////////////////////////////////	
	}

	if name = "fishes" {
		/////////////////////////////////////////////
		draw_self();
		/////////////////////////////////////////////	
	}


}
