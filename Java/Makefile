JC = javac
CFLAGS = -Xlint:all
SOURCE_DIRS = $(patsubst %/,%,$(wildcard */))

.PHONY: all clean $(SOURCE_DIRS)

all: $(SOURCE_DIRS)

$(SOURCE_DIRS):
	$(JC) -d . $(CFLAGS) $@/R_$@.java

clean:
	rm -f $(SOURCE_DIRS)
