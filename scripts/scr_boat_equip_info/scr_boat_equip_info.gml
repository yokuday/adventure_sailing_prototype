function scr_boat_equip_info() {
	draw_set_alpha(transition/1.3);
	
	draw_set_color(c_black);
	draw_rectangle(200, 1000, 3000, 5400, false);	

	draw_set_alpha(transition/2);
	
	draw_rectangle(0, -400, 3200, 6800, false);	
	
	draw_set_alpha(transition);
	
	draw_set_color(c_white);
	draw_rectangle_width(200, 1000, 3000, 5400, 50);
	
	//boat_name = global.boats_list[equip_info-1];
	scr_boat_prices(equip_info, 0);

	draw_sprite_ext(spr_equip, 0, 1600, 5000, 16, 16, 0, c_white, transition);

	if point_in_rectangle(gui_x, gui_y, 1200, 4800, 2000, 5200) {
	
		if mouse_check_button(mb_left) {
			draw_sprite_ext(spr_equip, 1, 1600, 5000, 16, 16, 0, c_white, transition);
		}
	
		if mouse_check_button_pressed(mb_left) {
			equip = equip_info;
			equip_info = -1;
		
			ini_open("savedata.ini");
		
			ini_write_string("boats", "boat_active", boat_name);
			obj_boat.sprite_index = boat_name;
	
			ini_close();
		}
	}

	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);

	draw_set_color(boat_colorb);
	draw_text_transformed(1610, 1310, boat_rn, 5+(sin(variable_pi)/8), 5+(sin(variable_pi)/8), 0);

	draw_set_color(boat_colorf);
	draw_text_transformed(1600, 1300, boat_rn, 5+(sin(variable_pi)/8), 5+(sin(variable_pi)/8), 0);

	for(j=0; j<sprite_get_number(boat_name); j++) {
		draw_sprite_ext(boat_name, j, 1650, 2600-(j*64), 16, 16, -boat_angle, c_white, transition);
	}

	draw_set_color(boat_colorb);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	draw_text_ext_transformed(400, 3100, boat_info, 100, 1000, 2.5, 2.5, 0);
	
	draw_set_color(c_white);


}
