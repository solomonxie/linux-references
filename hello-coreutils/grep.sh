#!/usr/bin/env bash
# Common usage examples for: grep

# basic pattern match
printf 'apple\nbanana\ncherry\n' | grep an

# case-insensitive
printf 'Apple\nBanana\n' | grep -i apple

# invert match
printf 'a\nb\nc\n' | grep -v b

# recursive search in a directory, show filenames + line numbers
grep -rn "TODO" . 2>/dev/null | head -5

# count matches
printf 'a\nb\na\n' | grep -c a

# match whole word only
printf 'cat\ncatalog\n' | grep -w cat

# extended regex / multiple patterns
printf 'foo\nbar\nbaz\n' | grep -E 'foo|baz'

# show context lines around a match
printf '1\n2\n3\n4\n5\n' | grep -C1 3
