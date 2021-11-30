#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "LL.h"

#define N 150

#define NTESTS (2*N)
int A[N];
int P[NTESTS];
int Q[NTESTS];
int cycles[NTESTS];
long total;
int start_time = 0;
int end_time = 0;

void main(int argc, char *argv[]) {
    int choice = 1;      // Choosing array by default
    srand(time(NULL));
    int i;
    List *L = newLL();
    int tmp, pos;

    if (argc == 2) {
        choice = atoi(argv[1]);

        // Build array
        for (i = 0; i < N; i++) {
            A[i] = 2*i;
            pos = (((rand() % 0x7fff) << 16) | (rand() % 0xffff)) % (i+1);
            tmp = A[i];
            A[i] = A[pos];
            A[pos] = tmp;
        }

        // Build LL
        for (i = 0; i < N; i++) {
            appendLL(L, A[i]);
        }

        // Time the code
        for (i = 0; i < NTESTS; i++) {
            asm volatile (
                "cpuid\n\t"
                "rdtscp\n\t"
                "movl %%eax, %0\n\t"
                : "=r" (start_time)
                : 
                : "rax", "rbx", "rcx", "rdx"
            );

            if (choice) P[i] = lsearch(A, N, i);   // choose array
            else Q[i] = LLsearch(L, i);            // choose LL

            asm volatile (
                "cpuid\n\t"
                "rdtscp\n\t"
                "movl %%eax, %0\n\t"
                : "=r" (end_time)
                : 
                : "rax", "rbx", "rcx", "rdx"
            );

            cycles[i] = end_time - start_time;
            if (cycles[i] >= 4000) {
                printf("Sample %d completed in %d clock cycles - DISCARDED.\n", i+1, cycles[i]);
                i--;
            }
        }

        // Display results
        total = 0;
        for (i = 0; i < NTESTS; i++) {
            // printf("Sample %d completed in %d clock cycles.\n", i+1, cycles[i]);
            total += cycles[i];
        }
        printf("Average of %ld clock cycles.\n", total/NTESTS);

        // Recycling
        freeLL(L);
    }
    else
        printf("Must enter either 0 for linked list or 1 for array.\n");

    return;
}

