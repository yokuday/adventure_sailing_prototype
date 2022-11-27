function scr_boat_info() {
	//the boat name is in the draw gui event

	scr_boat_prices(ready);

	//draw_set_color(c_green);
	//draw_rectangle(200, 4650, 1000, 5450, false);
	draw_sprite_ext(spr_yes, 0, 600, 5050, 20, 20, 0, c_white, transition);

	//draw_set_color(c_red);
	//draw_rectangle(2200, 4650, 3000, 5450, false);
	draw_sprite_ext(spr_no, 0, 2600, 5050, 20, 20, 0, c_white, transition);

	if point_in_rectangle(gui_x, gui_y, 2200, 4650, 3000, 5450) {
	
		if mouse_check_button(mb_left) {
			draw_sprite_ext(spr_no, 1, 2600, 5050, 20, 20, 0, c_white, transition);
		}
	
		if mouse_check_button_pressed(mb_left) {
			ready = 0;
		
			alarm[0] = 10;
		}
	}

	if point_in_rectangle(gui_x, gui_y, 200, 4650, 1000, 5450) {
	
		if mouse_check_button(mb_left) {
			draw_sprite_ext(spr_yes, 1, 600, 5050, 20, 20, 0, c_white, transition);
		}
	
		if mouse_check_button_pressed(mb_left) {
		
			scr_boat_prices(ready);	

			if global.coins >= boat_value {
				global.coins-=boat_value;
				ready = 0;
			
				alarm[0] = 10;
			
				global.count++;
			
				global.boats_list[global.count] = boat_name;
			
				ini_open("savedata.ini");
			
				ini_write_real("boats", "boat_count", global.count);
			
				ini_write_string("boats", "boat"+string(global.count), boat_name);
			
				ini_close();
			}
		}
	}

	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);

	draw_set_color(boat_colorb);
	draw_text_transformed(1610, 1310, boat_rn, 5+(sin(variable_pi)/8), 5+(sin(variable_pi)/8), 0);

	draw_set_color(boat_colorf);
	draw_text_transformed(1600, 1300, boat_rn, 5+(sin(variable_pi)/8), 5+(sin(variable_pi)/8), 0);

	draw_set_color(c_white);

	if global.coins < boat_value {
		draw_set_color(c_maroon);
	}

	draw_text_transformed(1500, 5000, boat_value, 4+(sin(variable_pi)/8), 4+(sin(variable_pi)/8), 0);

	draw_sprite_ext(spr_coin, 0, 1520+(string_length(string(boat_value))*130), 5000, 18+(sin(variable_pi)), 18+(sin(variable_pi)), 0, c_white, transition);

	for(i=0; i<sprite_get_number(boat_name); i++) {
		draw_sprite_ext(boat_name, i, 1650, 2600-(i*64), 16, 16, -boat_angle, c_white, transition);
	}

	draw_set_color(boat_colorb);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	draw_text_ext_transformed(400, 3100, boat_info, 100, 1000, 2.5, 2.5, 0);


}
