.PHONY: data tests eda regression report clean all

all: report eda regression

data:
	curl -O data/Advertising.csv http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv

tests:
	Rscript -e “library(testthat); test_file(‘test-that.R’)”

eda: code/scripts/eda-script.R data/Advertising.csv
	cd code/scripts; Rscript eda-script.R
	cd code/scripts; Rscript session-info-script.R

regression: code/scripts/regression-script.R data/Advertising.csv
	cd code/scripts; Rscript regression-script.R;

report/report.pdf: report/report.Rmd
	cd report; Rscript -e "library(rmarkdown); render('report.Rmd')"

clean:
	rm -f report/report.pdf
