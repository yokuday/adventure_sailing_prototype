function scr_boat_show() {
	ccn++;

	if ccn <= global.count+1 {
		scr_boat_prices(ccn, 0);
		scr_biome_colors(boat_biome);
	
		boat_name = global.boats_list[ccn-1];
	
		draw_rectangle(102+(ii*1038), 1000-yy+(i*1300), 1038+(ii*1038), 2200-yy+(i*1300), false);
	
		for(j=0; j<sprite_get_number(boat_name); j++) {
			draw_sprite_ext(boat_name, j, 580+(ii*1038), 1700-yy+(i*1300)-(j*40), 10, 10, boat_angle, c_white, transition);
		}
	
		sdr = 30
		draw_set_color(c_black);
	
		if equip = ccn {
			sdr = 70;	
			draw_set_color(c_white);
		}
		draw_rectangle_width(102+(ii*1038), 1000-yy+(i*1300), 1038+(ii*1038), 2200-yy+(i*1300), sdr);
	}

	draw_set_color(c_white);


}
