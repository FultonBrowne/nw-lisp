CFLAGS=	-g -O2

all:	ls9 ls9.image # prolog # lisp9.ps

ls9:	ls9.c
	$(CC) $(CFLAGS) -o ls9 ls9.c

ls9.image:	ls9 ls9.ls9
	rm -f ls9.image
	./ls9  -l src/disasm.ls9  -l src/sdoc.ls9 -l \
	src/man.ls9 -l src/info.ls9 \
	-l src/repl.ls9 -l src/boottools.ls9 \
	-l src/profile.ls9 src/build.ls9

test:	ls9 ls9.image
	./ls9 test.ls9
	$(CC) $(CFLAGS) -Dnative -o ls9k ls9.c
native: test

clean:
	rm -f ls9 ls9k ls9.image *.oimage \
		 a.out *.core
