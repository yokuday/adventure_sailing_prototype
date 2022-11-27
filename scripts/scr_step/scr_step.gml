function scr_step() {
	depth = (room_height-y)-room_height;

#region // stone
	if name = "stone" {
		///////////////////////////////////////////////
		if room_height+128 < y {
			instance_destroy(self);	
		}
	
		//Trick system
		/*
		if trick_point > 0.5 {
			trick_point_old = round(trick_point);
			show_debug_message(trick_point_old);
		}
		*/
		if obj_boat.lose == false {
			if round(trick_point_visual) != round(trick_point_old_visual) {
				audio_sound_pitch(snd_flip, 1+(round(trick_point_visual)/15));
				audio_play_sound(snd_flip, 5, false);
				trick_point_old_visual = trick_point_visual;
			}
			if round(trick_point) != round(trick_old) {
				trick_old = trick_point	
			}
		}
	
		if obj_boat.lose = false {
			if trick_point != trick_old {
				trick_point += (0.16*obj_boat.spd) - point_distance(x, y, obj_boat.x, obj_boat.y)/100;
				trick_point_visual += trick_point / 10
				alarm[1] = 50;
			}else{	
				obj_score.points+=round(trick_point);
				trick_point = 0;
				if noise == false{
					if (0 < alarm[1] < 45) && trick_point_visual >= 1{
						trick_triggered = true; text = scr_text();
						noise = true;
					}
				}
			}
		}
	
		if tr_old+0.1 < round(trick_point) {
			tr_old = round(trick_point);	
		}
	
		trick_old = trick_point;
	
		if global.biome = "space" {
			image_angle+=gg/2;
		
			if obj_boat.lose = false {
				x+=gox/4;
				y+=goy/4;
			}
		}
		/////////////////////////////////////////////
	}
#endregion

	if name = "plank" {
		/////////////////////////////////////////////
	#region // Buoy
		if y > room_height+32 {
			instance_destroy(self);	
		}
	
		if obj_boat.lose = false {
			if !place_meeting(x, y, obj_object) {
				if value = 1 {
					if x-spd > 48 {
						x-=spd;	
					}else{
						value = 0;	
					}
				}else{
					if x-spd < room_width-48 {
						x+=spd;	
					}else{
						value = 1;	
					}
				}
			}
	
			if place_meeting(x+spd, y, obj_object) {
				value = 1;
				x-=spd;
			}
	
			if place_meeting(x-spd, y, obj_object) {
				value = 0;
				x+=spd;
			}
		}
	
		x = round(x*2)/2;
	
		vari+=0.04;
	
		if vari > pi*2 {
			vari = 0;	
		}
	#endregion
		/////////////////////////////////////////////	
	}
	if name = "rocket" {
		/////////////////////////////////////////////
	#region // Rocket
		if alarm[1] < 0 {
			y+=mv*spd;	
		
			if mv = 1 {
				if y > room_height+25 {
					instance_destroy(self);	
				}
			}else{
				if y < -25 {
					instance_destroy(self);	
				}
			}
		}
		depth = -999;
	#endregion
		/////////////////////////////////////////////	
	}

	if name = "chest" {
		/////////////////////////////////////////////
		if y > room_height+32 {
			instance_destroy(self);	
		}
	
		if obj_boat.lose = false {
			if !place_meeting(x, y, obj_object) {
				y-=spd;
			}
		}

		//value+=0.1;/y+=sin(value)*2

		y = round(y*2)/2;

		image_angle+=rot
		/////////////////////////////////////////////	
	}

	if name = "fishes" {
		/////////////////////////////////////////////
		if y > room_height+32 {
			instance_destroy(self);	
		}

		image_angle = 0//image_angle+=rot*2;
		/////////////////////////////////////////////	
	}


}
