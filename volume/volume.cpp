#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){


	// color codes for DWM bar
	char reset_color[15] = "^c#a36943^"; // resets the color to normal
	char crit_color[15]  = "^c#800000^";
	char off_color[15]   = "^c#626262^";


	char volume_str[10];
	char mute[10];


	// get script output to file pointer
	FILE *output = popen("amixer get Master | tail -n1 | grep -Po '\\[\\K[^%]*' | head -n1", "r");
	FILE *output2 = popen("amixer get Master | tail -n 1 | awk '{print $6}' | tr -d '[]'","r");

	// catch error if there is one
	if (output == NULL || output2 == NULL) {
		perror("err!");
		return 1;
	}

	// copy command output to string variable
	fgets(volume_str, 10, output);
	fgets(mute, 10, output2);

	// convert string to integer
	char* endptr;
	long volume_int;

	volume_int = strtol(volume_str, &endptr, 10);

	// close the file pipe
	fclose(output);
	fclose(output2);


	// NOTE: im unable to change the output from "mute" to fit the
	// string "on", the escape character might be the issue.
	

	// print volume status with the corresponding color code
	if (strcmp(mute, "on") != 10){
		printf(" %s--%s",off_color, reset_color);
	}
	else if (volume_int == 0){
		printf("  %lu%s", volume_int, reset_color);
	}
	else if (volume_int >= 1 && volume_int <= 9){
		printf("  %lu%s", volume_int, reset_color);
	}
	else if (volume_int >= 10 && volume_int <= 19){
		printf(" %lu%s", volume_int, reset_color);
	}
	else if (volume_int >= 20 && volume_int <= 99){
		printf(" %lu%s", volume_int, reset_color);
	}
	else if (volume_int == 100){
		printf(" %d%s", 99, reset_color);
	}
	else if (volume_int > 100){
		printf("%s %lu%s",crit_color, volume_int, reset_color);
	}

	return 0;
}
