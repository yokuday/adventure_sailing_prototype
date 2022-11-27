function scr_create_object() {
	object = instance_create_depth(argument[0], argument[1], -100, obj_object);
	object.name = argument[2];
	
	if argument_count > 3 {	
		object.current_frame = argument[3]
	}
	if argument_count > 4 {
		object.check_destroy = argument[4]	
	}
	
	show_debug_message(argument[2]);


}
