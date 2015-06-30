xetex:
	xelatex template-utf8.tex
	xelatex template-utf8.tex
pdftex:
	pdflatex template.tex
	pdflatex template.tex
master:
	pdflatex template-master.tex
	pdflatex template-master.tex
master-utf8:
	xelatex template-master-utf8.tex
	xelatex template-master-utf8.tex
clean:
	rm -f *.out *.log *.toc *.aux
	rm -f chapter/*.aux 
	rm -f chapter-utf8/*.aux