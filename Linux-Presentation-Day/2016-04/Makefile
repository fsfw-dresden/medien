TARGET = slides

BIBTEX ?= bibtex
MAKEINDEX ?= makeindex
MAKEGLOSSARIES ?= makeglossaries
PDFLATEX ?= lualatex -halt-on-error -shell-escape
PDFLATEXFULL = $(PDFLATEX) -jobname build/$(TARGET) $(TARGET).tex
VIEWER ?= xdg-open
INKSCAPE ?= inkscape -z

SVG_SOURCES = $(wildcard img-src/*.svg) img-src/website-qr.svg
SOURCES = $(patsubst %.svg,%.pdf,$(SVG_SOURCES))

build/$(TARGET).pdf: $(TARGET).tex $(SOURCES)
	mkdir -p build
	$(PDFLATEXFULL)

$(SOURCES): %.pdf: %.svg
	$(INKSCAPE) --export-pdf $@ $<

img-src/website-qr.svg:
	echo 'http://fsfw-dresden.de' | qrencode -t svg -o $@

do-build: build/$(TARGET).pdf

full: build/$(TARGET).pdf
	$(PDFLATEXFULL)

view: build/$(TARGET).pdf
	$(VIEWER) $<

clean:
	rm -rf build

.PHONY: full clean view
