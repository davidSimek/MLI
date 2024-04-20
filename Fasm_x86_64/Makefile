FC = fasm
SOURCE_DIRS = $(patsubst %/,%,$(wildcard */))

.PHONY: all clean $(SOURCE_DIRS)

all: $(SOURCE_DIRS)

$(SOURCE_DIRS):
	$(FC) $(CFLAGS) $@/main.asm r_$@

clean:
	rm -f $(SOURCE_DIRS)
