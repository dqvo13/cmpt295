SFLAGS = -S -O2
OFLAGS = -g -c
CFLAGS = -o x

all: x	
	
x:	main.o lsearch_2.o
	gcc $(CFLAGS) main.o lsearch_2.o

main.o:	main.s
	gcc $(OFLAGS) main.s

main.s:	main.c lsearch_2.h
	gcc $(SFLAGS) main.c

lsearch_2.o: lsearch_2.s
	gcc $(OFLAGS) lsearch_2.s

lsearch_2.s: lsearch_2.c lsearch_2.h
	gcc $(SFLAGS) lsearch_2.c

clean:	
	rm -f *.o *.s x
