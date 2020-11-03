.PHONY: resume watch clean

resume: resume.pdf resume.html 

watch:
	ls *.md *.css | entr make resume

name := $(shell grep "^\#" resume.md | head -1 | sed -e 's/^\#[[:space:]]*//' | xargs)

resume.html: preamble.html resume.md postamble.html
	mkdir -p dist 
	cat preamble.html | sed -e 's/___NAME___/$(name)/' > dist/$@
	python3 -m markdown -x smarty resume.md >> dist/$@
	cat postamble.html >> dist/$@

resume.pdf: resume.html resume.css
	cp resume.css dist/resume.css
	python3 -m weasyprint dist/resume.html dist/resume.pdf

clean:
	rm -R dist
