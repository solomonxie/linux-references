#!/usr/bin/env bash
# Common usage examples for: find

# find by name (case-insensitive)
find . -iname "*.md" 2>/dev/null | head -5

# find by type (f=file, d=directory)
find . -maxdepth 1 -type d

# find files modified in the last 1 day
find . -maxdepth 2 -mtime -1 2>/dev/null

# find files larger than 1M
find . -type f -size +1M 2>/dev/null

# find and delete (dangerous — dry run first without -delete)
# find . -name "*.tmp" -delete

# find and run a command on each match
find . -maxdepth 1 -name "*.md" -exec wc -l {} \;

# exclude a directory from the search
find . -path ./.git -prune -o -type f -print | head -5
