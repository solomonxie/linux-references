# Run: make -f Makefile_03_variables.mk
# What this step adds: variable assignment flavors (=, :=, ?=, +=).
# Step 3: variables

NAME = Make
GREETING := Hello, $(NAME)!   # Step 3: := expands NAME immediately
NAME = Recursive              # note: GREETING already fixed above
OUT_DIR ?= build              # Step 3: ?= only sets if not already set
CLEAN_FILES = greeting.txt
CLEAN_FILES += hello.txt      # Step 3: += appends

.PHONY: clean
hello.txt: greeting.txt
	cp greeting.txt hello.txt

greeting.txt:
	mkdir -p $(OUT_DIR)
	echo "$(GREETING)" > greeting.txt

clean:
	rm -rf $(CLEAN_FILES) $(OUT_DIR)
