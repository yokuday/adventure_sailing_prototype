if wind_go = 1 {
	for(i=0; i<100; i++) {
		draw_set_color(c_white);
		draw_set_alpha(windalpha[i]);
		draw_line_width(windx[i], windy[i], windx[i], (windy[i]-windlength[i]), 3);	
		draw_set_alpha(1);
	}
}