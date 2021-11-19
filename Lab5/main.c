
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/types.h>
#include <sys/times.h>
#include <sys/resource.h>

void qSort1(int *A, int n);
void qSort2(int *A, int n);

#define N 1000000

int A[N];

void main(int argc, char *argv[]) {
    srand(time(NULL));
    int i = 0;
    int size = N;
    int pos;
    int tmp;
    struct rusage start;
    struct rusage end;

    getrusage(RUSAGE_SELF, &start);
    A[i] = 0;
    for (i = 1; i < N; i++) {
         A[i] = i / 100;
         // Randomly pick a position in A
         pos = (((rand() % 0x7fff) << 16) | (rand() % 0xffff)) % (i+1);
         // Swap A[i] with A[pos]
         tmp = A[i];
         A[i] = A[pos];
         A[pos] = tmp;
    }
    getrusage(RUSAGE_SELF, &end);
    printf("It took %ld microseconds to initialize the array.\n", end.ru_utime.tv_usec - start.ru_utime.tv_usec);

    // For Part 2:
    // 
    // qSort1(A, N);
    // qSort2(A, N);
	
	return;
}