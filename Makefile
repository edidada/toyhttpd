SRC_DIR = src
CC = cc
CFLAGS = -g

all: single_process_server multiprocess_server select_server poll_server epoll_multiprocess_server
.PHONY: all

single_process_server: single_process_server.o httpd.o
	$(CC) -o single_process_server single_process_server.o httpd.o

multiprocess_server: multiprocess_server.o httpd.o
	$(CC) -o multiprocess_server multiprocess_server.o httpd.o

select_server: select_server.o httpd.o
	$(CC) -o select_server select_server.o httpd.o

poll_server: poll_server.o httpd.o
	$(CC) -o poll_server poll_server.o httpd.o

epoll_multiprocess_server: epoll_multiprocess_server.o httpd.o
	$(CC) -o epoll_multiprocess_server epoll_multiprocess_server.o httpd.o

httpd.o: $(SRC_DIR)/httpd.c
	$(CC) $(CFLAGS) -c $(SRC_DIR)/httpd.c

single_process_server.o: $(SRC_DIR)/single_process_server.c $(SRC_DIR)/httpd.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/single_process_server.c

multiprocess_server.o: $(SRC_DIR)/multiprocess_server.c $(SRC_DIR)/httpd.h
	$(CC) -c $(SRC_DIR)/multiprocess_server.c

select_server.o: $(SRC_DIR)/select_server.c $(SRC_DIR)/httpd.h
	$(CC) -c $(SRC_DIR)/select_server.c

poll_server.o: $(SRC_DIR)/poll_server.c $(SRC_DIR)/httpd.h
	$(CC) -c $(SRC_DIR)/poll_server.c

epoll_multiprocess_server.o: $(SRC_DIR)/epoll_multiprocess_server.c $(SRC_DIR)/httpd.h
	$(CC) -c $(SRC_DIR)/epoll_multiprocess_server.c

clean:
	rm -f httpd.o single_process_server single_process_server.o \
		multiprocess_server multiprocess_server.o select_server.o select_server \
		poll_server poll_server.o epoll_multiprocess_server epoll_multiprocess_server.o
