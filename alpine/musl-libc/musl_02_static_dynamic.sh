#!/usr/bin/env sh
# Run: sh musl_02_static_dynamic.sh (on Alpine)
# What this step adds: static vs dynamic linking against musl.
# Step 2: static vs dynamic linking

file /bin/busybox
ldd /bin/busybox

# Step 2: dynamically linked — depends on the shared musl at runtime
apk add gcc musl-dev
echo 'int main(void){return 0;}' > t.c
cc t.c -o t_dynamic
ldd t_dynamic

# Step 2: statically linked — musl makes static builds cheap (small, no libc.so needed)
cc -static t.c -o t_static
file t_static
ldd t_static   # errors: "not a dynamic executable"

rm -f t.c t_dynamic t_static
