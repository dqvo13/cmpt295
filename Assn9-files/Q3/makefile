SFLAGS = -S -O2
OFLAGS = -g -c
CFLAGS = -o x

all: x	
	
x:	main.o LL.o
	gcc $(CFLAGS) main.o LL.o

main.o:	main.s
	gcc $(OFLAGS) main.s

main.s:	main.c LL.h
	gcc $(SFLAGS) main.c

LL.o: LL.s
	gcc $(OFLAGS) LL.s

LL.s: LL.c LL.h
	gcc $(SFLAGS) LL.c

clean:	
	rm -f *.o *.s x
