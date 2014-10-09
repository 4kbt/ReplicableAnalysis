include ../Makefile.inc

LIN=linearityAnalysis
HIST=histograms

all: $(LIN).eps density $(HIST).eps

density: *.m
	$(OCT) determineDensity.m


$(LIN).dat : $(LIN).m
	$(OCT) $<

$(LIN).eps :  $(LIN).gpl $(LIN).dat
	$(GNU) $<

$(HIST).eps : $(HIST).gpl density
	$(GNU) $<

clean:
	-rm *.dat
	-rm *.eps
