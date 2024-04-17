CC = rustc
CFLAGS = -W unused -W deprecated -W missing_docs -W missing_debug_implementations
SOURCE_DIRS = $(patsubst %/,%,$(wildcard */))

.PHONY: all clean $(SOURCE_DIRS)

all: $(SOURCE_DIRS)

$(SOURCE_DIRS):
	$(CC) $(CFLAGS) -o r_$@ $@/main.rs

clean:
	rm -f $(SOURCE_DIRS)
