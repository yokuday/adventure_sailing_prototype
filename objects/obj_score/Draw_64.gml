//the city meter
//boat_name = global.boats_list[equip_info-1];
scr_boat_prices(obj_shop.equip, 0);

draw_set_alpha(-obj_shop.transition+1);

//draw_set_color(c_black);
//draw_rectangle(2980, 1780, 3120, 5020, false);

draw_set_color(boat_colorf);
draw_rectangle(3000, 1800, 3100, 5000, false);

draw_set_color(boat_colorb);
draw_rectangle(3000, 5000-(3200*(city_points/city_score)), 3100, 5000, false);

for(i=0; i<sprite_get_number(obj_boat.sprite_index); i++) {
	draw_sprite_ext(obj_boat.sprite_index, i, 3050, 5100-(i*24)-(3200*(city_points/city_score)), 6, 6, 0, c_white, -obj_shop.transition+1); 	
}

draw_set_color(c_white);
//the city name


//the black background
if obj_boat.lose = true {
	if (obj_boat.alarm[1] < 0 || obj_boat.alarm[1] > 40) {
		draw_set_alpha(0.35);
		draw_set_color(c_black);
	
		draw_rectangle(0, 0, 3200, 6400, false);
	
		draw_set_color(c_white);
		draw_set_alpha(1);
	}
}

draw_set_color(c_white);

if global.lose = false {
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	
	//points
	if points < 999 {
		draw_set_color(c_black);
		draw_text_ext_transformed(1725, 1100, points, 1, 5000, 10, 10, 0);
	
		//draw_set_color(make_color_hsv(0, 0, 200));
		draw_set_color(c_white);
		draw_text_ext_transformed(1700, 1100, points, 1, 5000, 10, 10, 0);
	}else{
		draw_set_color(c_black);
		draw_text_ext_transformed(1725, 1100, points, 1, 5000, 10-(string_length(string(points))/1.6), 10-(string_length(string(points))/1.6), 0);
	
		//draw_set_color(make_color_hsv(0, 0, 200));
		draw_set_color(c_white);
		draw_text_ext_transformed(1700, 1100, points, 1, 5000, 10-(string_length(string(points))/1.6), 10-(string_length(string(points))/1.6), 0);	
	}
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);
	
	if obj_boat.lose = true {
		if high_score < 1000 {
			draw_set_color(c_black);
			draw_text_ext_transformed(110, -20, "Best:" + string(high_score), 1, 5000, 5, 5, 0);	
		
			draw_set_color(c_white);
			draw_text_ext_transformed(100, -30, "Best:" + string(high_score), 1, 5000, 5, 5, 0);	
		}else{
			draw_set_color(c_black);
			draw_text_ext_transformed(110, -20+(string_length(string(high_score))*20), "Best:" + string(high_score), 1, 5000, 5-(string_length(string(high_score))/5), 5-(string_length(string(high_score))/5), 0);	
		
			draw_set_color(c_white);
			draw_text_ext_transformed(100, -30+(string_length(string(high_score))*20), "Best:" + string(high_score), 1, 5000, 5-(string_length(string(high_score))/5), 5-(string_length(string(high_score))/5), 0);		
		}
	}
}

draw_set_alpha(-obj_shop.transition+obj_shop.fade);
draw_set_halign(fa_left);
if high_score < 1000 {
	draw_set_color(c_black);
	draw_text_ext_transformed(110, -20, "Best:" + string(high_score), 1, 5000, 5, 5, 0);	
		
	draw_set_color(c_white);
	draw_text_ext_transformed(100, -30, "Best:" + string(high_score), 1, 5000, 5, 5, 0);	
}else{
	draw_set_color(c_black);
	draw_text_ext_transformed(110, -20+(string_length(string(high_score))*20), "Best:" + string(high_score), 1, 5000, 5-(string_length(string(high_score))/5), 5-(string_length(string(high_score))/5), 0);	
		
	draw_set_color(c_white);
	draw_text_ext_transformed(100, -30+(string_length(string(high_score))*20), "Best:" + string(high_score), 1, 5000, 5-(string_length(string(high_score))/5), 5-(string_length(string(high_score))/5), 0);		
}	

