
pdfjam --suffix scale --scale 0.98 1.pdf
pdfnup --nup 2x2 --no-landscape 1-scale.pdf 1-scale.pdf 1-scale.pdf 1-scale.pdf
pdfjam --suffix scale --scale 0.98 2.pdf
pdfnup --nup 2x2 --no-landscape 2-scale.pdf 2-scale.pdf 2-scale.pdf 2-scale.pdf

pdftk 1-scale-nup.pdf 2-scale-nup.pdf cat output final.pdf

pdfjam --suffix scale --scale 0.98 final.pdf

#bash bw_conv.sh final.pdf



