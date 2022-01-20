#!/usr/bin/env bash
# Run: bash bash_11_process_substitution.sh
# What this step adds: process substitution — <(...) and >(...).
# Step 11: process substitution

grep "one" <<< "line one"

# Step 11: <(...) makes a command's output look like a file — no temp files
diff <(echo -e "a\nb\nc") <(echo -e "a\nx\nc")

# Step 11: feed multiple command outputs into a command that wants files
paste <(seq 1 3) <(seq 4 6)

# Step 11: >(...) does the reverse — a command's stdin fed from a pipe
echo "logged line" > >(tr 'a-z' 'A-Z')

# Step 11: common real use — comparing `sort`ed output of two commands
diff <(ls /bin | sort) <(ls /usr/bin | sort) | head -5
