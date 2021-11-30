
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/resource.h>

void qSort1(int *A, int n);
void qSort2(int *A, int n);

#define N 32000000

int A[N];

void main(int argc, char *argv[]) {
    srand(time(NULL));
    int i = 0;
    int size = N;
    int pos;
    int tmp;
    struct rusage start;
    struct rusage end;
    struct rusage res;

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
    /*
    printf("start time: %ld + %ld = %ld\n", start.ru_utime.tv_sec*1000000, start.ru_utime.tv_usec,
		    start.ru_utime.tv_sec*1000000 + start.ru_utime.tv_usec
	  );
    printf("end time: %ld + %ld = %ld\n", end.ru_utime.tv_sec*1000000, end.ru_utime.tv_usec,
			end.ru_utime.tv_sec*1000000 + end.ru_utime.tv_usec	    
	  );
    */

    // timersub(&(start.ru_utime), &(end.ru_utime), &(res.ru_utime));
    /*
    printf("It took %ld + %ld = %ld microseconds to initialize the array.\n", 
		    (end.ru_utime.tv_sec - start.ru_utime.tv_sec)*1000000,
		    (end.ru_utime.tv_usec - start.ru_utime.tv_usec),
		    (end.ru_utime.tv_sec - start.ru_utime.tv_sec)*1000000 + 
		    (end.ru_utime.tv_usec - start.ru_utime.tv_usec)
	  );
    */
    printf("It took %ld microseconds to initialize the array.\n", 
		    (end.ru_utime.tv_sec - start.ru_utime.tv_sec)*1000000 + 
		    (end.ru_utime.tv_usec - start.ru_utime.tv_usec)
	  );
    // printf("It took %ld microseconds to initialize the array.\n", res.ru_utime.tv_usec);
    // printf("size of suseconds_t: %lu\n", sizeof(suseconds_t));

    // For Part 2:
    /*** QSORT 1 ***/ 
    /*
    getrusage(RUSAGE_SELF, &start);
    qSort1(A, N);
    getrusage(RUSAGE_SELF, &end);
    
    printf("It took %ld microseconds for qSort1.\n", 
		    (end.ru_utime.tv_sec - start.ru_utime.tv_sec)*1000000 + 
		    (end.ru_utime.tv_usec - start.ru_utime.tv_usec)
	  );
    
    printf("It took %ld + %ld = %ld microseconds for qSort1.\n", 
		    (end.ru_utime.tv_sec - start.ru_utime.tv_sec)*1000000,
		    (end.ru_utime.tv_usec - start.ru_utime.tv_usec),
		    (end.ru_utime.tv_sec - start.ru_utime.tv_sec)*1000000 + 
		    (end.ru_utime.tv_usec - start.ru_utime.tv_usec)
	  );
    */


    /*** QSORT 2 ***/
    
    getrusage(RUSAGE_SELF, &start);
    qSort2(A, N);
    getrusage(RUSAGE_SELF, &end);
    printf("It took %ld microseconds for qSort2.\n", 
		    (end.ru_utime.tv_sec - start.ru_utime.tv_sec)*1000000 + 
		    (end.ru_utime.tv_usec - start.ru_utime.tv_usec)
	  );
    
    printf("It took %ld + %ld = %ld microseconds for qSort2.\n", 
		    (end.ru_utime.tv_sec - start.ru_utime.tv_sec)*1000000,
		    (end.ru_utime.tv_usec - start.ru_utime.tv_usec),
		    (end.ru_utime.tv_sec - start.ru_utime.tv_sec)*1000000 + 
		    (end.ru_utime.tv_usec - start.ru_utime.tv_usec)
	  );
    
    	
	return;
}
