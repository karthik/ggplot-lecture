
cd ~/Github/ggplot2-lecture/
rm ggplot.tex
Rscript -e "library(knitr); knit('ggplot.Rnw', quiet = TRUE)"
pdflatex ggplot.tex
open ggplot.pdf
rm *.log
rm *.nav
rm *.out
rm *.snm
rm *.toc
rm *.vrb
# added a comment.
