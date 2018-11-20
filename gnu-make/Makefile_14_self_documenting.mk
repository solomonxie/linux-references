# Run: make -f Makefile_14_self_documenting.mk help
# What this step adds: advanced — a `make help` target that lists targets
# from their own ## trailing comments, so the makefile documents itself.
# Step 14: self-documenting help target

.PHONY: build test clean help
.DEFAULT_GOAL := help

build: ## Compile the project
	@echo building

test: ## Run the test suite
	@echo testing

clean: ## Remove build artifacts
	@echo cleaning

# Step 14: parse this file's own "target: ## description" lines with awk
help:
	@awk 'BEGIN {FS = ":.*## "} /^[a-zA-Z0-9_-]+:.*## / {printf "%-10s %s\n", $$1, $$2}' $(MAKEFILE_LIST)
