PDFLATEX=pdflatex -interaction=nonstopmode
RM=rm

MAIN=resume

$(MAIN): 
	$(PDFLATEX) $(MAIN).tex

.PHONY: clean

clean:
	-$(RM) $(MAIN).pdf *.lof *.log *.lot *.aux *.toc *.blg


