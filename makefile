PNG_FILES := $(shell find . -name "*.png" | sort)
WEBP_FILES := $(shell find . -name "*.webp" | sort)
TIPS := $(shell find . -name "tip.md" | sort)

BOOK_SOURCE := 0000.intro.md $(TIPS) 9998.themed-index.md 9999.outro.md
BOOK_DEPENDS := $(PNG_FILES) $(BOOK_SOURCE) frontmatter.yaml cover.*

PANDOC_OPTIONS := --from markdown+fenced_divs --metadata-file=frontmatter.yaml
LATEX_PANDOC_OPTIONS := $(PANDOC_OPTIONS) --pdf-engine=xelatex
EPUB_PANDOC_OPTIONS := $(PANDOC_OPTIONS) --epub-cover-image=cover.webp

all: drops.pdf drops.epub flashcards.pdf

.PHONY: frontmatter.yaml
frontmatter.yaml:
	uv tool run cog -r $@

.PHONY: 9998.themed-index.md
9998.themed-index.md:
	uv run themed_index.py

flashcards.pdf: $(PNG_FILES)
	optimizt --lossless $(PNG_FILES)
	@uv run files_to_pdf.py $@ $(PNG_FILES)

drops.tex: $(BOOK_DEPENDS)
	uvx pandoc -s -o $@ $(LATEX_PANDOC_OPTIONS) $(BOOK_SOURCE)

drops.pdf: $(BOOK_DEPENDS)
	uvx pandoc -s -o no-cover-$@ $(LATEX_PANDOC_OPTIONS) $(BOOK_SOURCE)
	uv run merger.py cover.pdf no-cover-$@ $@

drops.epub: $(BOOK_DEPENDS)
	uvx pandoc -s -o $@ $(EPUB_PANDOC_OPTIONS) $(BOOK_SOURCE)

clean:
	rm drops.pdf drops.epub flashcards.pdf 9998.themed-index.md
