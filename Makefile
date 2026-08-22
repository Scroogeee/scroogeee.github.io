lang ?= en-us

clean-render: clean render

clean:
	rm -rf _site

render:
	quarto render content --profile en-us
# add other languages here
	echo '<meta http-equiv="refresh" content="0; url=content/en-us/index.html">' > _site/index.html
	cp setup/.htaccess _site

preview:
	quarto preview content --profile $(LOCALE)

serve: clean render
	echo "serving at http://localhost:8000"
	cd _site && python3 -m http.server 8000
