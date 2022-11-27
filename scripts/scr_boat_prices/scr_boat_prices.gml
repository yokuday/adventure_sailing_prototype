function scr_boat_prices() {
	if argument_count > 0 {
		count = argument[0];	
	}

	if argument_count = 2 {
		boat_name = global.boats_list[count-1];
	}else{
		boat_name = obj_boat.river_boats[string_char_at(obj_boat.boats_shop, count)-1];
	}

	boat_value = 1 //"Error";

	boat_colorf = c_white;
	boat_colorb = c_white;

	boat_rn = "Error"

	boat_info = "Error, the message for this ship has not been set!!!";

	boat_rarity = "Error";

	boat_biome = "river";

	//////////////////////////////////////////////////////////////
#region pirateship 
	if boat_name = spr_pirateship {
		boat_value = round((1000*(obj_boat.fish_price/15))/10)*10;
	
		boat_colorf = make_color_hsv(0, 128, 128); // brown
		boat_colorb = c_yellow; //yellow
	
		boat_rn = "Pirate Ship";
	
		boat_info = "The greedy pirates who built this ship, made it so chests would spawn 20% more often";
	
		boat_rarity = "common"
	}
#endregion
	//////////////////////////////////////////////////////////////
#region motorboat
	if boat_name = spr_motorboat {
		boat_value = round((500*(obj_boat.fish_price/15))/10)*10;
	
		boat_colorf = make_color_hsv(128, 150, 150); // blue
		boat_colorb = make_color_hsv(128, 200, 200); // lighter blue
	
		boat_rn = "Speedster";
	
		boat_info = "This boat has an engine, which increases the speed of the boat by 25% at all times!";
	
		boat_rarity = "rare"
	}
#endregion
	//////////////////////////////////////////////////////////////
#region canoe
	if boat_name = spr_canoo {
		boat_value = round((1500*(obj_boat.fish_price/15))/10)*10;
	
		boat_colorf = make_color_hsv(49, 112, 85); // dark greenish
		boat_colorb = make_color_hsv(49, 180, 180); // yellow
	
		boat_rn = "Canoe"
	
		boat_info = "The special powers inside this canoe automatically sells all new fish u get!"
	
		boat_rarity = "special"
	}
#endregion
	//////////////////////////////////////////////////////////////
#region yacht
	if boat_name = spr_yacht {
	
		boat_value = round((4000*(obj_boat.fish_price/15))/10)*10;
	
		boat_colorf = c_yellow // yellow
		boat_colorb = c_white // white
	
		boat_rn = "Fancy yacht"
	
		boat_info = "with this special yacht you will get DOUBLE fishes and coins, but there is a 10% chance you will explode on impact."
	
		boat_rarity = "special"
	}
#endregion
	//////////////////////////////////////////////////////////////
#region vikingship
	/*
	if boat_name = spr_vikingship {
		boat_value = round((2000*(obj_boat.fish_price/15))/10)*10;
	
		boat_colorf = make_color_hsv(0, 128, 64); // brown
		boat_colorb = make_color_hsv(0, 128, 128); // lighter brown
	
		boat_rn = "Viking ship"
	
		boat_info = "Atlast a VIKING ship! Did u know that this ship can take 1 extra hit before exploding?"
	}
	*/
#endregion
	//////////////////////////////////////////////////////////////
#region regularboat
	if boat_name = spr_boat {
		boat_value = round((0*(obj_boat.fish_price/15))/10)*10;
	
		boat_colorf = make_color_hsv(0, 128, 128); // brown
		boat_colorb = make_color_hsv(0, 128, 200); // lighter brown
	
		boat_rn = "Boat";
	
		boat_info = "This boat was built in an unknown location, so the powers of this boat are unknown...";
	
		boat_rarity = "common";
	}
#endregion
	//////////////////////////////////////////////////////////////
#region surfboard
	if boat_name = spr_surfboard {
		boat_value = round((250*(obj_boat.fish_price/15))/10)*10;
	
		boat_colorf = c_aqua // brown
		boat_colorb = c_orange // lighter brown
	
		boat_rn = "Surfboard";
	
		boat_info = "the Bros who built this surfboard made it tiny";
	
		boat_rarity = "common"
	}
#endregion
	//////////////////////////////////////////////////////////////
#region

#endregion
	//////////////////////////////////////////////////////////////
#region

#endregion
	//////////////////////////////////////////////////////////////
#region

#endregion
	//////////////////////////////////////////////////////////////


	if boat_rarity = "common" {
		boat_color = make_color_hsv(0, 0, 200);
	}

	if boat_rarity = "rare" {
		boat_color = make_color_hsv(25, 220, 220);
	}

	if boat_rarity = "special" {
		boat_color = make_color_hsv(obj_shop.boat_angle*0.708, 200, 200);
	}


}
