# Population_time_series
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: cod1678.Rout 

##################################################################


# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk

##################################################################

## Crib

## Not clear whether this chains through default run-R
## Unused rules are currently in ww.mk

%.R: /home/dushoff/git/Bio3SS_content/WorkingWiki-export/Time_series/%
	$(copy)

##################################################################

## Content

cod1678.Rout: pop1678.tsv nafo_cod.Rout pop.R
	$(run-R)

######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
