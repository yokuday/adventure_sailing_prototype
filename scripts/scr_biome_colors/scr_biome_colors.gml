function scr_biome_colors() {
	biome_need = argument[0]

	if biome_need = "river" {
		biome_value = 10
		draw_set_color(make_color_hsv(140, 240, 220));
	}
	if biome_need = "space" {
		biome_value = 10;
		draw_set_color(make_color_hsv(0, 10, 20));
	}


}
