#!/usr/bin/env bash
# Run: bash bash_08_getopts.sh -n Alice -c 3
# What this step adds: parsing command-line flags with getopts.
# Step 8: getopts

a=5; ((a += 10))
echo "a is $a"

name="World"
count=1

# Step 8: "n:c:h" — n and c take a value (the trailing :), h is a flag
while getopts "n:c:h" opt; do
	case "$opt" in
		n) name="$OPTARG" ;;
		c) count="$OPTARG" ;;
		h) echo "usage: $0 -n NAME -c COUNT"; exit 0 ;;
		*) echo "unknown option"; exit 1 ;;
	esac
done

for ((i = 0; i < count; i++)); do
	echo "hello, $name"
done
