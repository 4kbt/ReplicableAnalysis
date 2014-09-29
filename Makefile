include Makefile.inc

CURRENTDIR := $(shell pwd)

waterDensity.pdf : gitlog.log
	$(shell sed -i  "s|HOMEDIR := .*|HOMEDIR := $(CURRENTDIR)/|" Makefile.inc)
	$(MAKE) $(PARALLEL) -C mlib
	$(MAKE) -C paper.lyx 

gitlog.log: 
	git log > gitlog.log

clean:
	$(MAKE) -C mlib clean
