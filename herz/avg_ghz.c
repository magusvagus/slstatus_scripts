#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {

  FILE *FilePath;
  char string[20];
  char final[20];
  char src[30];
  
  // read the data from the cpu freq file, and check if not empty
  FilePath = fopen("/sys/devices/system/cpu/cpufreq/policy0/scaling_cur_freq", "r");

  if (NULL == FilePath) {
    printf("err!");
  };

  // copy FilePath content to string variable
  fgets(string, 20, FilePath);
  fclose(FilePath);


  // convert string variable to integer and then to GHz
  char* endptr;
  double GHz;

  long Hz = strtol(string, &endptr, 10);

  GHz = Hz / 1000000.0;
  printf(" %.1f", GHz);

  return 0;
}
