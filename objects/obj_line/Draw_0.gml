if global.biome = "space" {
	if hue > 0 {
		hue-=1.5;
		//value-=1.1;
	}
}

image_blend = make_color_hsv(hue, sat, value);

draw_self();