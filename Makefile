sgct.pdf: sgct.tex
	pdflatex -file-line-error -halt-on-error $<

sgct.tex: sgct.org
	emacs --batch $< -f org-latex-export-to-latex

.PHONY: clean
clean:
	rm -f sgct.tex sgct.tex~
