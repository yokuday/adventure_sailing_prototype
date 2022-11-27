function scr_text() {
	var texty = [
		choose("Way off", "Horrible"),
		choose("Bad", "Meh"),
		choose("Decent", "Moderate"),
		choose("Okey", "Medium"),
		choose("Good", "Nice"),
		choose("Awesome", "Amazing"),
		choose("Godly", "Fantastic"),
		choose("WOW", "WHAT?!?"),
		"Master!",
		choose("unbelievable!", "not possible!"),
		"too good",
	];

	if trick_point_visual-1 > array_length_1d(texty) {
		return "BOOM!!!"	
	}else{
		return texty[trick_point_visual-1];
	}


}
