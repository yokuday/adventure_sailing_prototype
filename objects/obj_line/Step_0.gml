speed = spd*1.5;
direction = dir;

if image_alpha < 0 {
	instance_destroy(self);	
}

if place_meeting(x, y, obj_object) {
	instance_destroy(self);	
}

image_alpha-=(0.015*spd);

image_yscale = image_xscale;

image_angle+=((xscale));

if global.lose = true {
	instance_destroy(self);	
}

if point_distance(x, y, obj_boat.x, obj_boat.y) > 270 {
	instance_destroy(self);	
}