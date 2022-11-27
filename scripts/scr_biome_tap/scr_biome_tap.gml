function scr_biome_tap() {
	biome_name = argument[0];

	biome_x = argument[1];
	biome_y = argument[2];

	biome_xx = argument[3];
	biome_yy = argument[4];

	if point_in_rectangle(gui_x, gui_y, biome_x, biome_y-yy, biome_xx, biome_yy-yy) {
		if transition = 1 && ready = 0 {
			if biome_equip = "" && global.biome != biome_name {
				biome_equip = biome_name;	
			}
		}
	}


}
