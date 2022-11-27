function scr_trick_draw_gui() {
	if global.lose = false {
		if trick_triggered {
			if alarm[1] < 45 {	
				if alarm[1] > 0 {
					/*
					draw_set_color(c_black);
					draw_text_ext_transformed(1600, 2050, text, 1, 5000, alarm[1]/50 * 8, alarm[1]/50 * 8, angle);
		
					draw_set_color(c_white);
					draw_text_ext_transformed(1600, 2000, text, 1, 5000, alarm[1]/50 * 8, alarm[1]/50 * 8, angle);
					*/
				}
			}
		}
		if trick_point_visual >= 1 {
			if alarm[1] > 0 {	
				draw_set_color(c_white);
				if alarm[1] < 45 {
					draw_set_alpha(alarm[1]/45);
					if obj_score.points < 1000 {
	
						draw_set_color(c_black);
						draw_text_ext_transformed(1720+(string_length(string(obj_score.points))*220)+tx, 1040+ty, "+"+string(round(trick_point_visual)), 1, 1000, 5, 5, tangle);
					
						draw_set_color(c_white);
						draw_text_ext_transformed(1700+(string_length(string(obj_score.points))*220)+tx, 1020+ty, "+"+string(round(trick_point_visual)), 1, 1000, 5, 5, tangle);
					}else{
						draw_set_color(c_black);
						draw_text_ext_transformed(1720+660+tx, 1040+ty, "+"+string(round(trick_point_visual)), 1, 1000, 5, 5, tangle);
					
						draw_set_color(c_white);
						draw_text_ext_transformed(1700+660+tx, 1020+ty, "+"+string(round(trick_point_visual)), 1, 1000, 5, 5, tangle);
					}
					
					draw_set_alpha(alarm[1]/45 * 2);
					var slide = 0;
					if alarm[1] > 38 { slide = alarm[1] - 38; }
					draw_set_color(c_black);
					draw_text_ext_transformed(1600, 2050, text, 1, 5000, 7 - slide, 7 - slide, angle);
		
					draw_set_color(c_white);
					draw_text_ext_transformed(1600, 2000, text, 1, 5000, 7 - slide, 7 - slide, angle);
					
					draw_set_alpha(1);
				}else{
					draw_set_alpha(1);
					if obj_score.points < 1000 {
						draw_set_color(c_black);
						draw_text_ext_transformed(1720+(string_length(string(obj_score.points))*220)+tx, 1040+ty, "+"+string(round(trick_point_visual)), 1, 1000, ((45-alarm[1]))+5, ((45-alarm[1]))+5, tangle);
					
						draw_set_color(c_white);
						draw_text_ext_transformed(1700+(string_length(string(obj_score.points))*220)+tx, 1020+ty, "+"+string(round(trick_point_visual)), 1, 1000, ((45-alarm[1]))+5, ((45-alarm[1]))+5, tangle);
					}else{
						draw_set_color(c_black);
						draw_text_ext_transformed(1720+660+tx, 1040+ty, "+"+string(round(trick_point_visual)), 1, 1000, ((45-alarm[1]))+5, ((45-alarm[1]))+5, tangle);
					
						draw_set_color(c_white);
						draw_text_ext_transformed(1700+660+tx, 1020+ty, "+"+string(round(trick_point_visual)), 1, 1000, ((45-alarm[1]))+5, ((45-alarm[1]))+5, tangle);
					}
				}
			}
		}
	}


}
