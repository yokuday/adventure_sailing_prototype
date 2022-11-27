function scr_mobile_scaling() {
	// Set this to 1 when testing on computer, 0 for deployed device

	TestMode = 0;

	// When Test Mode is set to 1, these values will be used to set screen size

	// (Default Aspect ratio for Galaxy S5)

	var test_w = 1920;

	var test_h = 1080;

	if(TestMode = 0){

	// Again, When TestMode is set to 0, this script will 

	// capture the screen size and calculate the aspect ratio

	display_w = round(window_get_width());

	display_h = round(window_get_height());

	display_aspect_ratio = display_w/display_h;
	}

	else{

	// For test mode, use display values set at begigning of script

	display_w = test_w;

	display_h = test_h;

	display_aspect_ratio = display_h/display_w;
	}

	// Set the vertical view and ports to our new aspect ratio

	view_wview[0] = view_wview[0] / display_aspect_ratio;

	view_hport[0] = view_wview[0] / display_aspect_ratio;

	// Resize display GUI and set application surface to our new aspect ratio

	display_set_gui_size(3200, 6400);

	//surface_resize(application_surface, view_wview[0]*10, view_hport[0]*10);


}
