#!/bin/bash

echo "Compile-thesis Script, (c) Dominique Guinard www.guinard.org";
echo "Please feel free to distribute under GPL License.";

compile="compile";
compileclean="compile-clean";
viewcommand="view";

if test -z "$1"
then
  echo "Usage: compile | compile-clean [view]"
	exit
fi

if [ $1 = $compileclean ]; then 
	echo "Housekeeping, please wait till it's clean!"
	rm main.ps
	rm *.*~
	rm *.backup
	rm main.out
	rm main.brf
	rm web.brf
	rm *.blg
	rm *.bbl
	rm *.ind
	rm *.ilg
	rm *.mtc*
	rm main.bmt
	rm *.aux
	rm *.toc
	rm *.lot
	rm *.lol
	rm *.log
	rm *.lof
	rm main.idx
	rm main.pdf
	rm chapters/*.bak
	rm chapters/*.backup
	rm chapters/*.aux
	rm chapters/*.log
	echo "Cleaned!"
fi

echo "Compiling... please wait this is gonna take a while..."
pdflatex -interaction=nonstopmode main.tex
bibtex main
bibtex web
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex

echo "Allllllll right, job done Sir!";

if test -z "$2" 
then
	exit
fi

if [ $2 = $viewcommand ]; then 
	acroread main.pdf&
fi
