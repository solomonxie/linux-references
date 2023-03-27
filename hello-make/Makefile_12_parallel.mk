# Run: make -f Makefile_12_parallel.mk -j4
# What this step adds: parallel builds and opting individual targets out.
# Step 12: parallel builds

.PHONY: all clean pkg
all: a.txt b.txt c.txt

# Step 12: independent targets — safe to build concurrently with -j
a.txt:
	sleep 1; echo a > a.txt
b.txt:
	sleep 1; echo b > b.txt
c.txt:
	sleep 1; echo c > c.txt

# Step 12: .NOTPARALLEL forces this target's own prerequisites to run serially
# (e.g. because `pkg` below isn't safe to build concurrently with itself)
.NOTPARALLEL: pkg
pkg: a.txt b.txt c.txt
	cat a.txt b.txt c.txt > pkg

clean:
	rm -f a.txt b.txt c.txt pkg
