function scr_boat_tap() {
	count = argument[0];

	shop_x = argument[1];
	shop_y = argument[2];
	shop_xx = argument[3];
	shop_yy = argument[4];

	boat_name = obj_boat.river_boats[string_char_at(obj_boat.boats_shop, count)-1];

	array_boat = false;

	for(i=0; i<array_length_1d(global.boats_list); i++) {
		if (global.boats_list[i] == boat_name) {
			array_boat = true;
			audio_play_sound(snd_click, 5, false)
			break;
		}
	}

	if array_boat = false {
		if point_in_rectangle(gui_x, gui_y, shop_x, shop_y-yy, shop_xx, shop_yy-yy) {
			if transition = 1 && biome_equip = "" {
				if ready = 0 {
					ready = count;	
				}
			}
		}
	}


}
