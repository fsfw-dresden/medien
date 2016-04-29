TARGET = slides

BIBTEX ?= bibtex
MAKEINDEX ?= makeindex
MAKEGLOSSARIES ?= makeglossaries
PDFLATEX ?= lualatex -halt-on-error -shell-escape
PDFLATEXFULL = $(PDFLATEX) -jobname build/$(TARGET) $(TARGET).tex
VIEWER ?= xdg-open
INKSCAPE ?= inkscape -z

STATIC_SVG = $(wildcard img-src/*.svg)
STATIC_SVG_PDF = $(patsubst img-src/%.svg,pdf-gen/%.pdf,$(STATIC_SVG))

GEN_SVG = svg-gen/website-qr.svg
GEN_SVG_PDF = $(patsubst svg-gen/%.svg,pdf-gen/%.pdf,$(GEN_SVG))

SOURCES = $(STATIC_SVG_PDF) $(GEN_SVG_PDF)

do-build: build/$(TARGET).pdf build/programm-beamer.pdf

build-deps: $(SOURCES)
	@echo $(SOURCES)

build/$(TARGET).pdf: $(TARGET).tex beamercolorthemefsfw.sty $(SOURCES)
	mkdir -p build
	$(PDFLATEXFULL)

build/programm-beamer.pdf: programm-beamer.tex beamercolorthemefsfw.sty $(SOURCES)
	mkdir -p build
	$(PDFLATEX) -jobname build/programm-beamer.pdf programm-beamer.tex

$(STATIC_SVG_PDF): pdf-gen/%.pdf: img-src/%.svg
	@mkdir -p pdf-gen
	$(INKSCAPE) --export-pdf $@ $<

$(GEN_SVG_PDF): pdf-gen/%.pdf: svg-gen/%.svg
	@mkdir -p pdf-gen
	$(INKSCAPE) --export-pdf $@ $<

svg-gen/website-qr.svg:
	mkdir -p svg-gen
	echo 'http://fsfw-dresden.de' | qrencode -t svg -o $@

full: build/$(TARGET).pdf
	$(PDFLATEXFULL)

view: build/$(TARGET).pdf
	$(VIEWER) $<

clean:
	rm -rf build svg-gen pdf-gen

.PHONY: full clean view
