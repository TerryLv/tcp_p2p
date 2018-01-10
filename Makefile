#CC=gcc
#CPP=g++
APP_BINARY_CLI=client
APP_BINARY_SER=server
VERSION = 0.1
PREFIX=/usr/local/bin

WARNINGS = -Wall


#CFLAGS = -std=gnu99 -O2 -DLINUX -DVERSION=\"$(VERSION)\" $(WARNINGS)
CFLAGS = -O0 -g -DLINUX -DVERSION=\"$(VERSION)\" $(WARNINGS)
CPPFLAGS = $(CFLAGS)
#LDFLAGS += -lpthread

OBJECTS_CLI= client.o
OBJECTS_SER= server.o


all:    client server

clean:
	@echo "Cleaning up directory."
	rm -f *.a *.o $(APP_BINARY_CLI) $(APP_BINARY_SER) core *~ log errlog

install:
	install $(APP_BINARY) $(PREFIX)

# Applications:
client: $(OBJECTS_CLI)
	$(CC)   $(CFLAGS) $(OBJECTS_CLI) $(LDFLAGS) -o $(APP_BINARY_CLI)

server: $(OBJECTS_SER)
	$(CC)   $(CFLAGS) $(OBJECTS_SER) $(LDFLAGS) -o $(APP_BINARY_SER)
