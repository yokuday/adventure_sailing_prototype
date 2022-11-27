function scr_name_gen() {
	city_name = "";

	rng = irandom_range(2, 8);

	if rng > 5 {
		rng = 4;	
	}else{
		if rng > 2 {
			rng = 3;	
		}else{
			rng = 2;	
		}
	}

	verbs1 = [
		"Le",
		"Bon",
		"ka",
		"Ar",
		"Gol",
		"Ga",
		"Vil",
		"New",
		"Ob",
		"Par",
		"Re",
		"Am",
		"Az",
		"We",
	]

	mid1 = [
		"Ha",
		"ze",
		"bi",
		"ke",
		"xe",
		"ji"
	]

	end1 = [
		"ni",
		"nay",
		"la",
		"din",
		"si",
		"lan",
		"zin",
		"ga",
		"wa",
		"sa",
		"k",
		"r",
		"y",
		"a"
	]

	if rng = 2 {
		city_name+=verbs1[irandom_range(0, array_length_1d(verbs1)-1)];
		city_name+=end1[irandom_range(0, array_length_1d(end1)-1)];
	}

	if rng = 3 {
		city_name+=verbs1[irandom_range(0, array_length_1d(verbs1)-1)];
		city_name+=mid1[irandom_range(0, array_length_1d(mid1)-1)];
		city_name+=end1[irandom_range(0, array_length_1d(end1)-1)];	
	}

	if rng = 4 {
		city_name+=verbs1[irandom_range(0, array_length_1d(verbs1)-1)];
		city_name+=mid1[irandom_range(0, array_length_1d(mid1)-1)];
		city_name+=mid1[irandom_range(0, array_length_1d(mid1)-1)];
		city_name+=end1[irandom_range(0, array_length_1d(end1)-1)];		
	}

	show_debug_message(city_name);


}
