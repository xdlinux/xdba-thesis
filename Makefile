RM = /bin/rm -f

XETEX ?= xelatex
#PDFTEX ?= pdflatex


.PHONY: all clean

all: xetex master

xetex:
	$(XETEX) template.tex
	$(XETEX) template.tex
master:
	$(XETEX) template-master.tex
	$(XETEX) template-master.tex

clean:
	@$(RM) *.out *.log *.toc *.aux
	@$(RM) chapter/*.aux 
