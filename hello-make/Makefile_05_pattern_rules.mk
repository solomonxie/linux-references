# Run: make -f Makefile_05_pattern_rules.mk
# What this step adds: pattern rules (%.o: %.c) to compile any .c to .o.
# Step 5: pattern rules

CC = cc
SRCS = foo.c bar.c
OBJS = $(SRCS:.c=.o)   # Step 5: substitution reference, one form of patsubst

.PHONY: clean
all: $(OBJS)

# Step 5: one rule handles every .c -> .o pair, using $< / $@ from step 4
%.o: %.c
	$(CC) -c $< -o $@

foo.c:
	echo 'int foo(void) { return 0; }' > foo.c

bar.c:
	echo 'int bar(void) { return 0; }' > bar.c

clean:
	rm -f $(SRCS) $(OBJS)
