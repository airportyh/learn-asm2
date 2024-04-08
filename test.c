#include <sys/types.h>
#include <sys/mman.h>
#include <err.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(void)
{
        char *anon;
        anon = (char*)mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_ANON|MAP_SHARED, -1, 0);

        if (anon == MAP_FAILED) {
            errx(1, "anon failed");
        }

        munmap(anon, 4096);
        return 0;
}