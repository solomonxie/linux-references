# Run: make -f Makefile_10_auto_deps.mk (run twice, edit foo.h, run again)
# What this step adds: automatic header-dependency tracking via -MMD/-MP.
# Step 10: generated dependencies

CC = cc
SRCS = foo.c
OBJS = $(SRCS:.c=.o)
DEPS = $(SRCS:.c=.d)   # Step 10: one .d file per .o, listing its #included headers

.PHONY: clean
all: $(OBJS)

%.o: %.c
	$(CC) -MMD -MP -c $< -o $@

# Step 10: include the generated .d files so header edits trigger rebuilds;
# '-' silences the error on the first run, before any .d files exist yet
-include $(DEPS)

foo.h:
	echo '#define GREETING "hi"' > foo.h

foo.c: foo.h
	echo '#include "foo.h"' > foo.c
	echo 'const char *g = GREETING;' >> foo.c

clean:
	rm -f foo.h foo.c $(OBJS) $(DEPS)
