#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

long numbers[] = {1, 2, 3, 4, 5, 6, 7};
char buf[10];
char msg[] = "Hello";

int main() {
    int i = 3;
    long l = numbers[i];
    numbers[i] = 5;
    return 0;
}