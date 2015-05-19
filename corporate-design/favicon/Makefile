all: favicon.ico apple-touch-icons

apple-touch-icons: apple-touch-icon-152x152.png apple-touch-icon-120x120.png apple-touch-icon-76x76.png apple-touch-icon-60x60.png

favicon.ico: favicon-16x16.ico favicon-32x32.ico
	convert $^ $@

favicon-16x16.png:
	perl favicon.pbm.pl | convert - -transparent white $@

favicon-%.ico: favicon-16x16.png
	convert $< -scale $* $@

apple-touch-icon-%.png: favicon-16x16.png
	convert $< -scale $* $@

clean:
	rm -f apple-touch-icon-*.png favicon-*.png favicon*.ico
