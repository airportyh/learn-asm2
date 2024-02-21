#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

long func2(long a, long b, long c) {
    return a + b + c;
}

long func(long a, long b, long c) {
    long d = func2(2, 3, c);
    return a + b + c + d;
}

int main() {
    long ans = func(3, 4, 5);
    printf("%lu", ans);
}