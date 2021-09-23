/*
*   Danh Vo
*   301425444
*/

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef unsigned char *byte_pointer;

void show_bytes(byte_pointer start, size_t len) {
    size_t i;

    for (i = 0; i < len; i++)
		printf("0x%p 0x%.2x\n", &start[i], start[i]);
    printf("\n");
}

// Put your answer to Question 3 b) here as a comment
/*
* the machine is little endian
* 
* for pointer value: the memory address is displayed backwards,
* meaning the LSB appears first, a trait of a little endian machine
* 
* e.g. 006FFB9C is printed as 9C FB 6F 00 on target machine
*/

void show_bytes_2(byte_pointer start, size_t len) {
    size_t i;

    for (i = 0; i < len; i++)
        printf("0x%p 0x%.2x\n", (start+i), *(start+i));
    printf("\n");	
}

// Put your answer to Question 3 d) here
void show_bits(int x) {
    int w = 8 * sizeof(size_t);
    char* bits = (char*)malloc(w+1);
    if (bits == NULL) return;
    // initializing array
    for (int i = 0; i < w; i++)
        bits[i] = '0';
    bits[w] = '\0';

    // negative #s
    bool neg = false;
    int cpy = x;
    if (x < 0 || cpy < 0) {
        neg = true;
        cpy *= -1;
    }

    for (int i = w - 1; i >= 0; i--) {
        if (cpy == 0) i = -1;
        if (cpy % 2 == 1)
            bits[i] = '1';
        cpy = cpy / 2;
    }

    // two's complement for negative #s
    if (neg) {
        // flip all bits
        for (int i = 0; i < w; i++) {
            if (bits[i] == '0')
                bits[i] = '1';
            else
                bits[i] = '0';
        }
        // add 1
        bool carry = true;
        for (int i = w - 1; i >= 0; i--) {
            if (carry) {
                if (bits[i] == '1')
                    bits[i] = '0';
                else {
                    bits[i] = '1';
                    carry = false;
                    i = -1;
                }
            }
        }
    }

    printf("%s\n", bits);

    free(bits);
}

// Put your answer to Question 3 e) here
int mask_LSbits(int n) {
    int w = 8 * sizeof(size_t);
    int mask = -1;          // all 1s

    if (n >= w)
        return mask;
    else if (n <= 0)
        return 0;

    mask = mask << n;       // fills n 0s on right
    mask = ~mask;           // inverts bits so n 0s become n 1s
    return mask;
}

void show_int(int x) {
	printf("\nival = %d\n", x); 
    show_bytes((byte_pointer) &x, sizeof(int)); 
	show_bytes_2((byte_pointer) &x, sizeof(int)); 
}

void show_float(float x) {
    printf("fval = %f\n", x); 	
    show_bytes((byte_pointer) &x, sizeof(float));
    show_bytes_2((byte_pointer) &x, sizeof(float)); 
}

void show_pointer(void *x) {
	printf("pval = %p\n", x); 
    show_bytes((byte_pointer) &x, sizeof(void *));
    show_bytes_2((byte_pointer) &x, sizeof(void *));
}