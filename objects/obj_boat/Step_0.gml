if global.lose = false {
	if lose = false {
		
		if city_y < 0 {
			spd = 5+(floor(obj_score.points/100)/7/*5*/);
			
			if sprite_index = spr_motorboat {
				spd = spd*1.1;	
			}
		}else{
			if spd-(spd/20) > 3 {
				spd-=spd/20;	
			}else {
				spd = 3;
			}	
		}
		
		if spd > 35 {
			spd = 35;	
		}
		
		//city building
		#region city
		if obj_score.city = true {
			if !instance_exists(obj_object) {
				if obj_score.city_start = false {
					if house_now = 0 {
						house_now = 1;
						
						with(obj_score) {
							city_score = irandom_range(200, 300);

							city_points = 0;
		
							ini_open("savedata.ini");
							ini_write_real("numbers", "city_score", city_score);
							ini_write_real("numbers", "city_points", city_points);
							ini_close();	
						}
						
						ini_open("savedata.ini");
						
						city_y = -150;
			
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
						
						ini_close();
						
						instance_create_depth(0, 0, -1, obj_stopdock);
					}
				}
			}
		}
		#endregion
		
		nspd = spd;

		//boat rotation
		if mouse_check_button(mb_left) {	
			iimage_angle = -(mouse_x-self.x)/4;
			
			if image_angle > iimage_angle {
				image_angle-=4;	
			}else{
				if image_angle < iimage_angle {
					image_angle+=4;	
				}
			}
			
			if abs(iimage_angle-image_angle) <= 4 {
				image_angle=iimage_angle;	
			}
		}else{
			if image_angle > 1 {
				image_angle-=1;	
			}else{
				if image_angle < -1 {
					image_angle+=1;	
				}else{
					image_angle = 0;	
				}
			}
		}
		
		if obj_score.city_start = false {
			if city_y > room_height+300 {
				city_y = -150;	
				obj_score.city = false;
				house_now = 0;
				
				if instance_exists(obj_stopdock) {
					instance_destroy(obj_stopdock);	
				}
			}
		}
		if obj_shop.transition != 0 then image_angle = 0;

		nspd = (spd/(1+(abs(image_angle)/45)));
		lspd = ((spd-nspd)*1.5)*(-sign(image_angle));
		
		image_angle = round(image_angle);
		
		#region // movement
		if (obj_score.city = false && obj_score.city_start = false) {
			y-=nspd;	
		}else{
			if !place_meeting(floor((x+lspd)*2)/2, y-spd, obj_stopdock) {
				if (x > 147 && x < room_width-150) {
					y-=nspd;	
				}else{	
					if !(y-nspd-1 > city_y-363 && y-nspd-1 < city_y+363) {
						y-=nspd;	
					}
				}
			}
		}
		
		if global.shop = 1 {
			image_angle = 0;	
		}
		
		if (obj_score.city = false && obj_score.city_start = false) {
			x+=lspd;
		}else{
			if !place_meeting(floor((x+(lspd*5))*2)/2, y+spd, obj_stopdock) {
				if (y > (city_y)-363 && y < (city_y)+363) {
					if (x+lspd+1 > 150 && x+lspd+1 < room_width-150) {
						x+=lspd;	
					}
				}else{
					x+=lspd;	
				}
			}
		}
		
		if x < 40 {
			x=40;
		}
		
		if x > room_width-40 {
			x=room_width-40;
		}
		#endregion
		
		#region // stuff that spawns
		if (obj_score.city == false && obj_score.city_start == false) {
			preset_length-=1; random_length-=1;
			random_length = 1
			if random_length > 0 {
				rounds++;

				if rounds > 40-(spd*2) {
					rounds = 0;
					scr_create_object(irandom_range(50, room_width-50), irandom_range(-440, -110),"stone", irandom_range(0, 4));
					
					if (irandom(4) == 1) {
						if global.biome = "river" {
							scr_create_object(irandom_range(48, room_width-48), irandom_range(-370, -40),"plank");	
						}
						if global.biome = "space" {
							//scr_create_object(irandom_range(48, room_width-48), irandom_range(-370, -40),"rocket");		
						}
					}
				}
		
				if (irandom(300) = 1) {
					scr_create_object(irandom_range(48, room_width-48), irandom_range(-370, -40),"chest");
				}

				if (irandom(1000) = 1) {
					scr_create_object(irandom_range(48, room_width-48), irandom_range(-370, -40),"fishes");
				}
			}else{
				if preset_length <= 0 {
					scr_pretset_maps()
				}
			}
			
			if (irandom(120) = 1) {
				instance_create_depth(0, irandom_range(-370, -40), -1, obj_seagul);
			}
			
			if (irandom(30) == 1) {
				instance_create_depth(0, irandom_range(-370, -40), -1, obj_pudle);	
			}
			
			if global.biome = "river" {
				if (irandom(10) = 1) {
					instance_create_depth(0, irandom_range(-370, -40), -1, obj_tree);
				}
			}
			if preset_length <= 0 {
					scr_pretset_maps()
			}
		}
		#endregion

		depth = (room_height-y)-room_height;

		x = floor(x*2)/2;
		y = floor(y*2)/2;
		
		//this makes all the stuff that needs to be teleported, teleported.
		#region yes
		if self.y-spd < 480 {
			y+=(320-spd);
			
			//city stuff
			if obj_score.city = false {
				obj_score.points++;
			}else{
				if !instance_exists(obj_object) {
					city_y+=(320-spd);	
				}
			}
			
			if obj_score.city_start = true {
				obj_score.city_yy+=(320-spd);		
			}
			
			//the wind
			with(obj_wind) {
				if wind_go = 1 {
					for(i=0; i<100; i++) {
						windy[i]+=(320-obj_boat.spd);	
					}
				}
			}
			
			//particles
			with(obj_object) {
				if current_frame == 3 {
					for(var k = 0; k<5; k++) {
						trash_y[k]+=(320-obj_boat.spd);
					}
				}
			}
			
			//general stuff
			for(i=0; i<array_length_1d(list); i++) {
				with(list[i]) {
					y+=320-obj_boat.spd;	
				}
			}
			
			with(obj_river) {
				for(i=0; i<old_spd*20; i++) {
					water_yy[i]+=320-obj_boat.spd;
				}
				for(i=0; i<20; i++) {
					bubble_yy[i]+=320-obj_boat.spd;
				}
				for(i=0; i<40; i++) {
					prop_y[i]+=320-obj_boat.spd;	
				}
			}
			
			if instance_exists(obj_effects) {
				with(obj_effects) {
					for(i=0; i<effects_table[2]; i++) {
						effect_y[i]+=320-obj_boat.spd;	
					}
				}
			}
			
			for(i=0; i<room_height/48; i++) {
				for(ii=0; ii<2; ii++) {
					yy[i, ii]+=320-spd;
					
					if yy[i, ii] > room_height {
						yy[i, ii]-=room_height;
						
						sprite[i, ii] = irandom_range(0, 3);
					}
				}
			}
			
			if instance_exists(obj_docks) {
				obj_docks.ready = 1;	
			}
			
			if instance_exists(obj_shop) {
				obj_shop.visready = 1;	
			}
		}
		#endregion

		obj_boatreal.x = x;
		obj_boatreal.y = y-160;

		camera_set_view_pos(view_camera[0],x,y+160);
		
		if y != old_y {
			for(i=0; i<5; i++) {
				inst = instance_create_depth(x-2.5-(image_angle/3), y-20, -8, obj_line);
				inst.xscale = spd;
			}
		}
		
		old_y = y;

		//instance_create_depth(irandom_range(0, room_width), room_height+64, 1, obj_river);

		//spd+=0.005;
		
	}
}else{
	view_xport[0] = 0; view_yport[0] = 0
	image_angle = 0;
	self.x = 325;
	self.y = 820+sin(value)*3;
	
	obj_boatreal.x = obj_boat.x;
	obj_boatreal.y = obj_boat.y-160;
	
	if !instance_exists(obj_docks) {
		instance_create_depth(304, 858, -1, obj_docks)	
	}
	if !instance_exists(obj_shop) {
		instance_create_depth(0, 0, -1, obj_shop)	
	}
	
	if mouse_check_button(mb_left) {	
		image_angle = 0;
	}
}

//trick system
trick_old = trick_point; // idk if i will ever use this

for(i=0; i < instance_number(obj_object); i += 1) {
	obj = instance_find(obj_object,i);
	
	if obj.name = "stone" {
		if point_distance(x, y, obj.x, obj.y) < 80 {
			obj.trick_point+= 0.01;
		}
	}
}

/* I dont know what happens here lel
if trick_point > 0 {
	if trick_point = trick_old {
		//obj_score.points += round(trick_point);
		trick_point = 0;
	}
}
*/

//coins

if global.coins != coins {
	ini_open("savedata.ini");

	ini_write_real("numbers", "coins", global.coins);

	ini_close();	
}

coins = global.coins;

//fishes

if global.fishes != fishes {
	ini_open("savedata.ini");

	ini_write_real("numbers", "fishes", global.fishes);

	ini_close();	
}

fishes = global.fishes;