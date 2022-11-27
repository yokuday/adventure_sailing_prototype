function scr_create() {
	image_index = 0;

#region stone
	if name = "stone" {
		/////////////////////////////////////////////
		trick_point = 0;
		trick_old = trick_point;
		trick_point_old = 0;
		
		d3 = false
		
		noise = false; noise2 = false;
		
		trick_point_old_visual = 0
		trick_point_visual = 0
		trick_triggered = false;
	
		tr_old = trick_point
	
		tx = irandom_range(0, 100);
		ty = irandom_range(-50, 50);
		tangle = irandom_range(-15, 15);
	
		text = "";
		angle = irandom_range(-20, 20);
		
		if global.biome = "river" then sprite_index = spr_rock3;
		if global.biome = "space" {
			sprite_index = spr_rock2;
			gg = irandom_range(1, -1);
		
			goy = irandom_range(-1, 1);
			gox = irandom_range(-1, 1);
		}
	
		image_xscale = 4;
		image_yscale = 4;

		depth = -20;
		
		if d3 { image_angle = irandom_range(0, 360); }
		
		if current_frame == 3 { // trash
			for(var k = 0; k<5; k++) {
				trash_x[k] = x + irandom_range(-60, 60);
				trash_y[k] = y + irandom_range(-15, 30);
				
				trash_scale[k] = 0;
				trash_state[k] = 0;
				
				trash_start[k] = irandom_range(0, 50);
				
				trash_alpha[k] = 1;
			}
		}
		/////////////////////////////////////////////
	}
#endregion

#region buoy
	if name = "plank" {
		/////////////////////////////////////////////	
	
		sprite_index = spr_plank;
	
		image_xscale = 4;
		image_yscale = 4;

		depth = -20;
	
		image_angle = 90;
	
		spd = random_range(0.5, 1.5);
	
		value = choose(0, 1);
	
		vari = 0;
		/////////////////////////////////////////////
	}
#endregion

#region rocket
	if name = "rocket" {
		/////////////////////////////////////////////
		sprite_index = spr_rocket;

		x = irandom_range(obj_boatreal.x-160, obj_boatreal.x+160);
		y = choose(50, 590);
	
		xx = obj_boatreal.x-x;
	
		x = x-camera_get_view_x(view_camera[0]);
	
		image_xscale = 3;
		image_yscale = 3;
	
		spd = 14;

		if y = 50 {
			mv = 1;
			image_yscale = -3;	
		}else{
			mv = -1;
		}
	
		alarm[1] = 120;
		/////////////////////////////////////////////
	}
#endregion

	if name = "chest" {
		/////////////////////////////////////////////
		sprite_index = spr_chest
	
		spd=1;

		image_angle = irandom_range(0, 360)

		value = 0;

		image_xscale = 2;
		image_yscale = 2;

		rot = choose(-1, 1);
		/////////////////////////////////////////////
	}

	if name = "fishes" {
		/////////////////////////////////////////////
		sprite_index = spr_fishes;

		image_angle = irandom_range(0, 360)

		image_xscale = 2;
		image_yscale = 2;
	
		rot = choose(-1, 1);
		/////////////////////////////////////////////
	}

	if check_destroy {
		if place_meeting(x, y, obj_object) {
			instance_destroy(self);
		}
	}

	check = 1;


}
