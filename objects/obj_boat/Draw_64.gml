var cl = camera_get_view_x(view_camera[0])
var ct = camera_get_view_y(view_camera[0])
       
var off_x = mouse_x - cl // x is the normal x position
var off_y = mouse_y - ct // y is the normal y position
       
        // convert to gui
var off_x_percent = off_x / camera_get_view_width(view_camera[0])
var off_y_percent = off_y / camera_get_view_height(view_camera[0])
       
var gui_x = off_x_percent * display_get_gui_width()
var gui_y = off_y_percent * display_get_gui_height()

draw_set_font(fnt_game);

//draw_text(160, 60, spd);

if lose = true {
	
	if alarm[1] < 0 {
		draw_set_color(make_color_rgb(143, 86, 59));
		draw_rectangle(0, 5050, 3200, 5350, false);

		draw_set_color(c_black);
		draw_rectangle_width(0, 5050, 3200, 5350, 20);
		
		draw_sprite_ext(spr_restart, 0, 1600, 5200, 20, 20, 0, c_white, 1);
		
		if mouse_check_button_pressed(mb_left) {
			if point_in_circle(gui_x, gui_y, 1600, 5200, 400) {
				alarm[0] = 20;
				alarm[1] = 60;
			}
		}
	}
	/*
	if alarm[1] > 0 {
		draw_set_circle_precision(16);
		draw_set_color(c_white);
		var c1 = 3; var c2 = 8
		if alarm[0] > 0 {
			for(var k = 0; k<c1; k++) {
				for(var j = 0; j<c2; j++) {
					draw_circle((3200 / (c1) * (k+1)) - (3200 / c1 / 2), (6400 / (c2) * (j+1)) - (6400 / c2 / 2), 1000 * (20-alarm[0])/20, false)		
				}
			}	
			//draw_sprite_ext(spr_particle, 0, 0, 0, 3200, 6400, 0, c_black, (20-alarm[0])/20);	
		}else{
			//draw_sprite_ext(spr_particle, 0, 0, 0, 3200, 6400, 0, c_black, (alarm[1])/40);
			for(var k = 0; k<c1; k++) {
				for(var j = 0; j<c2; j++) {
					draw_circle((3200 / (c1) * (k+1)) - (3200 / c1 / 2), (6400 / (c2) * (j+1)) - (6400 / c2 / 2), 1000 * ((alarm[1])/40), false)		
				}
			}			
		}
		draw_set_color(c_white);
	}
	*/
}