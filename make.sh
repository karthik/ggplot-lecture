Rscript -e "library(knitr); knit('ggplot.Rnw')"
pdflatex ggplot.tex
open ggplot.pdf
