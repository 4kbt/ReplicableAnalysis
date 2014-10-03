#include ../../Makefile.inc

FILES := $(wildcard *.JPG)
SMALLTARGS := $(addprefix small/,${FILES})

all: $(SMALLTARGS)


small/%.JPG : %.JPG
	convert $< -resize 800x600 $@ 

clean:
	-rm small/*.JPG
