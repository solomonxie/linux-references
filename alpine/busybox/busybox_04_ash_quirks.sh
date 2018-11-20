#!/usr/bin/env sh
# Run: sh busybox_04_ash_quirks.sh (on Alpine)
# What this step adds: advanced — ash (busybox's /bin/sh) vs bash quirks.
# Step 4: ash scripting quirks

echo $0   # /bin/sh -> ash on Alpine, not bash

# Step 4: no arrays in ash
# arr=(a b c)   # syntax error in ash; use space-separated strings or a loop

# Step 4: no [[ ]] test — only POSIX [ ]
val=5
if [ "$val" -gt 3 ]; then echo "gt3"; fi

# Step 4: no `local` keyword guarantee in strict POSIX sh (ash supports it, but
# don't assume every ash build does — avoid relying on it in portable scripts)
myfunc() { local x=1; echo "$x"; }
myfunc

# Step 4: no `source`; use POSIX `.`
echo 'export FOO=bar' > /tmp/env.sh
. /tmp/env.sh
echo "$FOO"
rm -f /tmp/env.sh

# Step 4: no here-string (<<<); use a pipe or heredoc instead
echo "hello" | cat
