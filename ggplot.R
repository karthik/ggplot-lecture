
## @knitr setup, include=FALSE
opts_chunk$set(cache=TRUE, message=FALSE)
# smaller font size for chunks
opts_chunk$set(size = 'footnotesize')
options(width = 60)


## @knitr installation, tidy=FALSE, echo=TRUE, eval=FALSE
## install.packages("ggplot2", dependencies = TRUE)


## @knitr some_data, tidy=FALSE, echo=TRUE
head(iris)


## @knitr first_plot , fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
geom_point()


## @knitr first_plotb , eval=FALSE, tidy=FALSE
## ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))
##  + geom_point()
## myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))
## myplot + geom_point()


## @knitr first_plot_size , fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
geom_point(size = 3)


## @knitr first_plot_color , fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
geom_point(size = 3)


## @knitr first_plot_shape , fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
geom_point(aes(shape = Species), size = 3)


## @knitr subset_data, tidy=FALSE, eval=FALSE
## # Make a small sample of the diamonds dataset
## d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ]


## @knitr ex1, echo = FALSE, out.width='.75\\linewidth', fig.height=3
d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ]
ggplot(d2, aes(carat, price, color = color)) + geom_point() + theme_gray()


## @knitr boxplots1 , fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
library(MASS)
ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()


## @knitr histogr , fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
h <- ggplot(faithful, aes(x = waiting))
h + geom_histogram(binwidth = 30, colour = "black")


## @knitr histogra , fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
h <- ggplot(faithful, aes(x = waiting))
h + geom_histogram(binwidth = 8, fill = "steelblue",
colour = "black")


## @knitr line_setup, echo=FALSE
setwd('~/Github/ggplot2-lecture/')


## @knitr linea , fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
climate <- read.csv("climate.csv", header = T)
ggplot(climate, aes(Year, Anomaly10y)) +
geom_line()


## @knitr lineb , fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
ggplot(climate, aes(Year, Anomaly10y)) +
geom_ribbon(aes(ymin = Anomaly10y - Unc10y,
ymax = Anomaly10y + Unc10y),
fill = "blue", alpha = .1) +
geom_line(color = "steelblue")


## @knitr ex2, echo = FALSE, fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold'
cplot <- ggplot(climate, aes(Year, Anomaly10y))
cplot <- cplot + geom_line(size = 0.7, color = "black")
cplot <- cplot + geom_line(aes(Year, Anomaly10y + Unc10y), linetype = "dashed", size = 0.7, color = "red")
cplot <- cplot + geom_line(aes(Year, Anomaly10y - Unc10y), linetype = "dashed", size = 0.7, color = "red")
cplot + theme_gray()


## @knitr barone , fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
ggplot(iris, aes(Species, Sepal.Length)) +
geom_bar(stat = "identity")


## @knitr bartwo , fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
df  <- melt(iris, id.vars = "Species")
ggplot(df, aes(Species, value, fill = variable)) +
geom_bar(stat = "identity")


## @knitr bartwodata , fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
iris[1:2, ]
df  <- melt(iris, id.vars = "Species")
df[1:2, ]


## @knitr barthree , fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
ggplot(df, aes(Species, value, fill = variable)) +
geom_bar(stat = "identity", position = "dodge")


## @knitr ex3, fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold', echo = FALSE
ggplot(d2, aes(clarity, fill = cut)) +
geom_bar(position = "dodge",stat = "bin") + theme_gray()


## @knitr ex4, echo = FALSE, warning = FALSE, fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold'
clim <- read.csv('climate.csv', header = TRUE)
clim$sign <- ifelse(clim$Anomaly10y<0, FALSE, TRUE)
# or as simple as
# clim$sign <- clim$Anomaly10y < 0
ggplot(clim, aes(Year, Anomaly10y)) + geom_bar(stat = "identity", aes(fill = sign)) + theme_gray()


## @knitr densityone , eval=TRUE, fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
ggplot(faithful, aes(waiting)) + geom_density()


## @knitr densityonefove , eval=TRUE, fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
ggplot(faithful, aes(waiting)) +
geom_density(fill = "blue", alpha = 0.1)


## @knitr densitytwo , , fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
ggplot(faithful, aes(waiting)) +
geom_line(stat = "density")


## @knitr color_list2, eval = FALSE, fig.width=4, fig.height=6, out.width='.75\\linewidth'
## aes(color = variable)
## aes(color = "black")
## # Or add it as a scale
## scale_fill_manual(values = c("color1", "color2"))


## @knitr color_list, eval = FALSE, fig.width=4, fig.height=5, out.width='.75\\linewidth'
## library(RColorBrewer)
## display.brewer.all()


## @knitr barcolors, fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
df  <- melt(iris, id.vars = "Species")
ggplot(df, aes(Species, value, fill = variable)) +
geom_bar(stat = "identity", position = "dodge") +
scale_fill_brewer(palette = "Set1")


