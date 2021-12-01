 SFLAGS = -S -Og
 OFLAGS = -g -c
 CFLAGS = -o mul


mul: main.o times.o
	gcc $(CFLAGS) times.o main.o
	# gcc -o mul times.o main.o

main.o:	main.s
	gcc $(OFLAGS) main.s
	# gcc -g -c main.s

times.o: times.s
	gcc $(OFLAGS) times.s
	# gcc -g -c times.s

main.s:	main.c
	gcc $(SFLAGS) main.c
	# gcc -S -Og main.c

times.s: times.c
	gcc $(SFLAGS) times.c
	# gcc -S -Og times.c

clean:
	rm -f mul *.o
