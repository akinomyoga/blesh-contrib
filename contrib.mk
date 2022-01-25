# -*- mode: makefile-gmake -*-

contrib-subdirs := airline config
contrib-outdirs := $(OUTDIR)/contrib $(contrib-subdirs:%=$(OUTDIR)/contrib/%)
contrib-srcfiles := $(wildcard contrib/*.bash $(contrib-subdirs:%=contrib/%/*.bash))
contrib-outfiles := $(contrib-srcfiles:contrib/%=$(OUTDIR)/contrib/%)

# files
outdirs += $(contrib-outdirs)
outfiles += $(contrib-outfiles)
$(OUTDIR)/contrib/%.bash: contrib/%.bash | contrib/.git $(contrib-outdirs)
	cp -p $< $@

# docs
outdirs += $(OUTDIR)/doc/contrib
outfiles-doc += $(OUTDIR)/doc/contrib/LICENSE
outfiles-doc += $(OUTDIR)/doc/contrib/README-ja.md
outfiles-doc += $(OUTDIR)/doc/contrib/README.md

# Note (workaround for make-3.81): 当初 $(OUTDIR)/doc/contrib/% に対してルール
# を記述していたが make-3.81 に於いて正しく適用されない事が分かった。仕方がない
# ので LICENSE と %.md の二つの規則に分けて書く事にする。
$(OUTDIR)/doc/contrib/LICENSE: contrib/LICENSE | $(OUTDIR)/doc/contrib
	cp -p $< $@
$(OUTDIR)/doc/contrib/%.md: contrib/%.md | $(OUTDIR)/doc/contrib
	cp -p $< $@
