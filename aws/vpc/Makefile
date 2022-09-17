.PHONY: default
default:
	@echo Usage:
	@echo 'make [check] - Format and validate .tf files.'
	@echo 'make [docs]  - Generate docs using terraform-docs.'

.PHONY: check
check:
	@terraform fmt .
	@terraform validate .

.PHONY: docs
docs:
	@terraform-docs markdown table --output-file README.md --output-mode inject .