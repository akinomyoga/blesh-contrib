# -*- mode: makefile-gmake -*-

# files
outdirs += $(OUTDIR)/contrib $(OUTDIR)/contrib/airline
contrib-files = $(wildcard contrib/*.bash contrib/airline/*.bash)
outfiles += $(contrib-files:contrib/%=$(OUTDIR)/contrib/%)
$(OUTDIR)/contrib/%.bash: contrib/%.bash | contrib/.git $(OUTDIR)/contrib $(OUTDIR)/contrib/airline
	cp -p $< $@

# docs
outdirs += $(OUTDIR)/doc/contrib
outfiles-doc += $(OUTDIR)/doc/contrib/LICENSE
outfiles-doc += $(OUTDIR)/doc/contrib/README-ja.md
outfiles-doc += $(OUTDIR)/doc/contrib/README.md
$(OUTDIR)/doc/contrib/%: contrib/% | $(OUTDIR)/doc/contrib
	cp -p $< $@
