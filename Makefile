.POSIX:
.SUFFIXES:
.SUFFIXES: .tex .pdf
.PHONY: all clean clear

TMP = .temp

all: main.pdf

clean clear:
	@rm -rf .temp
	@rm main.pdf

.tex.pdf:
	latexmk -silent -Werror -outdir=$(TMP)/$(@D) -pdflua $<
	@cp $(TMP)/$@ $@

main.tex: ref.bib $(wildcard preambule/* fig/*)
	@touch main.tex