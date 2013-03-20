# Makefile used on my Ubuntu system.
# Packages needed:
# 	  rubber texlive-common texlive-latex-recommended texlive-fonts-recommended
# 	  texlive-latex-exta.

LATEX=rubber --pdf
BIBTEX=bibtex
FLAGS=

MAIN_TEX = tcc.tex
CHAPTERS= \
	chapters/intro.tex  \
	chapters/nis.tex    \
	chapters/ais.tex    \
	chapters/prop.tex   \
	chapters/fraud.tex

all: tcc.pdf
.PHONY: all clean

tcc.pdf: $(CHAPTERS) tcc.bib tcc.tex
	$(LATEX) $(MAIN_TEX)

clean:
	$(LATEX) --clean $(MAIN_TEX)
