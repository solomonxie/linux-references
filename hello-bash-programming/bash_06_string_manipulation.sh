#!/usr/bin/env bash
# Run: bash bash_06_string_manipulation.sh
# What this step adds: parameter expansion for string manipulation.
# Step 6: string manipulation

fruits=(apple banana cherry)
echo "count: ${#fruits[@]}"

s="Hello, World!"

# Step 6: length, substring, case conversion
echo "length: ${#s}"
echo "substr: ${s:7:5}"      # "World"
echo "upper: ${s^^}"
echo "lower: ${s,,}"

# Step 6: search/replace
echo "replaced: ${s/World/Bash}"
echo "replaced all: ${s//o/0}"

# Step 6: default values and stripping
unset UNSET_VAR
echo "default: ${UNSET_VAR:-fallback}"
path="/usr/local/bin/tool"
echo "basename: ${path##*/}"    # strip longest match from the front
echo "dirname: ${path%/*}"      # strip shortest match from the back

# Step 6: pattern matching with [[ =~ ]] (regex)
if [[ "$s" =~ ^Hello ]]; then echo "matches Hello prefix"; fi
