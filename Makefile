xetex:
	xelatex template-master-utf8.tex
pdftex:
	pdflatex template-master.tex
clean:
	rm *.out *.log *.toc *.aux
	rm chapter/*.aux
	rm chapter-utf8/*.aux
