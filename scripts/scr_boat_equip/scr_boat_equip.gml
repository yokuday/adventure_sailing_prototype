function scr_boat_equip() {
	ccn++;

	if equip_info = -1 {
		if ccn != equip {
			if ccn <= global.count+1 {
				if point_in_rectangle(gui_x, gui_y, 102+(ii*1038), 1000-yy+(i*1300), 1038+(ii*1038), 2200-yy+(i*1300)) {
					equip_info = ccn;
					audio_play_sound(snd_click, 5, false)
				}
			}
		}
	}


}
