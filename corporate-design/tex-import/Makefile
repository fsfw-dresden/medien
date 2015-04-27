INKSCAPE=inkscape -z

logo.pdf: logo.svg
	$(INKSCAPE) -f logo.svg --export-pdf logo.pdf

test.pdf: logo.pdf test.tex import.tex
	xelatex test.tex
