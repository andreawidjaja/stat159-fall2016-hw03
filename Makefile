.PHONY: data tests eda regression report clean all

all: eda regression report

tests:
	cd code/tests; Rscript -e "library(testthat); render('test-that.R')"

eda:
	cd code/scripts; Rscript eda-script.R

regression:
	cd code/scripts; Rscript regression-script.R

report:
	cd report; Rscript -e "library(rmarkdown); render('report.Rmd')"

data:
	cd data; curl -O http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv > Advertising.csv

clean:
	rm -f report/report.pdf
