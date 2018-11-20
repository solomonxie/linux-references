# Run: make -f Makefile_06_functions.mk
# What this step adds: built-in functions — wildcard, patsubst, shell.
# Step 6: functions

CC = cc
SRCS := $(wildcard *.c)              # Step 6: wildcard() finds files at parse time
OBJS := $(patsubst %.c,%.o,$(SRCS))  # Step 6: patsubst() instead of the : shorthand
HOSTNAME := $(shell hostname)        # Step 6: shell() runs a command, captures stdout

.PHONY: clean info
all: $(OBJS)
	@echo "built on $(HOSTNAME)"

%.o: %.c
	$(CC) -c $< -o $@

foo.c:
	echo 'int foo(void) { return 0; }' > foo.c

bar.c:
	echo 'int bar(void) { return 0; }' > bar.c

info:
	@echo "sources: $(SRCS)"
	@echo "objects: $(OBJS)"

clean:
	rm -f foo.c bar.c $(OBJS)