draw_set_valign(fa_middle);
draw_set_halign(fa_left);

draw_set_alpha(1);

draw_set_color(c_white);

//coins
if global.coins < 1000 {
	draw_set_color(make_color_hsv(40, 83, 170));
	draw_rectangle(2400, 150, 3300, 450, false);
	
	draw_set_color(c_black);
	draw_rectangle_width(2400, 150, 3300, 450, 20);
	
	draw_set_color(c_white);
	draw_text_ext_transformed(2620, 70, global.coins, 1, 1000, 4, 4, 0);

	draw_sprite_ext(spr_coin, 0, 2400, 300, 20, 20, 0, c_white, 1);
}else{
	draw_set_color(make_color_hsv(40, 83, 170));
	draw_rectangle(2400-((string_length(string(global.coins))-3)*193), 150, 3300, 450, false);
	
	draw_set_color(c_black);
	draw_rectangle_width(2400-((string_length(string(global.coins))-3)*193), 150, 3300, 450, 20);
	
	draw_set_color(c_white);
	draw_text_ext_transformed(2620-((string_length(string(global.coins))-3)*193), 70, global.coins, 1, 1000, 4, 4, 0);

	draw_sprite_ext(spr_coin, 0, 2400-((string_length(string(global.coins))-3)*193), 300, 20, 20, 0, c_white, 1);	
}

//fishes
if global.fishes < 1000 {
	draw_set_color(make_color_hsv(40, 83, 170));
	draw_rectangle(2400, 510, 3300, 810, false);
	
	draw_set_color(c_black);
	draw_rectangle_width(2400, 510, 3300, 810, 20);
	
	draw_set_color(c_white);
	draw_text_ext_transformed(2620, 430, global.fishes, 1, 1000, 4, 4, 0);

	draw_sprite_ext(spr_fish, 0, 2400, 660, 20, 20, 0, c_white, 1);
}else{
	draw_set_color(make_color_hsv(40, 83, 170));
	draw_rectangle(2400-((string_length(string(global.fishes))-3)*193), 510, 3300, 810, false);
	
	draw_set_color(c_black);
	draw_rectangle_width(2400-((string_length(string(global.fishes))-3)*193), 510, 3300, 810, 20);
	
	draw_set_color(c_white);
	draw_text_ext_transformed(2620-((string_length(string(global.fishes))-3)*193), 430, global.fishes, 1, 1000, 4, 4, 0);

	draw_sprite_ext(spr_fish, 0, 2400-((string_length(string(global.fishes))-3)*193), 660, 20, 20, 0, c_white, 1);	
}

draw_set_halign(fa_center);

if city = true {
	if city_start = false {
		if !instance_exists(obj_object) {	
			if global.lose == false {
				if rope_transition < pi {
			
					rope_transition+=0.02;
			
		
					draw_sprite_ext(spr_rope, 0, 1600, sin(rope_transition)*2000-300, 15, 15, 0, c_white, 1);
					draw_text_ext_transformed(1600, sin(rope_transition)*2000-500, city_name, 1, 5000, 4, 4, 0);
				}
			}
		}
	}
}

if obj_shop.alarm[2] > 0 {
	draw_set_circle_precision(8)
	draw_set_color(c_lime);
	if obj_shop.alarm[1] > 0 {
		draw_sprite_ext(spr_particle, 0, 0, 0, 3200, 6400, 0, c_black, (40-obj_shop.alarm[1])/40);	
	}else{
		draw_sprite_ext(spr_particle, 0, 0, 0, 3200, 6400, 0, c_black, (obj_shop.alarm[2])/40);
	}
	draw_set_color(c_white);
}	