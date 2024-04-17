CC = g++
CFLAGS = -Wall
SOURCE_DIRS = $(patsubst %/,%,$(wildcard */))

.PHONY: all clean $(SOURCE_DIRS)

all: $(SOURCE_DIRS)

$(SOURCE_DIRS):
	$(CC) $(CFLAGS) -o r_$@ $@/main.cpp

clean:
	rm -f $(SOURCE_DIRS)
