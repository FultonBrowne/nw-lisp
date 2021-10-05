# mkfile for Plan 9

</$objtype/mkfile

TARG=		ls9
OFILES=		ls9.$O
CLEANFILES=	ls9.image
CFLAGS=		-FVw -Dplan9

ls9.image: $O.out
	echo '(dump-image "ls9.image")  (save)' | ./$O.out  -b \
	-l src/disasm.ls9  -l src/sdoc.ls9 -l \
	src/man.ls9 -l src/info.ls9 \
	-l src/repl.ls9 -l src/boottools.ls9 \
	-l src/profile.ls9

</sys/src/cmd/mkone
