# Population_time_series
### Hooks for the editor to set the default target
current: target
-include target.mk

##################################################################

# make files

Sources = Makefile .ignore README.md sub.mk LICENSE.md
include sub.mk

##################################################################

## Cribbed from a wiki called Time_series
## Deleted rules 2018 Jan 01 (Mon)

##################################################################

# HOOK
liberia_confirmed.simple.Rout: simple.R

## Content

Sources += $(wildcard *.tsv) $(wildcard *.R)

## Codfish
cod1678.Rout: pop1678.tsv nafo_cod.Rout pop.R
	$(run-R)

## Gypsy moths
gm10165.Rout: pop10165.tsv gypsy_eggs.Rout pop.R
	$(run-R)

elk.Rout: elk.tsv elkNames.Rout pop.R
	$(run-R)

paramecia.Rout: paramecia.tsv parNames.Rout pop.R
	$(run-R)

%.simple.Rout: %.Rout simple.R
	$(run-R)

%.diff.Rout: %.Rout diff.R
	$(run-R)

elk.elkplot.Rout: elkplot.R
%.elkplot.Rout: %.diff.Rout elkplot.R
	$(run-R)

paramecia.plot.Rout: plot.R
%.plot.Rout: %.diff.Rout plot.R
	$(run-R)

######################################################################

# Data directories

## WA Ebola
wa/%: wa
	cd $< && $(MAKE) $*
	touch $@

wa: 
	/bin/ln -s $(gitroot)//WA_Ebola_Outbreak $@

##################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
