#!/bin/bash


pdflatex margin.tex

pdftk margin.pdf cat 2 output 1.pdf
pdftk margin.pdf cat 3 output 2.pdf


/usr/bin/pdfjam --suffix nup --nup '2x2' -- 1.pdf - 1.pdf - 1.pdf - 1.pdf
/usr/bin/pdfjam --suffix nup --nup '2x2' -- 2.pdf - 2.pdf - 2.pdf - 2.pdf


pdftk A=1-nup.pdf B=2-nup.pdf cat A B output final.pdf