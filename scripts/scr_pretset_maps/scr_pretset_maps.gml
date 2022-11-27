// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_pretset_maps(){
	r = 0
	//no 50 lidz room_width == 526   mid == 238
	// -400
	if r == 0 {
		stone_coordinates = [[1, 150, 0, 320, -500, 4],
		[1, 320, -600, 150, -1100, 4],
		[1, 150, -1200, 320, -1700, 4]] // 0 == single, 1 == [x1, y1, x2, y2, count]
		show_debug_message(array_length_1d(stone_coordinates));
		for (var k=0; k<array_length_1d(stone_coordinates); k++) {
			sc = stone_coordinates
			if sc[k, 0] == 0 {
				scr_create_object(sc[k, 1], sc[k, 2] - 400, "stone", irandom_range(0, 1), false);
			}
			if sc[k, 0] == 1 {
				for(var j = 1; j<sc[k, 5]+1; j++) {
					scr_create_object(sc[k, 1] + ((sc[k, 3] - sc[k, 1]) / sc[k, 5] * j),
					sc[k, 2] + ((sc[k, 4] - sc[k, 2]) / sc[k, 5] * j) - 400,
					"chest", irandom_range(0, 1), false);
				}
			}
		}	
		
		preset_length = irandom_range(2000, 10000);
	}	
}