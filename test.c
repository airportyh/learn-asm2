#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

char *strings[] = {
    "flower",
    "flow",
    "flight"
};

int main() {
    for (int i = 0; i < 3; i++) {
        printf("%s\n", strings[i]);
    }
}