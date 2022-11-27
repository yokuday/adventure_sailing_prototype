
if ready = 1 {
	test = 0;
	
	for(i=0; i<effects_table[2]; i++) {
		effect_x[i] += lengthdir_x(effect_angle[i], effect_spd[i]);
		effect_y[i] += lengthdir_y(effect_angle[i], effect_spd[i]);
		
		effect_alpha[i] -= effect_spd[i]/25;
		effect_angle[i] += effect_anglespd[i];
		
		if effect_huechange[i] < effect_hue[i] {
			effect_hue[i]-=effect_huespd[i];	
		}
		
		effect_color[i] = make_color_hsv(effect_hue[i], effect_sat[i], effect_value[i]);
		
		if effect_alpha[i] > 0 {
			test = 1;
			draw_sprite_ext(spr_particle, 0, effect_x[i], effect_y[i], effect_scale[i], effect_scale[i], 0, effect_color[i], effect_alpha[i]);
		}
	}
	if test = 0 {
		instance_destroy(self);	
	}
}