# Run: make -f Makefile_09_order_only.mk
# What this step adds: order-only prerequisites (after |) — built if missing,
# but their timestamp never forces the target to rebuild.
# Step 9: order-only prerequisites

CC = cc
OBJS = foo.o
OUT_DIR = build

.PHONY: clean
all: $(OBJS)

# Step 9: OUT_DIR just needs to exist; its mtime changing shouldn't rebuild foo.o
foo.o: foo.c | $(OUT_DIR)
	$(CC) -c foo.c -o $@

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

foo.c:
	echo 'int foo(void) { return 0; }' > foo.c

clean:
	rm -rf foo.c $(OBJS) $(OUT_DIR)
