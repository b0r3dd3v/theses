.PHONY: all clean

all: a.pdf b.pdf bstellingen.pdf berr-sep.pdf

berr-sep.pdf: common-lite.tex berr-sep.tex berr.tex
	latexmk -pdf -use-make berr-sep.tex

common.tex: common-lite.tex

common-lite.tex: main.bib

bstellingen.pdf: bstellingen.tex
	latexmk -pdf -use-make bstellingen.tex

astellingen.pdf: astellingen.tex
	latexmk -pdf -use-make astellingen.tex

a.pdf: common.tex cstar.tex a.tex vn.tex proc.tex
	latexmk -pdf -use-make a.tex

b.pdf: common.tex b.tex btitle.tex dils.tex eff.tex bintr.tex bfinal.tex \
				berr.tex bsols.tex
	latexmk -pdf -use-make b.tex

cstar.pdf: common.tex cstar.tex
	latexmk -pdf -use-make cstar.tex

vn.pdf: common.tex vn.tex
	latexmk -pdf -use-make vn.tex

proc.pdf: common.tex proc.tex
	latexmk -pdf -use-make proc.tex

misc.pdf: common.tex misc.tex
	latexmk -pdf -use-make misc.tex

clean:
	latexmk -CA
	-rm *.{bbl,parsectoc,log}
