#!/usr/bin/env bash
# Common usage examples for: awk

# print a specific column
echo -e "a b c\nd e f" | awk '{print $2}'

# field separator (e.g. csv)
echo "name,age,city" | awk -F',' '{print $1, $3}'

# filter rows matching a pattern
ps aux | awk '/bash/ {print $2, $11}'

# sum a column
printf '1\n2\n3\n' | awk '{sum += $1} END {print sum}'

# print with custom output separator
echo "a b c" | awk 'BEGIN{OFS="-"} {$1=$1; print}'

# NR (line number) / NF (field count)
printf 'x\ny\nz\n' | awk '{print NR": "$0" (fields="NF")"}'

# print lines between two patterns
seq 1 10 | awk '/3/,/6/'
