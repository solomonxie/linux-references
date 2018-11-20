#!/usr/bin/env sh
# Run: sh musl_05_segfault_debugging.sh (on Alpine)
# What this step adds: debugging crashes caused by musl vs glibc assumptions.
# Step 5: debugging musl-specific crashes

apk add gcc musl-dev gdb

# Step 5: a classic bug class — code assuming glibc's larger default
# thread stack size segfaults under musl's smaller default (~128KB vs 8MB)
cat <<'EOF' > deep.c
void recurse(int n) { char buf[4096]; buf[0]=n; if(n) recurse(n-1); }
int main(void) { recurse(100000); return 0; }
EOF
cc deep.c -o deep
./deep || echo "crashed (exit $?)"

# Step 5: fix by raising the thread/stack size explicitly (pthread_attr_setstacksize),
# don't rely on the OS default matching glibc's

# Step 5: inspect a core dump / live crash with gdb same as anywhere else
# gdb ./deep core

rm -f deep.c deep
