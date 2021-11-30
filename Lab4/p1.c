#include <stdio.h>

int proc2(int, int);

void proc1(char *s, int *a, int *b) {
    int v;
    int t;

    t = *a;
    v = proc2(*a, *b);

    sprintf(s, "The result of proc2(%d,%d) is %d.", *a, *b, v);

    *a = *b - 2;
    *b = t;

    return;
}
