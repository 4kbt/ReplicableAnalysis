include ../Makefile.inc

EXTRACTEDDEPS := $(shell grep filename paper.lyx | awk '{print $$2}' | sed 's/\"//g')

#Goes hunting for all directories named extracted, points at all tex files within them.
KNOWNEXTRACTED := $(shell find ../ -type d | grep extracted)
KNOWNEXTRACTED := $(addsuffix /*.tex, $(KNOWNEXTRACTED))

all: presentation.pdf paper.pdf

presentation.pdf : paper.pdf presentation.lyx plots
	$(MAKE) -C plots
	$(LYX) presentation.lyx

paper.pdf : paper.lyx $(EXTRACTEDDEPS) paper.bib gitOut.txt
	$(OCT) ../globalConfig/experimentalConstants.m
	$(HOMEDIR)/bin/mathify.sh $(HOMEDIR)/extracted/*.tex
	$(HOMEDIR)/bin/mathify.sh $(KNOWNEXTRACTED) 
	$(LYX) paper.lyx
	date > buildDate.txt

gitOut.txt:
	git show --summary > $@

test:
	echo $(DEEPMAKES)
	echo $(PLOTTARGETS)
	echo $(KNOWNEXTRACTED)

clean : 
	-rm *.pdf
	-rm *.lyx~
	-rm *.lyx.emergency
	-rm *.aux
	-rm *.bib.bak
	-rm *.log
