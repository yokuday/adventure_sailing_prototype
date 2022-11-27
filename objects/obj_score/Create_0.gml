high_score = 0;
points = 0; // score;
points_old = 0;
city_done = 0;

ini_open("savedata.ini");

if ini_key_exists("numbers", "high_score") {
	high_score = ini_read_real("numbers", "high_score", 0);
}
if ini_key_exists("numbers", "city") {
	city_done = ini_read_real("numbers", "city", 0);
}

depth = -9001;

if !ini_key_exists("numbers", "city_score") {
	city_score = irandom_range(200, 300);
	
	city_points = 0;
	
	ini_write_real("numbers", "city_score", city_score);
	ini_write_real("numbers", "city_points", city_points);
}else{
	city_score = ini_read_real("numbers", "city_score", 0);
	city_points = ini_read_real("numbers", "city_points", 0);
}

city = false;

city_old = false;

city_name = "";

rope_transition = 0;

city_start = false;
city_yy = 1100;

ini_close();

scr_name_gen();