#CC = clang
CC = gcc

WARNINGS = -std=c11 -pedantic -Wall -Wextra -Wconversion -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Wnested-externs -D_POSIX_C_SOURCE=20160116

CFLAGS = $(WARNINGS) -Wall -mtune=native -march=native -pipe -fpic -O3 -funroll-loops -fuse-linker-plugin -frename-registers -fweb -fomit-frame-pointer -funswitch-loops -funsafe-math-optimizations -fno-common
LDFLAGS = -lm 

source = $(wildcard *.c)
obj = $(source:.c=.o)

all:	libwigner.so 

libwigner.so: $(obj)
	$(CC) $(LDFLAGS) -shared -Wl,-soname,libwigner.so.1 $(obj) -o libwigner.so


%.o : %.c
	$(CC) $(CFLAGS) -o $@ -c $<



