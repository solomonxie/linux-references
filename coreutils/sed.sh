#!/usr/bin/env bash
# Common usage examples for: sed

# substitute first match per line
echo "foo bar foo" | sed 's/foo/baz/'

# substitute all matches per line
echo "foo bar foo" | sed 's/foo/baz/g'

# in-place edit a file (GNU sed; macOS/BSD sed needs sed -i '' ...)
# sed -i 's/old/new/g' file.txt

# delete lines matching a pattern
printf 'a\nb\nc\n' | sed '/b/d'

# print only matching lines (like grep)
printf 'a\nb\nc\n' | sed -n '/b/p'

# print a line range
seq 1 10 | sed -n '3,5p'

# insert a line before/after a match
printf 'a\nc\n' | sed '/a/a\
b'

# use extended regex
echo "2024-01-31" | sed -E 's/([0-9]+)-([0-9]+)-([0-9]+)/\3\/\2\/\1/'
