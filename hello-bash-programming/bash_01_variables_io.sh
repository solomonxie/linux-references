#!/usr/bin/env bash
# Run: bash bash_01_variables_io.sh
# What this step adds: variables, basic output, and reading input.
# Step 1: variables and I/O

NAME="World"
echo "Hello, $NAME!"
printf "Hello, %s! You are %d.\n" "$NAME" 30

# Step 1: read a value into a variable (from stdin)
read -p "Enter your name: " INPUT_NAME
echo "You entered: $INPUT_NAME"

# Step 1: environment vs local shell variable
export MY_ENV_VAR="visible to child processes"
MY_LOCAL_VAR="visible only in this shell"
bash -c 'echo "child sees: $MY_ENV_VAR"'
