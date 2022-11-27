if pressed_chongus > 0 {
	if inventory = 0 {
		if global.shop = 1 {
			if alarm[0] <= 0 {
				scr_boat_tap(1, 100, 4000, 1550, 6000);
				scr_boat_tap(2, 1650, 4000, 3100, 6000);
				scr_boat_tap(3, 100, 6100, 1550, 8100);
				scr_boat_tap(4, 1650, 6100, 3100, 8100);
			
				scr_biome_tap("river", 100, 9500, 3100, 10500);
				//scr_biome_tap("space", 100, 10600, 3100, 11600);
			}
		}else{
			untest = 0;
		
			if instance_exists(obj_stopdock) {
				if obj_stopdock.collision = true then untest = 1;	
			}
		
			if global.lose = true then untest = 1;
		
			if untest = 1 {
				if point_in_rectangle(gui_x, gui_y, 1900, 5800, 3000, 6300) {
					yy = 0;
					fishes = 1;
					ready = 0;
					biome_equip = "";
					equip_info = -1;
					global.shop = 1;
					
					audio_play_sound(snd_shop_music, 1, true)
					audio_play_sound(snd_click, 5, false)
				}
			}	
		}
	
		if global.lose = true {
			if global.shop = 0 {
				if point_in_rectangle(gui_x, gui_y, 200, 5800, 1300, 6300) {
					yy = 0;
					equip_info = -1;
					inventory = 1;
					ready = 0;
					inventory_old = 1;
					biome_equip = "";
					
					audio_play_sound(snd_click, 5, false)
				}
			}
		}
	}

	if inventory_old = 1 {
		ccn = 0;
		for(i=0; i<floor((global.count)/3)+1; i++) {
			for(ii=0; ii<3; ii++) {
				scr_boat_equip();	
			}
		}
	}
}