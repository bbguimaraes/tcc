# Makefile used on my Ubuntu system.
# Packages needed:
#     texlive-common, texlive-latex-recommended, texlive-fonts-recommended, texlive-latex-exta.

LATEX=pdflatex
BIBTEX=bibtex
AUX_DIRECTORY=aux
FLAGS=

CHAPTERS= \
	chapters/intro.tex  \
	chapters/nis.tex    \
	chapters/ais.tex    \
	chapters/prop.tex   \
	chapters/fraud.tex

all: tcc.pdf clean
.PHONY: clean all

tcc.pdf: $(CHAPTERS) tcc.bib tcc.tex
	$(LATEX) $(FLAGS) tcc
	$(BIBTEX) tcc
	$(LATEX) $(FLAGS) tcc
	$(LATEX) $(FLAGS) tcc

clean:
	rm -f chapters/*.aux
	rm -f *.aux
	rm -f *.toc
	rm -f *.log
	rm -f *.lof
	rm -f *.bbl
	rm -f *.blg
