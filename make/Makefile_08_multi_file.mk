# Run: make -f Makefile_08_multi_file.mk
# What this step adds: include, splitting config into a separate file.
# Step 8: include

CC = cc
SRCS := $(wildcard *.c)
OBJS := $(patsubst %.c,%.o,$(SRCS))

# Step 8: pull shared/reusable settings from another file
include config_08.mk

.PHONY: clean
all: $(OBJS)
	@echo "CFLAGS=$(CFLAGS) from config_08.mk"

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

foo.c:
	echo 'int foo(void) { return 0; }' > foo.c

clean:
	rm -f foo.c $(OBJS)
