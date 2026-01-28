PNG_FILES := $(shell find . -name "*-*.png" | sort)
WEBP_FILES := $(shell find . -name "*.webp" | sort)
TIPS := $(shell find . -name "tip.md" | sort)

BOOK_SOURCE := 0000.intro.md $(TIPS) 9998.themed-index.md 9999.outro.md
BOOK_DEPENDS := $(PNG_FILES) $(BOOK_SOURCE) frontmatter.yaml cover.*

BEGINNER_TIPS := 0001-zip_strict_true/tip.md \
				0013-string_prefixes_and_suffixes/tip.md \
				0019-self-debugging_f-strings/tip.md \
				0027-Enforce_keyword_arguments_for_options/tip.md \
				0044-format_specifier_!r/tip.md

INTERMEDIATE_TIPS := 0008-schedule_cleanup_actions/tip.md \
					0009-map_with_multiple_arguments/tip.md \
					0012-run_length_encoding/tip.md \
					0042-bounded_cache/tip.md \
					0047-batching_API_calls/tip.md

ADVANCED_TIPS := 0005_first_element_that_satisfies_predicate_iterable/tip.md \
				0017-create_context_managers_with_contextmanager/tip.md \
				0026-Notify_parent_class_when_subclassing/tip.md \
				0041-longest_and_shortest/tip.md \
				0046-dot_product/tip.md

PANDOC_OPTIONS := --from markdown+fenced_divs --metadata-file=frontmatter.yaml
LATEX_PANDOC_OPTIONS := $(PANDOC_OPTIONS) --pdf-engine=xelatex
EPUB_PANDOC_OPTIONS := $(PANDOC_OPTIONS) --epub-cover-image=cover.webp

all: drops.pdf drops.epub flashcards.pdf

_toc.yml: $(BOOK_SOURCE) build_toc.py
	uv run build_toc.py

html: _toc.yml
	uv run jb build --all . -W

publish:
	ghp-import -npf _build/html -c drops.mathspp.com

pdf: _toc.yml
	uv run jb build --all --builder pdflatex . -W
	uv run merger.py cover.pdf _build/latex/book.pdf drops.pdf

epub:
	uv run jb build --all --builder=custom --custom-builder=epub -W .
	cp _build/epub/drops.epub drops.epub

.PHONY: frontmatter.yaml
frontmatter.yaml:
	cog -r $@

.PHONY: 9998.themed-index.md
9998.themed-index.md:
	uv run themed_index.py

%.png:
	optimizt --lossless $@

flashcards.pdf: $(PNG_FILES)
	@uv run files_to_pdf.py $@ $(PNG_FILES)

drops.tex: $(BOOK_DEPENDS)
	pandoc -s -o $@ $(LATEX_PANDOC_OPTIONS) $(BOOK_SOURCE)

drops.pdf: $(BOOK_DEPENDS)
	pandoc -s -o no-cover-$@ $(LATEX_PANDOC_OPTIONS) $(BOOK_SOURCE)
	uv run merger.py cover.pdf no-cover-$@ $@

drops.epub: $(BOOK_DEPENDS)
	pandoc -s -o $@ $(EPUB_PANDOC_OPTIONS) $(BOOK_SOURCE)

drops-beginner.pdf: $(BEGINNER_TIPS)
	pandoc -s -o $@ \
	-M title="Beginner Python drops" \
	--from markdown+fenced_divs \
	--metadata-file=free-tips.yaml \
	--pdf-engine=xelatex \
	$(BEGINNER_TIPS)

drops-intermediate.pdf: $(INTERMEDIATE_TIPS)
	pandoc -s -o $@ \
	-M title="Intermediate Python drops" \
	--from markdown+fenced_divs \
	--metadata-file=free-tips.yaml \
	--pdf-engine=xelatex \
	$(INTERMEDIATE_TIPS)

drops-advanced.pdf: $(ADVANCED_TIPS)
	pandoc -s -o $@ \
	-M title="Advanced Python drops" \
	--from markdown+fenced_divs \
	--metadata-file=free-tips.yaml \
	--pdf-engine=xelatex \
	$(ADVANCED_TIPS)

clean:
	rm drops-beginner.pdf drops-intermediate.pdf drops-advanced.pdf drops.pdf drops.epub flashcards.pdf 9998.themed-index.md
	rm -rf _build
