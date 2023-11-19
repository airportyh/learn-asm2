#include <unistd.h>

int main() {
  char buf[64];
  read(2, buf, 64);
  return 0;
}