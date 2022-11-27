dir = irandom_range(200, 340);

spd = random_range(0.01, 0.2);

image_xscale = 5;
image_yscale = 5;

image_alpha = 0;

//image_angle = irandom_range(0, 360);

alarm[0] = 1;

depth = -2;

if global.biome = "space" {
	hue = 50;
	sat = irandom_range(230, 255);
	value = irandom_range(230, 255);
	
	image_blend = make_color_hsv(hue, sat, value);
}

if global.biome = "river" {
	hue = 0;
	sat = 0
	value = irandom_range(240, 255);
}