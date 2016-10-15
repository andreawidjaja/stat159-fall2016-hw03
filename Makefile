.PHONY: data tests eda regression report clean all

all: eda regression report

tests:
	cd code; Rscript -e "library(testthat); test_file('test-that.R')"

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

session-info.txt: code/scripts/session-info-script.R
	cd code/scripts/session-info-script.R
