runtest: main.o subprog.o
	gcc -o runtest main.o subprog.o

main.o: main.c
	gcc -g -c main.c

subprog.o: subprog.c
	gcc -g -c subprog.c

clean:
	rm -f *.o runtest
