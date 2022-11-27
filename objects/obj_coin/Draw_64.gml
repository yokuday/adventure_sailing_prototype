var cl = camera_get_view_x(view_camera[0])
var ct = camera_get_view_y(view_camera[0])
       
var off_x = x - cl // x is the normal x position
var off_y = y - ct // y is the normal y position
       
        // convert to gui
var off_x_percent = off_x / camera_get_view_width(view_camera[0])
var off_y_percent = off_y / camera_get_view_height(view_camera[0])
       
var gui_x = off_x_percent * display_get_gui_width()
var gui_y = off_y_percent * display_get_gui_height()

//move_towards_point(obj_boat.x+100, obj_boat.y-400, spd);

if go = 1 {
	var length = point_direction(gui_x, gui_y, 2400, 400);
}else{
	var length = point_direction(gui_x, gui_y, 2400+(changex*15), 400);
}	

x+=lengthdir_x(spd, length);
y+=lengthdir_y(spd, length);

if point_distance(2400, 400, gui_x, gui_y) < spd+100 {
	instance_destroy(self);	
	global.coins++;
	
	if irandom(2) != 2 {
		audio_play_sound(snd_coin, 10, false);
	}
}

draw_sprite(sprite_index, 0, gui_x, gui_y);