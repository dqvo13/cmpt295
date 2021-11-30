// Filename: lsearch_2.c
// Description: A more efficient implementation of the linear search.

int lsearch_2(int *A, int n, int target) {

    // Question 2 a.  Put your code below 
    if (n <= 0) return -1;
    int temp = A[n-1];
    A[n-1] = target;
    int i = 0;
    while (A[i] != target) {
	    i++;
    }

    A[n-1] = temp;
    if (i < n-1) return i;
    else if (A[n-1] == target) return n-1;
    else return -1;


}  // lsearch_2


