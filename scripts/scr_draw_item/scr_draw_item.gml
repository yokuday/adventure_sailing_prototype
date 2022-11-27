function scr_draw_item() {
	number = argument[0];

	draw_set_alpha(transition);

	draw_rectangle(800+(3200*number)-xx, 1600, 2400+(3200*number)-xx, 4800, false);

	draw_sprite_ext(spr_particle_2, 0, 1425+(3200*number)-xx, 5100, 32*10, 16*10, 0, c_yellow, transition);


}
