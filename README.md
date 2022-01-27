# wlink
Blatant copy of alink from https://sourceforge.net/projects/alink/. all credit goes to them. ALINK Source Code, V1.6, Copyright 1998-9 Anthony A.J. Williams. 




## Building alink

alink, the Alaska Linker - https://doc.alaska-software.com/content/prgtools_h1_the_alaska_linker_op_minus_alink_exe.html
https://github.com/ricardoquesada/alink

1. Download source from http://alink.sourceforge.net/download.html or https://sourceforge.net/projects/alink/
2. unzip the source code
-- or use this code for all fixes
3. edit the Makefile in Notepad. For all indented lines, replace the indentation spaces by a single tab! (Use a real tab character and not spaces)
4. Take a precompiled version of ALINK.EXE and rename it to blink.exe
5. Place blink.exe into the source code folder that contains the rest of the source code files.
6. make --file=Makefile




## Linking with alink

```
cd C:\Users\U5353\Documents\txt\COFF\NASM

rm hello.exe
rm hello.o
rm hello.obj

C:\Users\U5353\AppData\Local\bin\NASM\nasm.exe -f win32 hello.asm -o hello.obj

C:\Users\U5353\Documents\txt\COFF\NASM\alink\ALINK.EXE hello.obj 
C:\Users\U5353\Documents\txt\COFF\NASM\alink\ALINK.EXE -oPE -subsys con -entry GobleyGook hello.obj
C:\Users\U5353\Documents\txt\COFF\NASM\alink\ALINK.EXE \lib\kernel32.lib -oPE -subsys con -entry GobleyGook hello.obj
C:\Users\U5353\Documents\txt\COFF\NASM\alink\ALINK.EXE -oPE hello.obj C:\windows\System32\kernel32.dll
C:\Users\U5353\Documents\txt\COFF\NASM\alink\ALINK.EXE -oPE hello.obj "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.17763.0\um\x86\kernel32.Lib"

-- THIS WORKS! (you have to download the specific WIN32.LIB from here: http://alink.sourceforge.net/download.html)
C:\Users\U5353\Documents\txt\COFF\NASM\alink\ALINK.EXE -oPE -subsys con hello.obj -entry GobleyGook "C:\Users\U5353\Documents\txt\COFF\NASM\win32lib\WIN32.LIB"
alink_wobi.exe -oPE -subsys con hello.obj -entry GobleyGook "C:\Users\U5353\Documents\txt\COFF\NASM\win32lib\WIN32.LIB"
```

Error Output:
```
Unresolved external GetStdHandle
Unresolved external WriteConsoleA
Unresolved external ExitProcess
```

Solution:
-- THIS WORKS! (you have to download the specific WIN32.LIB from here: http://alink.sourceforge.net/download.html)
C:\Users\U5353\Documents\txt\COFF\NASM\alink\ALINK.EXE -oPE -subsys con hello.obj -entry GobleyGook "C:\Users\U5353\Documents\txt\COFF\NASM\win32lib\WIN32.LIB"

https://stackoverflow.com/questions/24423642/simple-hello-world-in-x86-asm-windows-console

kernel32 is not a C standard library. 
It's a Windows library that provides parts of the Windows API, 
which you will need to use if you want to interact with the OS from your application

https://stackoverflow.com/questions/20063224/linking-to-kernel32-lib-in-assembler
Windows API functions use function name decorations - an underscore + FunctionName + @sizeof parameters, this is a linker thing.

Windows use .obj files, Linux uses .o files. 
an o file (object file) on Linux is much different than an obj file in Windows, they are NOT interchangeable.

https://stackoverflow.com/questions/1023593/how-to-write-hello-world-in-assembler-under-windows
