var cl = camera_get_view_x(view_camera[0])
var ct = camera_get_view_y(view_camera[0])
       
var off_x = mouse_x - cl // x is the normal x position
var off_y = mouse_y - ct // y is the normal y position
       
// convert to gui
var off_x_percent = off_x / camera_get_view_width(view_camera[0])
var off_y_percent = off_y / camera_get_view_height(view_camera[0])
       
gui_x = off_x_percent * display_get_gui_width()
gui_y = off_y_percent * display_get_gui_height()

if global.biome = "river" {
	draw_set_color(make_color_hsv(71, 160, 170));
}
if global.biome = "space" {
	draw_set_color(c_black);	
}

draw_set_alpha(transition);
draw_rectangle(0, -400, 3200, 6800, false);

draw_set_color(c_white);

//draw_rectangle(370, 1400-yy, 570, 1600-yy, false);
//draw_rectangle(370, 1780-yy, 570, 1980-yy, false);
//draw_rectangle(370, 2160-yy, 570, 2360-yy, false);

//draw_rectangle(1050, 2400-yy, 2175, 2700-yy, false);

variable_pi+=0.02;

if variable_pi > pi*2 {
	variable_pi = 0;
}

if inventory = 0 {
	
	draw_sprite_ext(spr_fish_stand, 0, 1615, 2000-yy, 11, 11, 0, c_white, transition);
	
	if ready = 0 {

		if mouse_check_button(mb_left) {
			if point_in_rectangle(gui_x, gui_y, 340, 1370-yy, 600, 1630-yy) {
				draw_sprite_ext(spr_fish_stand, 4, 1615, 2000-yy, 11, 11, 0, c_white, transition);	
				fishes = 1;
			}
	
			if point_in_rectangle(gui_x, gui_y, 340, 1750-yy, 600, 2010-yy) {
				draw_sprite_ext(spr_fish_stand, 3, 1615, 2000-yy, 11, 11, 0, c_white, transition);
				fishes = 10;
			}
	
			if point_in_rectangle(gui_x, gui_y, 340, 2130-yy, 600, 2390-yy) {
				draw_sprite_ext(spr_fish_stand, 2, 1615, 2000-yy, 11, 11, 0, c_white, transition);
				fishes = global.fishes;
			}
		}

		if mouse_check_button_pressed(mb_left) {
			if point_in_rectangle(gui_x, gui_y, 1050, 2400-yy, 2175, 2700-yy) {
				if global.fishes >= fishes {
					global.fishes-=fishes;
					global.coins+=fishes*obj_boat.fish_price;
					draw_sprite_ext(spr_fish_stand, 1, 1615, 2000-yy, 11, 11, 0, c_white, transition);
			
					if global.fishes < fishes {
						fishes = 0;	
					}
				}
			}
		}
	}

	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);

	draw_set_color(c_black);

	if fishes < 100 {
		draw_text_transformed(1150, 1920-yy, fishes, 5, 5, 0);
	}else{
		draw_text_transformed(1150, 1920+(string_length(string(fishes))*3)-yy, fishes, 5/(string_length(string(fishes))/3), 5/(string_length(string(fishes))/3), 0);	
	}

	if fishes*obj_boat.fish_price < 999 {
		draw_text_transformed(2250, 1920-yy, fishes*obj_boat.fish_price, 5, 5, 0);	
	}else{
		draw_text_transformed(2250, 1920+(string_length(string(fishes*obj_boat.fish_price))*4)-yy, fishes*obj_boat.fish_price, 5/(string_length(string(fishes*obj_boat.fish_price))/4), 5/(string_length(string(fishes*obj_boat.fish_price))/4), 0);	
	}

	draw_text_transformed(1610, 1300-yy, obj_boat.fish_price, 5, 5, 0);

	//oh yeah (the shop);
	draw_set_color(c_black);
	draw_text_transformed(1620, 3420-yy, "Boats", 8+sin(variable_pi), 8+sin(variable_pi), sin(variable_pi)*10);

	draw_set_color(c_white);
	draw_text_transformed(1600, 3400-yy, "Boats", 8+sin(variable_pi), 8+sin(variable_pi), sin(variable_pi)*10);

	//and biome
	draw_set_color(c_black);
	draw_text_transformed(1620, 8680-yy, "Biomes", 8+sin(variable_pi+pi), 8+sin(variable_pi+pi), sin(variable_pi+pi)*10);

	draw_set_color(c_white);
	draw_text_transformed(1600, 8680-yy, "Biomes", 8+sin(variable_pi+pi), 8+sin(variable_pi+pi), sin(variable_pi+pi)*10);
	
	//the boats (that u can buy)
	scr_boat_buy(1, 100, 4000, 1550, 6000);
	scr_boat_buy(2, 1650, 4000, 3100, 6000);
	scr_boat_buy(3, 100, 6100, 1550, 8100);
	scr_boat_buy(4, 1650, 6100, 3100, 8100);
	
	//the biomes (finally)
	scr_biome_show("river", 100, 9500, 3100, 10500);
	//scr_biome_show("space", 100, 10600, 3100, 11600);

	//back button
	draw_set_color(c_white);
}else{
	ccn = 0;
	for(i=0; i<floor((global.count)/3)+1; i++) {
		for(ii=0; ii<3; ii++) {
			scr_boat_show();	
		}
	}
}

