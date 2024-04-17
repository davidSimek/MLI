FC = gfortran
CFLAGS = -Wall
SOURCE_DIRS = $(patsubst %/,%,$(wildcard */))

.PHONY: all clean $(SOURCE_DIRS)

all: $(SOURCE_DIRS)

$(SOURCE_DIRS):
	$(FC) $(CFLAGS) -o r_$@ $@/main.f90

clean:
	rm -f $(SOURCE_DIRS)