## @knitr facetgridcolors, eval = TRUE, fig.width=4, fig.height=3, out.width='.75\\linewidth', tidy=FALSE
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
geom_point() +
facet_grid(Species ~ .) +
scale_color_manual(values = c("red", "green", "blue"))


## @knitr facetgrid1, eval = TRUE, fig.width=4, fig.height=3, out.width='.75\\linewidth', tidy=FALSE
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
geom_point() +
facet_grid(Species ~ .)


## @knitr facet_grid2, eval = TRUE, fig.width=4, fig.height=3, out.width='.75\\linewidth', tidy= FALSE
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
geom_point() +
facet_grid(. ~ Species)


## @knitr facet_wrap, eval = TRUE, fig.width=4, fig.height=3, out.width='.75\\linewidth', tidy = FALSE
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
geom_point() +
facet_wrap( ~ Species)


## @knitr adding_stats,, eval = TRUE, fig.width=5, fig.height=2, out.width='.75\\linewidth', tidy=FALSE
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
geom_point(aes(shape = Species), size = 3) +
geom_smooth(method = "lm")


## @knitr adding_stats2,, eval = TRUE, tidy=FALSE, fig.width=7, fig.height=3, out.width='.75\\linewidth'
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
geom_point(aes(shape = Species), size = 3) +
geom_smooth(method = "lm") +
facet_grid(. ~ Species)


## @knitr theme_list, eval = FALSE, fig.width=4, fig.height=6, out.width='.75\\linewidth'
## + theme()
## # see ?theme() for more options


## @knitr facet_wrap_theme, eval = FALSE, fig.width=4, fig.height=6, out.width='.75\\linewidth', tidy=FALSE
## ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
## geom_point(size = 1.2, shape = 16) +
## facet_wrap( ~ Species) +
## theme(legend.key = element_rect(fill = NA),
## legend.position = "bottom",
## strip.background = element_rect(fill = NA),
## axis.title.y = element_text(angle = 0))


## @knitr facet_wrap_theme_execc, eval = TRUE, echo = FALSE, fig.width=4, fig.height=3, out.width='.75\\linewidth'
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
geom_point(size = 1.2, shape = 16) +
facet_wrap( ~ Species) +
theme(legend.key = element_rect(fill = NA),
legend.position = "bottom",
strip.background = element_rect(fill = NA),
axis.title.y = element_text(angle = 0))


## @knitr facet_wrap_theme_exec, eval = FALSE, echo = TRUE, fig.width=4, fig.height=3, out.width='.75\\linewidth'
## install.packages('ggthemes')
## library(ggthemes)
## # Then add one of these themes to your plot
##  + theme_stata()
##  + theme_excel()
##  + theme_wsj()
##  + theme_solarized()


## @knitr custom_plots, eval=FALSE, tidy=FALSE
## my_custom_plot <- function(df) {
##     ggplot(df, ...)
## }


## @knitr scale_list, eval=FALSE, tidy=FALSE
## scale_fill_discrete(), scale_colour_discrete()
## scale_fill_hue(), scale_color_hue()
## scale_fill_manual(),  scale_color_manual()
## scale_fill_brewer(), scale_color_brewer()
## scale_linetype(), scale_shape_manual()


## @knitr boxplots3 , fig.width=6, fig.height=4, out.width='.75\\linewidth', fig.show='hold',  tidy=FALSE
library(MASS)
ggplot(birthwt, aes(factor(race), bwt)) +
geom_boxplot(width = .2) +
scale_y_continuous(labels = (paste0(1:4, " Kg")),
breaks = seq(1000, 4000, by = 1000))


## @knitr scale_1, eval = FALSE, out.width='.75\\linewidth', tidy = FALSE
## # Assign the plot to an object
## dd <- ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
## geom_point(size = 4, shape = 16) +
## facet_grid(. ~Species)
## # Now add a scale
## dd +
## scale_y_continuous(breaks = seq(2, 8, by = 1),
## labels = paste0(2:8, " cm"))


## @knitr pub0, eval = FALSE, out.width='.75\\linewidth'
## ggsave('~/path/to/figure/filename.png')


## @knitr pub1, eval = FALSE, out.width='.75\\linewidth'
## ggsave(plot1, file = "~/path/to/figure/filename.png")


## @knitr pub2, eval = FALSE, out.width='.75\\linewidth', tidy = FALSE
## ggsave(file = "/path/to/figure/filename.png", width = 6,
## height =4)


## @knitr pub3, eval = FALSE, out.width=".75\\linesewidth"
## ggsave(file = "/path/to/figure/filename.eps")
## ggsave(file = "/path/to/figure/filename.jpg")
## ggsave(file = "/path/to/figure/filename.pdf")


