surface_resize(application_surface, 960, 1920);

depth = -30;

image_angle = 0;

self.x = 330;
self.y = 820;
old_y = y;

randomize();

//spd
spd = 5;

nspd = (spd/(1+(abs(image_angle)/45)));
lspd = ((spd-nspd)*1.25)*(-sign(image_angle));

global.lose = true;

lose = false;

scr_list();

rounds = 0;

nspd = spd;

preset_length = irandom_range(2000, 10000);
random_length = 0;

scr_rock_randomization()

for(i=0; i<room_height/48; i++) {
	for(ii=0; ii<2; ii++) {
		sprite[i, ii] = irandom_range(0, 3);
		
		xx[i, ii] = 24+(ii*528);
		yy[i, ii] = i*48;
		
		if ii = 0 {
			rot[i, ii] = 0;	
		}else{
			rot[i, ii] = 180;
		}
	}
}

value=0;

f_image = 0;

display_set_gui_size(3200, 6400)

if !instance_exists(obj_boatreal) {
	instance_create_depth(x, y, -1, obj_boatreal);	
}

if !instance_exists(obj_wind) {
	//instance_create_depth(0, 0, -1, obj_wind);	
}

game_set_speed(60, gamespeed_fps)

//the coins
global.coins = 100;
coins = global.coins;

//the fishes
global.fishes = 100;
fishes = global.fishes;

ini_open("savedata.ini");
if ini_key_exists("numbers", "coins") {
	global.coins = ini_read_real("numbers", "coins", 0);	
}
if ini_key_exists("numbers", "fishes") {
	global.fishes = ini_read_real("numbers", "fishes", 0);	
}

//global.fishes = 1000;

for(i=0; i<200; i++) {
	scale[i] = 0;
	
	finger[i] = (i/100)-1;
	finger_x[i] = 330+sin(finger[i])*120;
}	

//the trick point system.
trick_point = 0;

trick_old = trick_point

//the city
city_y = -150;

//the boats list
river_boats = [spr_pirateship, spr_motorboat, spr_canoo, spr_surfboard];

if ini_key_exists("numbers", "fish_price") {

	house_number = ini_read_real("numbers", "house_number", 0);	

	house_hue = ini_read_real("numbers", "house_hue", 0);

	fish_price = ini_read_real("numbers", "fish_price", 0);

	times = 700/house_number;

	for(i=0; i<house_number; i++) {
		for(ii=0; ii<2; ii++) {
			house_sprite[ii, i] = ini_read_real("numbers", "house_sprite"+string(i+(ii*100)), 0);	
		
			house_xx[ii, i] = ini_read_real("numbers", "house_xx"+string(i+(ii*100)), 0);	
			house_yy[ii, i] = ini_read_real("numbers", "house_yy"+string(i+(ii*100)), 0);	
		
			house_color[ii, i] = ini_read_real("numbers", "house_color"+string(i+(ii*100)), 0);	
		}
	}
}else{
	fish_price = irandom_range(15, 30);
	ini_write_real("numbers", "fish_price", fish_price);
	
	scr_boat_mixup();
	ini_write_string("numbers", "boats_shop", boats_shop);
	
	house_number = irandom_range(4, 6);
	ini_write_real("numbers", "house_number", house_number);

	house_hue = irandom_range(0, 13);
	ini_write_real("numbers", "house_hue", house_hue);
						
	fish_price = irandom_range(15, 30);
	ini_write_real("numbers", "fish_price", fish_price);
						
	scr_boat_mixup();
	ini_write_string("numbers", "boats_shop", boats_shop);

	times = 700/house_number;
						
	house_cwhite = 0;
						
	if(irandom(14) = 1) {
		house_cwhite = 1;
	}
						
	for(i=0; i<house_number; i++) {
		for(ii=0; ii<2; ii++) {
			house_sprite[ii, i] = choose(0, 2, 4, 6);
			ini_write_real("numbers", "house_sprite"+string(i+(ii*100)), house_sprite[ii, i]);
		
			house_xx[ii, i] = irandom_range(0, 60)+(ii*520);
			ini_write_real("numbers", "house_xx"+string(i+(ii*100)), house_xx[ii, i]);
			house_yy[ii, i] = i*times;
			ini_write_real("numbers", "house_yy"+string(i+(ii*100)), house_yy[ii, i]);
								
			if house_cwhite = 1 {
				house_color[ii, i] = make_color_hsv(house_hue*20, 0, irandom_range(150, 255));	
			}else{
				house_color[ii, i] = make_color_hsv(house_hue*20, irandom_range(150, 255), irandom_range(150, 255));
			}
			ini_write_real("numbers", "house_color"+string(i+(ii*100)), house_color[ii, i]);
		}
	}
}

house_now = 0;


//the boats

if ini_key_exists("numbers", "fish_price") {
	boats_shop = ini_read_string("numbers", "boats_shop", 0);
}else{
	scr_boat_mixup();
}

//all the boats the player has
global.boats_list[0] = sprite_index;

global.count = ini_read_real("boats", "boat_count", 0);

sprite_index = ini_read_string("boats", "boat_active", sprite_index);

obj_shop.equip = 1;

for(i=0; i<global.count; i++) {
	global.boats_list[i+1] = ini_read_string("boats", "boat"+string(i+1), 0);	
	
	if ini_read_string("boats", "boat_active", 0) = global.boats_list[i+1] {
		obj_shop.equip = i+2;	
	}
}

//the biome
global.biome = ini_read_string("numbers", "biome", "river");

ini_close();

//space bubble
bubble_xscale = 1;
bubble_yscale = 1;

variable_pi = 0;