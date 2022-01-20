#!/usr/bin/env bash
# Run: bash bash_03_loops.sh
# What this step adds: for, while, and until loops.
# Step 3: loops

AGE=30
if [[ "$AGE" -ge 18 ]]; then echo "adult"; fi

# Step 3: for over a list
for name in alice bob carol; do
	echo "hello, $name"
done

# Step 3: C-style for
for ((i = 0; i < 3; i++)); do
	echo "i=$i"
done

# Step 3: while
count=0
while [[ $count -lt 3 ]]; do
	echo "count=$count"
	((count++))
done

# Step 3: until — runs while the condition is false
n=3
until [[ $n -eq 0 ]]; do
	echo "countdown: $n"
	((n--))
done
