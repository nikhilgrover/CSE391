#Makefile HW8 Part 2
#Nikhil Grover
CC=gcc
CFLAGS=-g -Wall

default: list_demo list_test

#1
linkedlist: linkedlist.c linkedlist.h
	$(CC) $(CFLAGS) -c linkedlist.c

#2
list_demo: linkedlist.o use_ll_2.c
	$(linkedlist)
	$(CC) $(CFLAGS) -o  list_demo linkedlist.o use_ll_2.c

#3
list_test: linkedlist.o use_linkedlist.c
	$(linkedlist)
	$(CC) $(CFLAGS) -o list_test linkedlist.o use_linkedlist.c

clean: 
	rm -f *.o list_demo list_test

