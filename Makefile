CC = gcc $(CCFLAGS)
CCFLAGS = -std=c99 -pedantic -Wall -O$(CCOPTLVL) $(CCDEBUG)
CCOPTLVL = 0
CCDEBUG =

PROGRAMS = bff tinybfi minibfi microbfi

MINIFY = cat $< | tr -d '\n\t ' > $@
PRINT_SIZE = @ls -la $@ | awk '{print $$9 " is " $$5 " bytes"}'


build : $(PROGRAMS)

.c:
	$(CC) -o $@ $@.c

bff.c : bff.h

microbfi.c : microbfi_formatted.c
	$(MINIFY)
	$(PRINT_SIZE)

.PHONY : build clean rebuild

clean :
	rm -rf bff bff.dSYM tinybfi tinybfi.dSYM minibfi minibfi.dSYM microbfi microbfi.dSYM

rebuild : clean build
