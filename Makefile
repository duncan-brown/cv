SUFFIXES = .tex .tmp .bbl .dvi .pdf .ps
.SUFFIXES: .tex .tmp .bbl .dvi .pdf .ps

TEXFILES = cv.tex
STYFILES = cv.cls cv.bst cv-cond.bst cv-ref.bst
BIBFILES = papers.tech.bib papers.others.bib papers.ref.bib papers.prep.bib papers.lvc.bib
BBLFILES = cv.1.bbl cv.2.bbl cv.3.bbl 

CLEANFILES = *.aux *.bbl *.dvi *.glo *.idx *.ind *.lof *.lot *.toc *.pdf *.ps *.tmp *.log *.blg

.tex.tmp:; latex $< ; touch $*.tmp ; rm -f $*.dvi
.tmp.bbl:; bibtex $*
.tex.dvi:; latex $< ; latex $<
.tex.pdf:; pdflatex $< ; pdflatex $<
.dvi.ps:; dvips $< -o $@

all: pdf
dvi: cv.dvi
pdf: cv.pdf 
ps: cv.ps
cv.tmp: $(TEXFILES) $(STYFILES)
	latex cv.tex ; touch cv.tmp ; rm -f cv.dvi
cv.dvi: $(TEXFILES) $(STYFILES) $(BBLFILES)
cv.pdf: $(TEXFILES) $(STYFILES) $(BBLFILES)
cv.ps: cv.dvi
cv.1.tmp: cv.tmp
	touch cv.1.tmp
cv.2.tmp: cv.tmp
	touch cv.2.tmp
cv.3.tmp: cv.tmp
	touch cv.3.tmp
cv.1.bbl: $(BIBFILES) cv.1.tmp
cv.2.bbl: $(BIBFILES) cv.2.tmp
cv.3.bbl: $(BIBFILES) cv.3.tmp

clean:
	-test -z "$(CLEANFILES)" || rm -f $(CLEANFILES)

