#!/usr/bin/env sh
# BusyBox — Alpine's multi-call userland binary, one section per topic, basic to advanced.
# Run: sh busybox.sh (on Alpine)

# ----- 1. overview: busybox --list -----
busybox --list | head -20                   # one binary implements dozens of Unix tools
ls -la /bin/ls /bin/cat /bin/grep           # on Alpine these are usually all BusyBox underneath
busybox ls -la /tmp                         # run an applet explicitly through the binary

# ----- 2. multi-call symlinks -----
ls -la /bin/ls                              # /bin/ls is really just a symlink to busybox
# busybox looks at argv[0] to decide which applet to act as
cp /bin/busybox /tmp/mytool
ln -sf /tmp/mytool /tmp/ls-clone
/tmp/ls-clone -la /tmp   # behaves as `ls` because it was invoked as "ls-clone"...
# (real installs use the exact applet name, e.g. "ls", as the symlink name)
rm -f /tmp/mytool /tmp/ls-clone

# ----- 3. BusyBox vs GNU coreutils differences -----
busybox ls -la /tmp
# BusyBox implements a subset of flags — GNU-only flags just error
# ls --color=auto /tmp        # GNU-only long flag, unsupported by busybox ls
ls -la --color=auto /tmp 2>&1 | head -2 || true
# sed here is busybox sed — no -i '' quirk like BSD, but also no GNU
# extensions like `s///g3` (replace from the 3rd match on)
# find here lacks GNU find's -printf; use -exec / busybox stat instead
find /tmp -maxdepth 1 -type f 2>/dev/null | head -3
# date lacks GNU's `date -d "1 day ago"`; busybox date takes -D fmt + -d value
date -D '%Y-%m-%d' -d '2024-01-01' 2>/dev/null || echo "busybox date syntax differs from GNU"

# ----- 4. ash scripting quirks (advanced) -----
echo $0   # /bin/sh -> ash on Alpine, not bash
# no arrays in ash
# arr=(a b c)   # syntax error in ash; use space-separated strings or a loop
# no [[ ]] test — only POSIX [ ]
val=5
if [ "$val" -gt 3 ]; then echo "gt3"; fi
# no `local` keyword guarantee in strict POSIX sh (ash supports it, but
# don't assume every ash build does — avoid relying on it in portable scripts)
myfunc() { local x=1; echo "$x"; }
myfunc
# no `source`; use POSIX `.`
echo 'export FOO=bar' > /tmp/env.sh
. /tmp/env.sh
echo "$FOO"
rm -f /tmp/env.sh
# no here-string (<<<); use a pipe or heredoc instead
echo "hello" | cat
