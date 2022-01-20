#!/usr/bin/env bash
# Run: bash bash_04_functions.sh
# What this step adds: functions, arguments, and return values.
# Step 4: functions

for name in alice bob; do echo "hello, $name"; done

# Step 4: a basic function — args come in as $1, $2, ... like a script
greet() {
	local name="$1"   # local keeps it out of the caller's scope
	echo "hello, $name from a function"
}
greet "carol"

# Step 4: "return" only sets the exit code (0-255); use stdout for real values
add() {
	local sum=$(( $1 + $2 ))
	echo "$sum"        # Step 4: caller captures this via $(...)
	return 0
}
result=$(add 2 3)
echo "2 + 3 = $result"

# Step 4: functions see all positional args via $@ same as a script does
print_all() { for a in "$@"; do echo "arg: $a"; done; }
print_all x y z
