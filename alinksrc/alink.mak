CC = gcc -fpermissive -Zomf -c -s -O5

%.obj: %.c
	$(CC) -fpermissive -o $@ $<

all: blink.exe

alink.obj coff.obj cofflib.obj combine.obj output.obj objload.obj util.obj: alink.h

blink.exe: alink.obj coff.obj cofflib.obj combine.obj output.obj objload.obj util.obj
	alink -subsys con @lib/def.rsp -o $@ $^
