# If cc doesn't work here, try changing cc to gcc (GNU C)
# Note: you can use CC=gcc and CFLAGS= -O -Wall, or CC=g++
# You must modify the makefile with CFLAGS = -DINIT_EXTRA=init_xxx_xxx
# in order to build with optional features.
CC=cc
CFLAGS= -O

siod: siod.o slib.o sliba.o trace.o
	$(CC) -o siod siod.o slib.o sliba.o trace.o
siod.o: siod.c siod.h
	$(CC) $(CFLAGS) -c siod.c
slib.o: slib.c siod.h siodp.h
	$(CC) $(CFLAGS) -c slib.c
sliba.o: sliba.c siod.h siodp.h
	$(CC) $(CFLAGS) -c sliba.c
trace.o: trace.c siod.h siodp.h
	$(CC) $(CFLAGS) -c trace.c
