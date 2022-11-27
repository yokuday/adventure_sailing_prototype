function scr_biome_info() {
	scr_biome_colors(biome_equip);
	draw_rectangle(200, 1000, 3000, 5400, false);

	draw_set_color(c_white);
	draw_text_transformed(1610, 1310, biome_equip, 5+(sin(variable_pi)/8), 5+(sin(variable_pi)/8), 0);

	draw_sprite_ext(spr_yes, 0, 600, 5050, 20, 20, 0, c_white, 1);
	draw_sprite_ext(spr_no, 0, 2600, 5050, 20, 20, 0, c_white, 1);

	if point_in_rectangle(gui_x, gui_y, 2200, 4650, 3000, 5450) {
	
		if mouse_check_button(mb_left) {
			draw_sprite_ext(spr_no, 1, 2600, 5050, 20, 20, 0, c_white, 1);
		}
	
		if mouse_check_button_pressed(mb_left) && alarm[1] < 0 {
			biome_equip = "";
		
			alarm[0] = 10;
		}
	}

	if point_in_rectangle(gui_x, gui_y, 200, 4650, 1000, 5450) {
	
		if mouse_check_button(mb_left) {
			draw_sprite_ext(spr_yes, 1, 600, 5050, 20, 20, 0, c_white, 1);
		}
	
		if mouse_check_button_pressed(mb_left) {
			if global.fishes >= biome_value && alarm[1] < 0 {
				global.fishes-=biome_value;
			
				alarm[0] = 10;
			
				ini_open("savedata.ini");
			
				ini_write_string("numbers", "biome", biome_equip);
			
				ini_close();
			
				alarm[1] = 40;
				alarm[2] = 80;
			}
		}
	}

	draw_text_transformed(1500, 5000, biome_value, 4+(sin(variable_pi)/8), 4+(sin(variable_pi)/8), 0);

	draw_sprite_ext(spr_fish, 0, 1520+(string_length(string(biome_value))*180), 5000, 18+(sin(variable_pi)), 18+(sin(variable_pi)), 0, c_white, transition);


}
