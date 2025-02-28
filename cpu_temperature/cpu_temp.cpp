#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){

	FILE *tempeture_cmd;
	char tempeture[5];

	char* endptr;
	double tempeture_float;

	// color codes for DWM
	char yellow[] = "^c#b27e3e^";
	char red[]    = "^c#924747^";
	char reset[]  = "^c#a36943^";

	// get tempeture from script
	tempeture_cmd = popen("sensors | awk '/Core 0/ {print $3 } ' | tr -d \"+°C\"","r");

	// catch err if empty
	if (tempeture_cmd == NULL){
		perror("err!");
		return 1;
	}

	// convert file output to string
	fgets(tempeture, 5, tempeture_cmd);

	// convert string to integer
	sscanf(tempeture, "%lf", &tempeture_float);

	// close FILE pipe
	fclose(tempeture_cmd);



	if (tempeture_float >= 70 && tempeture_float < 80){
		printf("%s %.0f%s",yellow ,tempeture_float, reset);
	}
	else if (tempeture_float >= 80){
		printf("%s %.0f%s",red ,tempeture_float, reset);
	}
	else {
		printf(" %.0f%s",tempeture_float, reset);
	}

	return 0;
}
