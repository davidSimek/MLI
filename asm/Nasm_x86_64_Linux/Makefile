NC = nasm
CFLAGS = -f elf64 -Wall
SOURCE_DIRS = $(patsubst %/,%,$(wildcard */))

.PHONY: all clean $(SOURCE_DIRS)

all: $(SOURCE_DIRS)

$(SOURCE_DIRS):
	$(NC) $(CFLAGS) -o r_$@.o $@/main.asm
	ld -o r_$@ r_$@.o
	rm r_$@.o

clean:
	rm -f $(SOURCE_DIRS)
