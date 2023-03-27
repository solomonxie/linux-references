# Run: make -f Makefile_07_conditionals.mk / make -f Makefile_07_conditionals.mk DEBUG=1
# What this step adds: ifeq / ifdef conditionals.
# Step 7: conditionals

CC = cc
SRCS := $(wildcard *.c)
OBJS := $(patsubst %.c,%.o,$(SRCS))

# Step 7: branch on a variable set from the command line
ifeq ($(DEBUG),1)
CFLAGS = -g -O0 -DDEBUG
else
CFLAGS = -O2
endif

# Step 7: ifdef just checks the variable is set (to anything)
ifdef VERBOSE
Q =
else
Q = @
endif

.PHONY: clean
all: $(OBJS)
	$(Q)echo "CFLAGS=$(CFLAGS)"

%.o: %.c
	$(Q)$(CC) $(CFLAGS) -c $< -o $@

foo.c:
	echo 'int foo(void) { return 0; }' > foo.c

clean:
	rm -f foo.c $(OBJS)
