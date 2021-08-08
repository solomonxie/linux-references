#!/usr/bin/env bash
# Run: bash bash_02_conditionals.sh
# What this step adds: if/[[ ]] conditionals and exit codes.
# Step 2: conditionals

NAME="World"
echo "Hello, $NAME!"

# Step 2: [[ ]] is bash's preferred test — supports &&, ||, pattern matching
AGE=30
if [[ "$AGE" -ge 18 ]]; then
	echo "adult"
elif [[ "$AGE" -ge 13 ]]; then
	echo "teen"
else
	echo "child"
fi

# Step 2: string comparisons and pattern matching
if [[ "$NAME" == W* ]]; then echo "starts with W"; fi

# Step 2: every command has an exit code; 0 = success
grep -q "root" /etc/passwd && echo "root found" || echo "not found"
echo "last exit code: $?"
