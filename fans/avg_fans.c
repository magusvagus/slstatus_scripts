#include <stdio.h>
#include <stdlib.h>

// NOTE: we can make this even faster getting rid of most of the bash
// script, and doing the "tail", "grep", "awk" and "head" in C99

int main() {
	FILE *path_fan1;
	FILE *path_fan2;
	char fan1[20];
	char fan2[20];

	path_fan1 = popen("sensors | grep -i fan | head -n 1 | awk '{print $2}'", "r");
	path_fan2 = popen("sensors | grep -i fan | tail -n 1 | awk '{print $2}'", "r");

	// copy bash script content to string variable
	fgets(fan1, 20, path_fan1);
	fgets(fan2, 20, path_fan2);

	fclose(path_fan1);
	fclose(path_fan2);


	char* endptr1;
	char* endptr2;

	double avg_RPM;
	
	double RPM1;
	double RPM2;
	
	// convert string variable to float
	RPM1 = strtol(fan1, &endptr1, 10);
	RPM2 = strtol(fan1, &endptr2, 10);

	// add both RPMs together and calculate the average shown in
	// kilo RPM. (i dont know if this is a thing, now it is.)
	avg_RPM = ((RPM1 + RPM2) /2) / 1000.0;

	printf("󰈐 %.1f", avg_RPM);
    return 0;
}
