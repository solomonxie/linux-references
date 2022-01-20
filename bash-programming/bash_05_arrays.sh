#!/usr/bin/env bash
# Run: bash bash_05_arrays.sh
# What this step adds: indexed and associative arrays.
# Step 5: arrays

greet() { echo "hello, $1"; }
greet carol

# Step 5: indexed array
fruits=(apple banana cherry)
echo "first: ${fruits[0]}"
echo "all: ${fruits[@]}"
echo "count: ${#fruits[@]}"
fruits+=(date)   # append

for f in "${fruits[@]}"; do echo "fruit: $f"; done

# Step 5: associative array (bash 4+) — needs explicit declare -A
declare -A colors=([apple]=red [banana]=yellow [cherry]=dark-red)
echo "apple is ${colors[apple]}"
for k in "${!colors[@]}"; do echo "$k -> ${colors[$k]}"; done
