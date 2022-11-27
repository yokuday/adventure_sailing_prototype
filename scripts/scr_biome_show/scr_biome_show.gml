function scr_biome_show() {
	biome_name = argument[0];

	biome_x = argument[1];
	biome_y = argument[2];

	biome_xx = argument[3];
	biome_yy = argument[4];

	scr_biome_colors(biome_name);

	draw_rectangle(biome_x, biome_y-yy, biome_xx, biome_yy-yy, false);

	draw_set_color(c_black);
	draw_rectangle_width(biome_x, biome_y-yy, biome_xx, biome_yy-yy, 20);

	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);

	draw_set_color(c_white);
	draw_text_transformed(1600, biome_y-yy+175, biome_name, 4, 4, sin(variable_pi)*8);

	if global.biome != biome_name {
		draw_set_color(c_white);
		if global.fishes < biome_value then draw_set_color(c_maroon); 
	
		draw_text_transformed(1600, biome_y-yy+800, "Travel cost: "+string(biome_value), 3, 3, sin(variable_pi)*2);
		draw_sprite_ext(spr_fish, 0, 2700, biome_y-yy+820, 15, 15, sin(variable_pi+pi)*25, c_white, transition);
	}else{
		draw_set_color(c_yellow);
		draw_text_transformed(1600, biome_y-yy+800, "Traveled!", 3, 3, sin(variable_pi)*2);	
	}


}
