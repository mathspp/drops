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

AMAZON_KDP_TIPS := ./0001-zip_strict_true/tip.md ./0002-string_casefold_case-insensitive_comparison/tip.md \
	./0003_type_unions_with_pipe/tip.md ./0004_int_integer_parsing_base/tip.md \
	./0005_first_element_that_satisfies_predicate_iterable/tip.md ./0006_last_element_that_satisfies_condition/tip.md \
	./0007-unique_elements_from_a_list/tip.md ./0008-schedule_cleanup_actions/tip.md ./0009-map_with_multiple_arguments/tip.md \
	./0010-remove_punctuation_from_a_string/tip.md ./0011-count_characters_in_a_file/tip.md ./0012-run_length_encoding/tip.md \
	./0013-string_prefixes_and_suffixes/tip.md ./0014-match_multiple_options/tip.md ./0015-round_negative_places/tip.md \
	./0016-type_statements/tip.md ./0017-create_context_managers_with_contextmanager/tip.md ./0018-immutable_dictionary/tip.md \
	./0019-self-debugging_f-strings/tip.md ./0020-dunder_attribute___file__/tip.md ./0021-current_date_and_time/tip.md \
	./0022-set_operations_with_dict_keys/tip.md ./0023-chain_multiple_dictionaries/tip.md ./0024-Longest_word_in_a_string/tip.md \
	./0025-Dynamic_attribute_manipulation/tip.md ./0026-Notify_parent_class_when_subclassing/tip.md \
	./0027-Enforce_keyword_arguments_for_options/tip.md ./0028-flag_enums/tip.md ./0029-use_literal_type_for_options/tip.md \
	./0030-return_value_of_a_generator/tip.md ./0031-enumerations_of_string_values/tip.md ./0032-most_recently-modified_file/tip.md \
	./0033-normalise_strings_into_ASCII/tip.md ./0034-transpose_list_of_lists/tip.md ./0035-inline_lists_and_tuples_with__/tip.md \
	./0036-typing_iterables_instead_of_lists/tip.md ./0037-multi-dictionary/tip.md ./0038-global_enumeration_members/tip.md \
	./0039-automatic_enumeration_values/tip.md ./0040-os-agnostic_line_splitting/tip.md ./0041-longest_and_shortest/tip.md \
	./0042-bounded_cache/tip.md ./0043-read_files_in_chunks/tip.md ./0044-format_specifier_!r/tip.md \
	./0045-counting_values/tip.md ./0046-dot_product/tip.md ./0047-batching_API_calls/tip.md ./0048-redacting_email_addresses/tip.md \
	./0049-random_choices/tip.md ./0050-dynamic_regex_replacements/tip.md ./0051-string_constants/tip.md \
	./0052-case-insensitive_regex/tip.md ./0053-itertools_classification/tip.md ./0054-t-strings_need_processing/tip.md \
	./0055-structural_unpacking/tip.md ./0056-ergonomic_multiline_strings/tip.md ./0057-underscore_in_the_REPL/tip.md \
	./0058-subclass_immutable_types/tip.md ./0059-idiomatic_sequence_slicing/tip.md ./0060-file_tail/tip.md \
	./0061-one-shot_file_I_O/tip.md ./0062-formatting_big_numbers/tip.md ./0063-named_groups_in_regex/tip.md \
	./0064-resolving_paths/tip.md ./0065-formatting_dates_with_fstrings/tip.md ./0066-concatenate_files_from_handlers/tip.md \
	./0067-generator_recipe/tip.md ./0068-partition_a_string_in_two_halves/tip.md ./0069-regex_multiline_flag/tip.md \
	./0070-extract_assignments_from_conditionals/tip.md ./0071-file_discovery_by_name_pattern/tip.md \
	./0072-structural_pattern_matching_with_dictionaries/tip.md ./0073-slicing_generators_for_debugging/tip.md \
	./0074-peek_at_an_iterable/tip.md ./0075-match_structure_of_custom_objects/tip.md ./0076-next_with_default_value/tip.md \
	./0077-match_an_exact_dictionary_structure/tip.md ./0078-undoable_iterator_with_value_history/tip.md \
	./0079-typing_overloads/tip.md ./0080-bulk_renaming_files/tip.md ./0081-structural_validation_and_homogenisation/tip.md \
	./0082-verbose_regular_expressions/tip.md ./0083-extracting_text_data_into_a_dict/tip.md ./0084-generics_syntax/tip.md \
	./0085-add_lists_together_fast/tip.md ./0086-file_modes/tip.md ./0087-caching_sets_and_frozen_sets/tip.md \
	./0088-constrained_generics/tip.md ./0089-natural_alphabetical_sorting/tip.md ./0090-preserving_decorated_function_metadata/tip.md \
	./0091-timestamp_file_names/tip.md ./0092-temporary_directory/tip.md ./0093-non-local_variables/tip.md \
	./0094-dynamic_width_string_formatting/tip.md ./0095-docstring_attribute/tip.md ./0096-common_hash_implementation/tip.md \
	./0097-match_word_boundaries/tip.md ./0098-custom_containment_checks/tip.md ./0099-readable_object_names/tip.md \
	./0100-filtering_truthy_values/tip.md ./0101-built-in_pretty_printing/tip.md ./0102-__str___vs___repr__/tip.md \
	./0103-typing_args_and_kwargs/tip.md ./0104-ast_parse/tip.md ./0105-dunder_method___missing__/tip.md \
	./0106-custom_enum_search_behaviour/tip.md ./0107-map_strict_True/tip.md ./0108-dynamic_module_attribute_look-up/tip.md \
	./0109-add_typing_to_decorators/tip.md ./0110-non-greedy_regex_quantifiers/tip.md ./0111-typing_simple_functions/tip.md \
	./0112-two-dimensional_range/tip.md

PANDOC_OPTIONS := --from markdown+fenced_divs --metadata-file=frontmatter.yaml
LATEX_PANDOC_OPTIONS := $(PANDOC_OPTIONS) --pdf-engine=xelatex
EPUB_PANDOC_OPTIONS := $(PANDOC_OPTIONS) --epub-cover-image=cover.webp

all: drops.pdf drops.epub flashcards.pdf

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
