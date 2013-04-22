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
	chapters/fraud.tex  \
	chapters/nis.tex    \
	chapters/ais.tex    \
	chapters/eval.tex   \
	chapters/prop.tex   \
	chapters/dev.tex   \
	chapters/outro.tex

.PHONY: all clean

all: tcc.pdf

tcc.pdf: tcc.nls $(CHAPTERS) tcc.bib tcc.tex
	$(LATEX) $(MAIN_TEX)

tcc.nls: $(CHAPTERS)
	makeindex tcc.nlo -s nomencl.ist -o tcc.nls

clean:
	$(LATEX) --clean $(MAIN_TEX)
