%.o: %.C
	gcc -fpermissive -c -o $@ $<

all: wlink.exe

ALINK.o COMBINE.o UTIL.o OUTPUT.o OBJLOAD.o COFF.o COFFLIB.o : ALINK.h

wlink.exe: ALINK.o COMBINE.o UTIL.o OUTPUT.o OBJLOAD.o COFF.o COFFLIB.o
	gcc -o $@ $^
