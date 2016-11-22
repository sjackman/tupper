all: README.md

.DELETE_ON_ERROR:
.SECONDARY:

README.md: tupper.md
	cp $< $@

%.html %.md: %.rmd
	Rscript -e 'rmarkdown::render("$<")'
