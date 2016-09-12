#!/bin/bash


pdflatex margin.tex

pdftk margin.pdf cat 2 output 1.pdf


/usr/bin/pdfjam --suffix nup --nup '2x2' -- 1.pdf - 1.pdf - 1.pdf - 1.pdf


pdftk 1-nup.pdf cat 1 1 output final.pdf