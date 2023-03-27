#!/usr/bin/env sh
# musl libc — Alpine's C library vs glibc, one section per topic, basic to advanced.
# Run: sh musl-libc.sh (on Alpine)

# ----- 1. overview: musl vs glibc -----
ls -la /lib/ld-musl-*.so.1                 # Alpine's dynamic linker is musl's, not glibc's
file /bin/busybox
ldd /bin/busybox
# glibc systems show /lib64/ld-linux-x86-64.so.2 instead — that loader is
# absent on Alpine, which is why glibc-built binaries fail here

# ----- 2. static vs dynamic linking -----
apk add gcc musl-dev
echo 'int main(void){return 0;}' > t.c
cc t.c -o t_dynamic                        # dynamic — depends on shared musl at runtime
ldd t_dynamic
cc -static t.c -o t_static                 # static — musl makes this cheap (small, no libc.so)
file t_static
ldd t_static   # errors: "not a dynamic executable"
rm -f t.c t_dynamic t_static

# ----- 3. DNS resolution quirks -----
cat /etc/resolv.conf
# musl's resolver is much simpler than glibc's nsswitch-based one — no
# /etc/nsswitch.conf support, no built-in mdns/nss plugin loading
apk add bind-tools
nslookup example.com
# gotchas: musl only reads the first 3 "nameserver" lines and has no DNS
# caching daemon (glibc-based distros often have nscd/systemd-resolved);
# musl also has no support for /etc/hosts wildcard/glob entries

# ----- 4. gcompat: running unmodified glibc binaries -----
# without gcompat, a glibc-linked binary fails immediately — there's no
# /lib64/ld-linux-x86-64.so.2 on Alpine to load it
# ./some-glibc-binary   # -> "not found" / exec format errors
apk add gcompat
ls /lib/ld-linux-x86-64.so.2 2>/dev/null   # now present, symlinked by gcompat
# still not a full glibc — complex binaries (many syscalls, NSS plugins,
# locale data) may still fail; gcompat covers common cases only

# ----- 5. debugging musl-specific crashes -----
apk add gcc musl-dev gdb
# classic bug class — code assuming glibc's larger default thread stack
# size segfaults under musl's smaller default (~128KB vs 8MB)
cat <<'EOF' > deep.c
void recurse(int n) { char buf[4096]; buf[0]=n; if(n) recurse(n-1); }
int main(void) { recurse(100000); return 0; }
EOF
cc deep.c -o deep
./deep || echo "crashed (exit $?)"
# fix by raising thread/stack size explicitly (pthread_attr_setstacksize),
# don't rely on the OS default matching glibc's
# gdb ./deep core   # inspect a core dump / live crash same as anywhere else
rm -f deep.c deep

# ----- 6. building third-party software against musl (advanced) -----
apk add build-base   # gcc, make, musl-dev, and friends
# common friction points on musl:
# - code using glibc-only headers/macros (_GNU_SOURCE extensions)
# - code assuming glibc typedefs like `__u8` from <bits/*.h>
# - missing `execinfo.h` (backtrace()) — glibc-only, no musl equivalent
# - autotools scripts that `#include <error.h>` (glibc-only)
# typical fix — patch or configure around, don't fight the whole toolchain;
# many projects have --disable-* flags for optional glibc-specific features
# Example: ./configure CC=cc --disable-nls && make && make install
