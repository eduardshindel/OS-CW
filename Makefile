CC := g++ -Wall -Werror
FLAGS := -std=c99
FLAG := -std=c11
LDFLAGS=-ldl

.PHONY: clean

all: serv client libhelp.so

client: src/client.c
	gcc src/client.c -o client

libhelp.so: dlib/help.o
	gcc ./dlib/help.o -shared -o ./dlib/libhelp.so
	
dlib/help.o: dlib/h.c
	gcc -c -fPIC ./dlib/h.c -o ./dlib/help.o
	
clean:
	rm serv client

serv: src/server.c
	gcc src/server.c -L./dlib/libhelp.so -o serv -ldl
