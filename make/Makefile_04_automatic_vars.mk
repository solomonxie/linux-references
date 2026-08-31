# Run: make -f Makefile_04_automatic_vars.mk
# What this step adds: automatic variables $@ $< $^ $?
# Step 4: automatic variables

NAME = Make
GREETING := Hello, $(NAME)!
OUT_DIR ?= build
CLEAN_FILES = greeting.txt hello.txt copy.txt

.PHONY: clean
hello.txt copy.txt: greeting.txt notes.txt
	# Step 4: $@ = target name, $< = first prereq, $^ = all prereqs, $? = newer prereqs
	echo "target=$@ first=$< all=$^ newer=$?"
	cp greeting.txt $@

greeting.txt:
	echo "$(GREETING)" > greeting.txt

notes.txt:
	echo "notes" > notes.txt

clean:
	rm -rf $(CLEAN_FILES) notes.txt $(OUT_DIR)
