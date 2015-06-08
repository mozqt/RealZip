CC = gcc
LIBS = -lz
CFLAGS = -Wall -std=gnu99
CFLAGS64 = -D_LARGEFILE64_SOURCE $(CFLAGS)
#all: main.o
#	$(CC) $(CFLAGS64) -o final main.o zip.o ioapi.o $(LIBS)
#	
#main.o: main.c
##	$(CC) $(CFLAGS64) -c main.c $(LIBS)

all: create

create: ioapi.o zip.o main.o
	$(CC) -o realzip ioapi.o zip.o main.o $(LIBS)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS64) $(LIBS)

clean:
	rm -rf *.o
