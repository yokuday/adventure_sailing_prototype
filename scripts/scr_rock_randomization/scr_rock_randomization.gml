// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_rock_randomization(){
	rock_pos_cycle = room_width-100;
	for(i=0; i<room_width-100; i++) {
		rock_pos[i] = i+50;
	}	
	r = array_length_1d(rock_pos) - 1;
	for(var i = 0; i < r; i += 1) {
	    j = irandom_range(i,r);
	    temp = rock_pos[i];
	    rock_pos[i] = rock_pos[j];
	    rock_pos[j] = temp;
	}
}