if points_old != floor(obj_score.points/100) {
	if global.lose = false {
		alarm[0] = 50;	
	}
}

if alarm[0] = 50 {
	if wind_go = 1 {
		
	}else{
		for(i=0; i<100; i++) {
			windspd[i] = obj_boat.spd+random_range(10, 16);
			
			windx[i] = irandom_range(0, room_width);
			windy[i] = irandom_range(obj_boat.y+160, obj_boat.y+1000);
			
			wind_go = 1;
		
			windlength[i] = irandom_range(5, 80);
			
			windalpha[i] = windlength[i]/50;
		}	
	}
}

if wind_go = 1 {
	if alarm[0] < 0 {
		test = 0;
		for(i=0; i<100; i++) {
			if windy[i]-windlength[i] > obj_boatreal.y-500 {
				test = 1;
				windy[i] -= windspd[i];
			}
		}
	
		if test = 0 {
			wind_go = 0;
		}
	}else{
		for(i=0; i<100; i++) {
			windy[i] -=	windspd[i]+random_range(1, 4);
			
			if (windy[i]-windlength[i] < obj_boatreal.y-500) {
				windspd[i] = obj_boat.spd+random_range(10, 16);
				
				windx[i] = irandom_range(0, room_width);
				windy[i] = irandom_range(obj_boat.y+160, obj_boat.y+1000);
		
				wind_go = 1;
			
				windlength[i] = irandom_range(5, 80);
			
				windalpha[i] = windlength[i]/50;	
			}
		}
	}
}

points_old = floor(obj_score.points/100);