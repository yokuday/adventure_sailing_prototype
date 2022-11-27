function scr_boat_mixup() {
	nnm = string(irandom_range(1, array_length_1d(river_boats)));
	
	boats_shop = "";
	
	boats_shop += nnm;
	
	for(i=0; i<3; i++) {
		nnm = string(irandom_range(1, array_length_1d(river_boats)));
		
		while(string_count(nnm, boats_shop) != 0) {
			nnm = string(irandom_range(1, array_length_1d(river_boats)));	
		}
		
		boats_shop+=nnm;
	}

	show_debug_message(boats_shop);


}
