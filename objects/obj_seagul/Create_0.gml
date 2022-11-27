dir = irandom_range(0, 1);

image_xscale = 3;
image_yscale = 3;

if dir = 0 {
	image_xscale = -3;
	x = -15;	
}

if dir = 1 {
	x = room_width+15;	
}

depth = -2000;

spd = irandom_range(1, 6);

if global.biome = "space" {
	sprite_index = spr_spc_seagull	
}