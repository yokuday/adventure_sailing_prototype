collision = false;

for(i=0; i<obj_boat.spd*2; i++) {
	if place_meeting(x, y+i, obj_boat) {
		collision = true;
		break;
	}
}	

y = obj_boat.city_y+200;