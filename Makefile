# Makefile used on my Ubuntu system.
# Packages needed:
# 	  rubber texlive-common texlive-latex-recommended texlive-fonts-recommended
# 	  texlive-latex-exta.

LATEX=pdflatex
BIBTEX=bibtex
FLAGS=

CHAPTERS= \
	chapters/intro.tex  \
	chapters/nis.tex    \
	chapters/ais.tex    \
	chapters/prop.tex   \
	chapters/fraud.tex

all: tcc.pdf
.PHONY: all clean

tcc.pdf: $(CHAPTERS) tcc.bib tcc.tex
	rubber --pdf tcc.tex

clean:
	rm -f chapters/*.aux
	rm -f *.aux
	rm -f *.toc
	rm -f *.log
	rm -f *.lof
	rm -f *.bbl
	rm -f *.blg
