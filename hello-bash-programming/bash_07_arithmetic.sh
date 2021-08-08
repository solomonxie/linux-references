#!/usr/bin/env bash
# Run: bash bash_07_arithmetic.sh
# What this step adds: integer arithmetic with (( )) and $(( )).
# Step 7: arithmetic

s="Hello, World!"
echo "length: ${#s}"

# Step 7: $(( )) evaluates and returns a value
a=5 b=3
echo "sum: $((a + b))"
echo "mod: $((a % b))"
echo "pow: $((a ** 2))"

# Step 7: (( )) evaluates for its exit code — truthy if non-zero
if ((a > b)); then echo "$a > $b"; fi

# Step 7: increment/compound assignment in place
((a += 10))
echo "a is now $a"

# Step 7: bash arithmetic is integer-only; use bc/awk for floating point
echo "3/2 in bash: $((3 / 2))"          # 1, truncates
echo "3/2 with bc: $(echo "scale=2; 3/2" | bc)"
