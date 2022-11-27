function draw_sprite_3d() {
	scale_3d = argument[0];
	height_3d = argument[1];

	for(i=0; i<sprite_get_number(sprite_index); i++) {
		draw_sprite_ext(sprite_index, i, x, y-(i*height_3d), scale_3d, scale_3d, image_angle, c_white, image_alpha); 
	}


}
