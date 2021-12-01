SFLAGS = -S -Og
OFLAGS = -g -c
CFLAGS = -o mul


mul: main.o times.o
	gcc $(CFLAGS) times.o main.o

main.o:	main.s
	gcc $(OFLAGS) main.s

times.o: times.s
	gcc $(OFLAGS) times.s

main.s:	main.c
	gcc $(SFLAGS) main.c

times.s: times.c
	gcc $(SFLAGS) times.c

clean:
	rm -f mul *.s *.o
