include ../Makefile.inc

LIN=linearityAnalysis
HIST=histograms
RAW=rawData

all: $(LIN).eps density $(HIST).eps $(RAW).eps

density: *.m
	$(OCT) determineDensity.m


$(LIN).dat : $(LIN).m
	$(OCT) $<

$(LIN).eps :  $(LIN).gpl $(LIN).dat
	$(GNU) $<

$(HIST).eps : $(HIST).gpl density
	$(GNU) $<

$(RAW).eps : $(RAW).gpl
	$(GNU) $<

clean:
	-rm *.dat
	-rm *.eps
