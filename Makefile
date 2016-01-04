# Population_time_series
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: gm10165.Rout 

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk

##################################################################

## Crib

## Not clear whether this chains through default run-R
## Unused rules are currently in ww.mk

%.R: /home/dushoff/Dropbox/WorkingWiki-export/Time_series/%.R
	$(copy)

##################################################################

## Content

# HOOK
cod1678.simple.Rout:

Sources += $(wildcard *.tsv) $(wildcard *.R)

cod1678.Rout: pop1678.tsv nafo_cod.Rout pop.R
	$(run-R)

gm10165.Rout: pop10165.tsv gypsy_eggs.Rout pop.R
	$(run-R)

%.simple.Rout: %.Rout simple.R
	$(run-R)

######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
