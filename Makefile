.PHONY : all clean

all : bff tinybfi

bff : bff.c bff.h
	gcc -O0 -o bff bff.c

Tinybfi : tinybfi.c
	gcc -O0 -o tinybfi tinybfi.c

clean :
	rm -f bff tinybfi bff.dSYM tinybfi.dSYM
