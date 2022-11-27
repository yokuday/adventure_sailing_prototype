#region chest
if other.name = "chest" {
	///////////////////////////////
	audio_play_sound(snd_chest, 10, false);
	
	coins = irandom_range(5, 10);

	if sprite_index = spr_pirateship {
		coins = round(coins*1.2);	
	}
	
	if sprite_index = spr_yacht {
		coins = coins*2;
		
		if irandom(9) = 0 {
			scr_boat_explode();	
		}
	}

	for(i=0; i<coins; i++) {
		instance_create_depth(other.x, other.y, -1, obj_coin);	
	}	
	//////////////////////////////
}
#endregion

#region fishes
if other.name = "fishes" {
	///////////////////////////////
	audio_play_sound(snd_chest, 10, false);
	
	fishes = irandom_range(1, 3);
	
	if sprite_index = spr_yacht {
		fishes = fishes*2;
		
		if irandom(9) = 0 {
			scr_boat_explode();	
		}
	}
	
	if sprite_index != spr_canoo {
		for(i=0; i<fishes; i++) {
			instance_create_depth(other.x, other.y, -1, obj_fish);	
		}	
	}else{
		for(i=0; i<fishes*fish_price; i++) {
			instance_create_depth(other.x, other.y, -1, obj_coin);	
		}		
	}
	//////////////////////////////
}
#endregion

#region stones
if other.name = "stone" {
	//////////////////////////////
	scr_boat_explode();
	//////////////////////////////
}
#endregion

#region buoys
if other.name = "plank" {
	//////////////////////////////
	scr_boat_explode();
	//////////////////////////////
}
#endregion