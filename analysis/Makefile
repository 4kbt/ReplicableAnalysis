include ../Makefile.inc

LIN=linearityAnalysis

all: $(LIN).eps density

density: *.m
	$(OCT) determineDensity.m


$(LIN).dat : $(LIN).m
	$(OCT) $<

$(LIN).eps :  $(LIN).gpl $(LIN).dat
	$(GNU) $<

clean:
	-rm *.dat
	-rm *.eps
