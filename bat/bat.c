#include <stdlib.h>
#include <stdio.h>
#include <dirent.h>
#include <errno.h>


// charging and status color still to be added

int main(){

	FILE *path_bat_perc;
	char bat_perc[10];
	DIR* directory;

	// see if directory exists
	directory = opendir("/sys/class/power_supply/BAT0");
	if (directory){

		path_bat_perc = popen("cat '/sys/class/power_supply/BAT0/capacity'", "r");

	// copy bash script content to string variable
		fgets(bat_perc, 10, path_bat_perc);

		fclose(path_bat_perc);

		int bat_perc_now;
		char* endptr1;

	// convert string variable to int
		bat_perc_now = strtod(bat_perc, &endptr1);

		printf(" %2d ", bat_perc_now);
		
	}
	// if not it means plugged
	else if (ENOENT == errno){
		printf(" ");
	}

	return 0;
}


