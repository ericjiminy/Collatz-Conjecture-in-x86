# Eric Chun - jc2ppp - 10/30/20 - Makefile                                      

CXX = clang++
CXXFLAGS = -Wall -g
AS = nasm
ASFLAGS = -f elf64 -g
OBJECTS = threexinput.o threexplusone.o

a.out: $(OBJECTS)
	$(CXX) $(CXXFLAGS) $(OBJECTS)

threexinput.o: threexinput.cpp

clean:
	-rm -f *.o *~
