//this fades the shop in and out
if (global.shop = 1 || inventory_old = 1) {
	if transition < 1 {
		transition+=0.05;	
	}
}else{	
	if transition > 0 {
		transition-=0.05;	
	}else{
		if inventory = 1 {
			inventory = 0;	
			yy = 0;
		}
	}
}

if ready = 0 && equip_info = -1 && biome_equip = "" {
	//mouse_yy = mouse_y;	
	if mouse_check_button_pressed(mb_left) {
		mouse_yy = mouse_y	
	}
	
	if mouse_check_button(mb_left) {
		var tmp = 0;
	//	if global.lose == false { tmp = 640 }
		yy+=(mouse_yy-tmp-mouse_y)*10;	
	}
}

if pressed_chongus > 0 { pressed_chongus -= 1 }

//this has to be removed upon release...
if keyboard_check_direct(ord("D")) {	
	obj_score.points+=10;
	
	global.fishes+=10;
	
	//scr_effects(obj_boat.x+irandom_range(-10, 10), obj_boat.y+irandom_range(-10, 10), 160, irandom_range(0, 360),	random_range(3, 6), 1, 40, irandom_range(220, 255), irandom_range(220, 255), 5, 0, 1, 1);
}

if global.lose = true {
	visready = 0;	
}

if visready = 1 {
	image_alpha = 0;	
}

if global.lose = true {
	fade = 1;	
}else{
	fade-=0.06;	
}