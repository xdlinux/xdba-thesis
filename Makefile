xetex:
	xelatex template-utf8.tex
	xelatex template-utf8.tex
pdftex:
	pdflatex template.tex
	pdflatex template.tex
clean:
	rm *.out *.log *.toc *.aux
	rm chapter/*.aux
	rm chapter-utf8/*.aux
