# Makefile used on my Ubuntu system.
# Packages needed:
#     texlive-common, texlive-latex-recommended, texlive-fonts-recommended.

CHAPTERS= \
	chapters/intro.tex  \
	chapters/nis.tex    \
	chapters/ais.tex    \
	chapters/prop.tex   \
	chapters/fraud.tex

all: tcc.pdf

tcc.pdf: $(CHAPTERS) tcc.bib tcc.tex
	pdflatex tcc
	bibtex tcc
	pdflatex tcc
	pdflatex tcc

clean:
	rm -f chapters/*.aux
	rm -f *.aux
	rm -f *.toc
	rm -f *.log
	rm -f *.lof
	rm -f *.bbl
	rm -f *.blg