boat_angle-=0.5;

if boat_angle <= 0 {
	boat_angle = 360;
}	

if equip_info != -1 {
	scr_boat_equip_info();
}

if transition != 0 {
	if ready != 0 || biome_equip != "" {
		draw_set_alpha(transition/1.3);
	
		draw_set_color(c_black);
		draw_rectangle(200, 1000, 3000, 5400, false);	
	
		draw_set_alpha(transition/2);
	
		draw_rectangle(0, -200, 3200, 6600, false);	
	
		draw_set_alpha(transition);
	
		draw_set_color(c_white);
		draw_rectangle_width(200, 1000, 3000, 5400, 50);
	
		if ready != 0 {
			scr_boat_info();
		}
		if biome_equip != "" {
			scr_biome_info();	
		}
	}
}

//the back button
//draw_rectangle(200, 100-yy, 1100, 750-yy, false);
draw_set_color(make_color_hsv(40, 83, 170));
draw_rectangle(-100, 250, 650, 550, false);
	
draw_set_color(c_black);
draw_rectangle_width(-100, 250, 650, 550, 20);
	
draw_sprite_ext(spr_backbutton, 0, 650, 425, 20, 20, 0, c_white, transition);

if point_in_rectangle(gui_x, gui_y, 200, 100, 1100, 750) {
	if mouse_check_button(mb_left) {
		draw_sprite_ext(spr_backbutton, 1, 650, 425, 20, 20, 0, c_white, transition);
	}
		
	if mouse_check_button_pressed(mb_left) {
		if transition >= 1 {
			if (global.shop = 1 || inventory = 1) {
				global.shop = 0;
				inventory_old = 0;
				audio_stop_sound(snd_shop_music)
				audio_play_sound(snd_click, 5, false)
			}	
		}
	}
}

//the black boarder
draw_set_alpha(-transition+fade);

//brown bar thingy
draw_set_color(/*make_color_hsv(40, 83, 170)*/make_color_rgb(143, 86, 59));
draw_rectangle(-100, 5900, 600, 6200, false);

if instance_exists(obj_stopdock) {
	if (obj_stopdock.collision = true) then draw_set_alpha(-transition+1);
}
draw_rectangle(3000, 5900, 3700, 6200, false);
draw_set_alpha(-transition+fade);

draw_set_color(c_black);
draw_rectangle_width(-100, 5900, 600, 6200, 20);

if instance_exists(obj_stopdock) {
	if (obj_stopdock.collision = true) then draw_set_alpha(-transition+1);
}
draw_rectangle_width(3000, 5900, 3700, 6200, 20);
draw_set_alpha(-transition+fade);
	
//the buttons
draw_set_color(c_white);
//draw_rectangle(1900, 5800, 3000, 6300, false);

alphy = -transition+fade;
if instance_exists(obj_stopdock) {
	if (obj_stopdock.collision = true) then alphy = -transition+1;
}
draw_sprite_ext(spr_shop, 0, 2450, 6050, 18, 18, 0, c_white, alphy);
alphy = -transition+fade;

//draw_rectangle(200, 5800, 1300, 6300, false);
draw_sprite_ext(spr_ships, 0, 750, 6050, 18, 18, 0, c_white, -transition+fade);

if mouse_check_button(mb_left) {
	if point_in_rectangle(gui_x, gui_y, 1900, 5800, 3000, 6300) {
		if instance_exists(obj_stopdock) {
			if (obj_stopdock.collision = true) then alphy = -transition+1;
		}
		draw_sprite_ext(spr_shop, 1, 2450, 6050, 18, 18, 0, c_white, alphy);
		alphy = -transition+fade;
	}
	if point_in_rectangle(gui_x, gui_y, 200, 5800, 1300, 6300) {
		draw_sprite_ext(spr_ships, 1, 750, 6050, 18, 18, 0, c_white, -transition+fade);
	}
}

draw_set_alpha(1);



if obj_boat.alarm[1] > 0 {
	draw_set_circle_precision(16);
	draw_set_color(c_white);
	var c1 = 3; var c2 = 8
	if obj_boat.alarm[0] > 0 {
		for(var k = 0; k<c1; k++) {
			for(var j = 0; j<c2; j++) {
				draw_circle((3200 / (c1) * (k+1)) - (3200 / c1 / 2), (6400 / (c2) * (j+1)) - (6400 / c2 / 2), 1000 * (20-obj_boat.alarm[0])/20, false)		
			}
		}	
		//draw_sprite_ext(spr_particle, 0, 0, 0, 3200, 6400, 0, c_black, (20-alarm[0])/20);	
	}else{
		//draw_sprite_ext(spr_particle, 0, 0, 0, 3200, 6400, 0, c_black, (alarm[1])/40);
		for(var k = 0; k<c1; k++) {
			for(var j = 0; j<c2; j++) {
				draw_circle((3200 / (c1) * (k+1)) - (3200 / c1 / 2), (6400 / (c2) * (j+1)) - (6400 / c2 / 2), 1000 * ((obj_boat.alarm[1])/40), false)		
			}
		}			
	}
	draw_set_color(c_white);
}