if obj_boat.lose = true {
	if points > 0 {
		if high_score < points {
			high_score = points;
			
			ini_open("savedata.ini");
			
			ini_write_real("numbers", "high_score", high_score);
			
			ini_close();
		}
	}
	
	depth = -10;
}else{
	depth = -9001;	
}

if global.lose = true {
	points = 0;	
}else{
	if points != points_old {
		city_points+=points-points_old;
		
		ini_open("savedata.ini");
		ini_write_real("numbers", "city_points", city_points);
		ini_close();
		
		if city_points > city_score {
			city_points = city_score;	
		}
	}
	
	if city_points = city_score {
		if city_old = false {
			city = true;
			
			rope_transition = 0;
			scr_name_gen();
			
			ini_open("savedata.ini");
			if !ini_key_exists("numbers", "city") {
				ini_write_real("numbers", "city", 1);
				city_done = 1;
			}
			ini_close();
		}
	}
}

if city_done = 1 {
	if global.lose = true {
		if city_start = false {
			city_start = true;	
			city_yy = 1100;
		}
	}
}

if global.lose = false {
	if city_start = true {
		if city_yy > room_height+300 {
			city_start = false;	
		}
	}
}

if city = true {
	city_old = true;	
}else{
	if city_old = true {
		city_old = false;
	}
}

points_old = points;