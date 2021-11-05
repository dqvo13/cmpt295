#include <stdio.h>
#include <stdlib.h>

typedef unsigned char *byte_pointer;

void show_bytes(byte_pointer, size_t);
void show_bytes_2(byte_pointer, size_t);
void show_bits(int);
void show_int(int);
void show_float(float);
void show_pointer(void *) ;
int  mask_LSbits(int);

int main() {
    int ival = 12345;
    float fval = (float) ival;
    int *pval = &ival;

    printf("word size: %ld\n", 8 * sizeof(size_t));

    show_int(ival);
    show_float(fval);
    show_pointer(pval);

/* Add your test cases here in order
   to test your new functions. */

    // SHOWING BITS
    printf("showing bits for 12345:\n");
    show_bits(12345);
    printf("showing bits for -12345:\n");
    show_bits(-12345);
    printf("showing bits for 1:\n");
    show_bits(1);
    printf("showing bits for -1:\n");
    show_bits(-1);
    printf("showing bits for 0:\n");
    show_bits(0);
    printf("showing bits for 3:\n");
    show_bits(3);
    printf("showing bits for 4:\n");
    show_bits(4);
    printf("showing bits for 157:\n");
    show_bits(157);
    printf("showing bits for 248:\n");
    show_bits(248);
    printf("showing bits for -74:\n");
    show_bits(-74);
    printf("showing bits for -117:\n");
    show_bits(-117);
    printf("showing bits for 32767:\n");
    show_bits(32767);

    printf("\n");

    // MASKING
    int getMask1 = mask_LSbits(0);
    int getMask2 = mask_LSbits(-5);
    int getMask3 = mask_LSbits(32);
    int getMask4 = mask_LSbits(33);
    int getMask5 = mask_LSbits(2);
    int getMask6 = mask_LSbits(15);
    int getMask7 = mask_LSbits(64);
    int getMask8 = mask_LSbits(65);

    printf("result of maskLSbits(0): %d\n", getMask1);
    printf("result of maskLSbits(-5): %d\n", getMask2);
    printf("result of maskLSbits(32): %d\n", getMask3);
    printf("result of maskLSbits(33): %d\n", getMask4);
    printf("result of maskLSbits(2): %d\n", getMask5);
    printf("result of maskLSbits(15): %d\n", getMask6);
    printf("result of maskLSbits(64): %d\n", getMask7);
    printf("result of maskLSbits(65): %d\n", getMask8);

    return 0;

}
