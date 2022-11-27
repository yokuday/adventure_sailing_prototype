function scr_boat_buy() {
	count = argument[0];

	shop_x = argument[1]
	shop_y = argument[2]
	shop_xx = argument[3]
	shop_yy = argument[4]

	scr_boat_prices();

	sdr = 20;
	draw_set_color(c_black);

	if ready = count {
		sdr = 80;
		draw_set_color(c_white);
	}

	boat_name = obj_boat.river_boats[string_char_at(obj_boat.boats_shop, count)-1];

	draw_rectangle(shop_x-sdr, shop_y-yy-sdr, shop_xx+sdr, shop_yy-yy+sdr, false);

	scr_biome_colors(global.biome);
	draw_rectangle(shop_x, shop_y-yy, shop_xx, shop_yy-yy, false);

	for(i=0; i<sprite_get_number(boat_name); i++) {
		draw_sprite_ext(boat_name, i, shop_x+725, shop_y+1000-yy-(i*56), 14, 14, boat_angle, c_white, transition);
	}

	draw_set_color(c_white);

	if global.coins < boat_value {
		draw_set_color(c_maroon);	
	}

	array_boat = false;

	for(i=0; i<array_length_1d(global.boats_list); i++) {
		if (global.boats_list[i] == boat_name) {
			array_boat = true;
			break;
		}
	}

	if array_boat = false {
		draw_text_transformed(shop_x+625, shop_y+1750-yy, boat_value, 4, 4, 0);
	
		draw_sprite_ext(spr_coin, 0, shop_x+780+(string_length(string(boat_value))*90), shop_y+1750-yy, 18, 18, 0, c_white, transition);
	}else{
		draw_set_color(c_yellow);
		draw_text_transformed(shop_x+750, shop_y+1750-yy, "Purchased", 3.5, 3.5, 0);
	}	


}
