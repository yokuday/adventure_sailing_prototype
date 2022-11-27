function scr_boat_explode() {
	if lose = false {
		spd = 5;
	
		lose = true;
		
		audio_stop_sound(snd_water1);
		audio_stop_sound(snd_water2);
		
		audio_stop_sound(snd_splash1);
		audio_stop_sound(snd_splash2);
		
		audio_play_sound(snd_explosion, 10, false)
		
		sprite_flush(all)
		
		inst2 = instance_create_depth(x, y, -1, obj_explosion)
		inst2.wait_boom = 0
		for(var k = 0; k<6; k++) {
			instance_create_depth(x+irandom_range(-60, 60), y+irandom_range(-60, 60), -1, obj_explosion)
		}
	}	


}
