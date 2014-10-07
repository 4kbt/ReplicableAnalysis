include Makefile.inc

CURRENTDIR := $(shell pwd)


waterDensity.pdf : gitlog.log test path
	$(MAKE) -C analysis
	$(MAKE) $(PARALLEL) -C Pictures
	$(MAKE) -C paper

path :
	$(shell sed -i  "s|HOMEDIR := .*|HOMEDIR := $(CURRENTDIR)/|" Makefile.inc)


test: path
	$(MAKE) $(PARALLEL) -C mlib


gitlog.log: 
	git log > gitlog.log

clean:
	$(MAKE) -C mlib clean
	$(MAKE) -C Pictures clean
	$(MAKE) -C analysis clean
	$(MAKE) -C paper clean
	$(MAKE) -C extracted clean
