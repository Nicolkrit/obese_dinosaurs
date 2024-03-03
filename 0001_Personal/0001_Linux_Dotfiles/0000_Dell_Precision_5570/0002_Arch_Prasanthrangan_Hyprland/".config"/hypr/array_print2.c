#include <stdio.h>

#include "array_print.h"

void print_array (const int * begin, const int * end)
  while (begin != end) {
#if WITH_COMMAS
      printf("%d, ", begin)
  }
