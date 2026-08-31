#!/usr/bin/env bash
# Run: bash bash_10_heredocs.sh
# What this step adds: here-documents and here-strings.
# Step 10: heredocs

TMP_FILE=$(mktemp)
echo "scratch data" > "$TMP_FILE"
rm -f "$TMP_FILE"

# Step 10: heredoc — multi-line input, variables expand by default
cat <<EOF
Report for: $(whoami)
Date: $(date +%F)
EOF

# Step 10: quoting the delimiter disables expansion — literal output
cat <<'EOF'
This $will not expand and neither will $this.
EOF

# Step 10: write a heredoc straight into a file
cat <<EOF > /tmp/heredoc_demo.txt
line one
line two
EOF
cat /tmp/heredoc_demo.txt
rm -f /tmp/heredoc_demo.txt

# Step 10: here-string — feed one line into a command's stdin
grep "one" <<< "line one"
