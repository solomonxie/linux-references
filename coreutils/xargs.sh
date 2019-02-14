#!/usr/bin/env bash
# Common usage examples for: xargs

# turn lines from stdin into arguments of one command
printf 'a\nb\nc\n' | xargs echo

# one invocation per input item
printf 'a\nb\nc\n' | xargs -n1 echo item:

# run in parallel (4 at a time)
seq 1 8 | xargs -P4 -n1 -I{} echo processing {}

# placeholder substitution with -I
printf 'file1\nfile2\n' | xargs -I{} echo "touch {}"

# combine with find to operate on many files safely (handles spaces/newlines)
find . -maxdepth 1 -name "*.md" -print0 | xargs -0 wc -l

# ask before running each command
# printf 'a\nb\n' | xargs -p echo
