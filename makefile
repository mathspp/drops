PNG_FILES := $(shell find . -name "*.png" | sort)
WEBP_FILES := $(shell find . -name "*.webp" | sort)
TIPS := $(shell find . -name "tip.md" | sort)

BOOK_SOURCE := 0000.intro.md $(TIPS) 9999.outro.md
BOOK_DEPENDS := $(PNG_FILES) $(BOOKS_SOURCE) frontmatter.yaml cover.*

all: drops.pdf drops.epub flashcards.pdf

.PHONY: frontmatter.yaml
frontmatter.yaml:
	uv tool run cog -r $@

flashcards.pdf: $(PNG_FILES)
	optimizt --lossless $(PNG_FILES)
	@uv run files_to_pdf.py $@ $(PNG_FILES)

drops.pdf: $(BOOK_DEPENDS)
	uvx pandoc -s -o no-cover-$@ \
        --from markdown+fenced_divs \
        --metadata-file=frontmatter.yaml \
        --pdf-engine=xelatex \
        0000.intro.md $(TIPS) 9999.outro.md
	uv run merger.py cover.pdf no-cover-$@ $@

drops.epub: $(BOOK_DEPENDS)
	uvx pandoc -s -o $@ \
        --from markdown+fenced_divs \
        --metadata-file=frontmatter.yaml \
        --pdf-engine=xelatex \
        --epub-cover-image=cover.webp \
        $(TIPS)

clean:
	rm drops.pdf drops.epub flashcards.pdf
