NC = nasm
CFLAGS = -f win64 -Wall
SOURCE_DIRS = $(patsubst %/,%,$(wildcard */))

.PHONY: all clean $(SOURCE_DIRS)

all: $(SOURCE_DIRS)

$(SOURCE_DIRS):
	$(NC) $(CFLAGS) -o r_$@.obj $@/main.asm
	x86_64-w64-mingw32-gcc -o r_$@.exe r_$@.obj
	rm r_$@.obj

clean:
	rm -f $(SOURCE_DIRS).exe
