#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

long func(long c) {
  long d = 3;
  return c + d;
}

int main() {
  long a = 1;
  long b = 2;
  long e = func(a * b);
  return 0;
}