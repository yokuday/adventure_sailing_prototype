function scr_trick_draw() {
	if obj_boat.lose = false {
		if trick_point_visual > 0.5 {
			if trick_point_visual != trick_point_old_visual {
				if alarm[1] > 45 {
					draw_text_ext_transformed(x, y-32-(trick_point_visual*2), "+"+string(round(trick_point_visual)), 1, 5000, 0.5+(trick_point_visual/20), 0.5+(trick_point_visual/20), 0);	
					text = scr_text();
				}
			}
		}
	}
	
	if trick_triggered {
		if alarm[1] < 45 {	
			if alarm[1] > 0 {
				/*
				draw_set_color(c_black);
				draw_text_ext_transformed(x+5, y-59, text, 1, 5000, alarm[1]/50, alarm[1]/50, angle);
		
				draw_set_color(c_white);
				draw_text_ext_transformed(x, y-64, text, 1, 5000, alarm[1]/50, alarm[1]/50, angle);
				*/
				if noise {
					if not noise2 {
						audio_play_sound(snd_flip_end, 7, false); noise2 = true;	
					}
				}
			}
		}
	}


}
