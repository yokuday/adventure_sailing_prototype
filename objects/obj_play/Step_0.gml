var cl = camera_get_view_x(view_camera[0])
var ct = camera_get_view_y(view_camera[0])
       
var off_x = mouse_x - cl // x is the normal x position
var off_y = mouse_y - ct // y is the normal y position
       
// convert to gui
var off_x_percent = off_x / camera_get_view_width(view_camera[0])
var off_y_percent = off_y / camera_get_view_height(view_camera[0])
       
gui_x = off_x_percent * display_get_gui_width()
gui_y = off_y_percent * display_get_gui_height()

if big_side = 0 {
	if big < 2 {
		big+=0.01;	
	}else{
		big_side = 1;	
	}
}else{
	if big > 0 {
		big-=0.01;	
	}else{
		big_side = 0;	
	}
}

if mouse_check_button_pressed(mb_left) {
	if !(point_in_rectangle(gui_x, gui_y, 1900, 5800, 3000, 6300) || point_in_rectangle(gui_x, gui_y, 200, 5800, 1300, 6300)) {
		if (global.lose = true && obj_boat.lose = false) {
			if (global.shop = 0 && obj_shop.transition = 0 && obj_shop.inventory = 0) {
				alpha = 0;
				global.lose = false;
				
				audio_play_sound(snd_water1, 1, true);
				audio_play_sound(snd_water2, 1, true);
				
				audio_play_sound(snd_splash1, 1, true);
				audio_play_sound(snd_splash2, 1, true);
			}
		}	
	}
}