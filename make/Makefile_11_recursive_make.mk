# Run: make -f Makefile_11_recursive_make.mk
# What this step adds: recursive make — invoking $(MAKE) in a subdirectory.
# Step 11: recursive make

SUBDIR = sub_11

.PHONY: all clean
all: $(SUBDIR)/sub.mk
	# Step 11: -C changes dir before reading the subdir's makefile
	$(MAKE) -C $(SUBDIR) -f sub.mk

$(SUBDIR)/sub.mk:
	mkdir -p $(SUBDIR)
	printf 'all:\n\techo "hello from $$(PWD)"\n' > $(SUBDIR)/sub.mk

clean:
	rm -rf $(SUBDIR)
