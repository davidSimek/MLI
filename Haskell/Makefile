HC = ghc
CFLAGS = -Wall
SOURCE_DIRS = $(patsubst %/,%,$(wildcard */))

.PHONY: all clean $(SOURCE_DIRS)

all: $(SOURCE_DIRS)

$(SOURCE_DIRS):
	$(HC) $(CFLAGS) -o r_$@ $@/Main.hs
	rm $@/Main.hi $@/Main.o

clean:
	rm -f $(SOURCE_DIRS)
