#The program name (8 char max)
PROGRAM_NAME = PROGRAM
#The program ext (COM or EXE)
PROGRAM_EXT = COM


all: clean program

program:
	./buildenv/build.sh $(PROGRAM_NAME) $(PROGRAM_EXT)

clean:
	rm -f $(PROGRAM_NAME).$(PROGRAM_EXT)
	rm -f $(PROGRAM_NAME).sh
	

