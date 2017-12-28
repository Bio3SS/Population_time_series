# Population_time_series
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: paramecia.plot.Rout 

##################################################################

# make files

Sources = Makefile .gitignore README.md sub.mk LICENSE.md
include sub.mk

##################################################################

## Crib

## Not clear whether this chains through default run-R
## Unused rules are currently in ww.mk

## Just added PRECIOUS. Delete all this when you see it next year.

.PRECIOUS: %.R
%.R: /home/dushoff/Dropbox/Downloads/.zzzz/workingwiki-export/Time_series/%.R
	$(copy)

.PRECIOUS: %.tsv
%.tsv: /home/dushoff/Dropbox/Downloads/.zzzz/workingwiki-export/Time_series/%.tsv
	$(copy)

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

paramecia.plot.Rout: plot.R
paramecia.Rout: paramecia.tsv parNames.Rout pop.R
	$(run-R)

%.simple.Rout: %.Rout simple.R
	$(run-R)

%.diff.Rout: %.Rout diff.R
	$(run-R)

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
