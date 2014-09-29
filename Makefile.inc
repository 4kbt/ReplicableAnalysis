HOMEDIR := /home/charlie/waterDensity/ReplicableAnalysis/

OCT:= octave --no-init-file \
	--eval "global HOMEDIR = \"$(HOMEDIR)\";"\
	--eval 'initializeOctave;'\
	-q 

GNU    := gnuplot -e 'set term dumb' -e 'HOMEDIR = "$(HOMEDIR)"' -d

MLIB   := $(shell find  $(HOMEDIR)/mlib/        -type d) 

DATA   := $(shell find $(HOMEDIR)/parsedData/         -type d)

MLIB   := $(MLIB) $(GLOBAL)

LYX    := lyx -batch --export "pdf2" -dbg info,latex

.INTERACT: 
	$(OCT) --persist

#The dash is meaningful.
.GINTERACT:
	$(GNU) -

.PHONY : 
	@echo $(OCT)
	@echo $(MLIB)

PARALLEL := -j 4

SINGLEQUOTECUTTER := sed -e "s/^.*'\(.*\)'.*$$/\1/"
